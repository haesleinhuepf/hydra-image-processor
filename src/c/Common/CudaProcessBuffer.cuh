#pragma once

#include "CudaKernels.cuh"
#include "defines.h"
#define DEVICE_VEC
#include "Vec.h"
#undef DEVICE_VEC
#include "CudaUtilities.cuh"
#include "CudaStorageBuffer.cuh"
#include "assert.h"
#include <limits>
#include "ImageContainer.h"

#ifdef __CUDACC__
#define CUDA_CALLS_ON (1)
#pragma message("__CUDACC__ was defined")
#else
#define CUDA_CALLS_ON (0)
#pragma message("NOPE!")
#endif // __CUDACC__

template<typename ImagePixelType>
class CudaProcessBuffer
{
public:
	//////////////////////////////////////////////////////////////////////////
	// Constructor / Destructor
	//////////////////////////////////////////////////////////////////////////

	CudaProcessBuffer(Vec<size_t> dims, bool isColumnMajor=false, int device=0)
	{
		defaults();
		this->imageDims = dims;
		this->device = device;
		UNSET = Vec<size_t>((size_t)-1,(size_t)-1,(size_t)-1);
		deviceSetup();
		memoryAllocation();
	}

	CudaProcessBuffer(size_t x, size_t y, size_t z, bool isColumnMajor=false, int device=0)
	{
		defaults();
		imageDims = Vec<size_t>(x,y,z);
		this->device = device;
		UNSET = Vec<size_t>((size_t)-1,(size_t)-1,(size_t)-1);
		deviceSetup();
		memoryAllocation();
	}

	CudaProcessBuffer(int n, bool isColumnMajor=false, int device=0)
	{
		defaults();
		imageDims = Vec<size_t>(n,1,1);
		this->device = device;

		UNSET = Vec<size_t>((size_t)-1,(size_t)-1,(size_t)-1);
		deviceSetup();
		memoryAllocation();
	}

	~CudaProcessBuffer()
	{
		clean();
	}

	// End Constructor / Destructor

	//////////////////////////////////////////////////////////////////////////
	// Copy Constructors
	//////////////////////////////////////////////////////////////////////////

	CudaProcessBuffer (const CudaProcessBuffer<ImagePixelType>* bufferIn){copy(bufferIn);}
	CudaProcessBuffer& operator=(const CudaProcessBuffer<ImagePixelType>* bufferIn)
	{
		if (this == bufferIn)
			return *this;

		clean();
		copy(bufferIn);
		return *this;
	}

	// End Copy Constructors

	//////////////////////////////////////////////////////////////////////////
	// Setters / Getters
	//////////////////////////////////////////////////////////////////////////

	void loadImage(const ImageContainer* image)
	{
		if (image->getDims().product()>bufferSize)
		{
			int device = this->device;
			clean();
			this->device = device;
			imageDims = image->getDims();
			deviceSetup();
			memoryAllocation();
		}
		else
		{
			isCurrentHistogramHost = false;
			isCurrentHistogramDevice = false;
			isCurrentNormHistogramHost = false;
			isCurrentNormHistogramDevice = false;
		}

		imageDims = image->getDims();
		currentBuffer = 0;
		reservedBuffer = -1;

		getCurrentBuffer()->loadImage(image->getConstMemoryPointer(),imageDims);
	}

	void loadImage(const ImagePixelType* image, Vec<size_t> dims)
	{
		if (dims.product()>bufferSize)
		{
			int device = this->device;
			clean();
			this->device = device;
			imageDims = dims;
			deviceSetup();
			memoryAllocation();
		}
		else
		{
			isCurrentHistogramHost = false;
			isCurrentHistogramDevice = false;
			isCurrentNormHistogramHost = false;
			isCurrentNormHistogramDevice = false;
		}

		imageDims = dims;
		currentBuffer = 0;
		reservedBuffer = -1;
		HANDLE_ERROR(cudaMemcpy((void*)getCurrentBuffer(),image,sizeof(ImagePixelType)*imageDims.product(),cudaMemcpyHostToDevice));
	}

	ImagePixelType otsuThresholdValue()
	{
		int temp;//TODO
		return calcOtsuThreshold(retrieveNormalizedHistogram(temp),NUM_BINS);
	}

	ImagePixelType* retrieveImage(ImagePixelType* imageOut=NULL)
	{
		if (currentBuffer<0 || currentBuffer>NUM_BUFFERS)
		{
			return NULL;
		}
		if (imageOut==NULL)
			imageOut = new ImagePixelType[imageDims.product()];

		HANDLE_ERROR(cudaMemcpy(imageOut,getCurrentBuffer(),sizeof(ImagePixelType)*imageDims.product(),cudaMemcpyDeviceToHost));
		return imageOut;
	}

	void retrieveImage(ImageContainer* imageOut)
	{
		if (currentBuffer<0 || currentBuffer>NUM_BUFFERS)
		{
			return;
		}

		HANDLE_ERROR(cudaMemcpy(imageOut->getMemoryPointer(),getCurrentBuffer(),sizeof(ImagePixelType)*imageDims.product(),
			cudaMemcpyDeviceToHost));
	}

	/*
	*	Returns a host pointer to the histogram data
	*	This is destroyed when this' destructor is called
	*	Will call the needed histogram creation methods if not all ready
	*/
	size_t* retrieveHistogram(int& returnSize)
	{
		if (!isCurrentNormHistogramHost)
		{
			createHistogram();

			HANDLE_ERROR(cudaMemcpy(histogramHost,histogramDevice,sizeof(size_t)*NUM_BINS,cudaMemcpyDeviceToHost));
			isCurrentHistogramHost = true;
		}

		returnSize = NUM_BINS;

		return histogramHost;
	}

	/*
	*	Returns a host pointer to the normalized histogram data
	*	This is destroyed when this' destructor is called
	*	Will call the needed histogram creation methods if not all ready
	*/
	double* retrieveNormalizedHistogram(int& returnSize)
	{
		if (!isCurrentNormHistogramHost)
		{
			normalizeHistogram();

			HANDLE_ERROR(cudaMemcpy(normalizedHistogramHost,normalizedHistogramDevice,sizeof(double)*NUM_BINS,cudaMemcpyDeviceToHost));
			isCurrentNormHistogramHost = true;
		}

		returnSize = NUM_BINS;

		return normalizedHistogramHost;
	}

	ImagePixelType* retrieveReducedImage(Vec<size_t>& reducedDims)
	{
		reducedDims = this->reducedDims;

		if (reducedImageDevice!=NULL)
		{
			HANDLE_ERROR(cudaMemcpy(reducedImageHost,reducedImageDevice,sizeof(ImagePixelType)*reducedDims.product(),cudaMemcpyDeviceToHost));
		}

		return reducedImageHost;
	}

	Vec<size_t> getDimension() const {return imageDims;}
	int getDevice() const {return device;}
	size_t getBufferSize() {return bufferSize;}

	/*
	*	This will replace this' cuda image buffer with the region of interest
	*	from the passed in buffer.
	*	****ENSURE that this' original size is big enough to accommodates the
	*	the new buffer size.  Does not do error checking thus far.
	*/
	void copyROI(const CudaProcessBuffer<ImagePixelType>* image, Vec<size_t> starts, Vec<size_t> sizes)
	{
		if (sizes.product()>bufferSize || this->device!=image->getDevice())
		{
			clean();
			this->device = image->getDevice();
			imageDims = sizes;
			deviceSetup();
			memoryAllocation();
		}

		imageDims = sizes;
		currentBuffer = 0;
		image->getRoi(getCurrentBuffer(),starts,sizes);
		updateBlockThread();
	}

	void copyROI(const CudaStorageBuffer<ImagePixelType>* imageIn, Vec<size_t> starts, Vec<size_t> sizes)
	{
		if ((size_t)sizes.product()>bufferSize || this->device!=imageIn->getDevice())
		{
			clean();
			this->device = imageIn->getDevice();
			imageDims = sizes;
			deviceSetup();
			memoryAllocation();
		}

		imageDims = sizes;
		currentBuffer = 0;
		imageIn->getRoi(getCurrentBuffer(),starts,sizes);
		updateBlockThread();	
	}

	void copyImage(const CudaProcessBuffer<ImagePixelType>* bufferIn)
	{
		if (bufferIn->getDimension().product()>bufferSize)
		{
			clean();
			this->device = device;
			imageDims = bufferIn->getDimension();
			deviceSetup();
			memoryAllocation();
		}

		imageDims = bufferIn->getDimension();
		device = bufferIn->getDevice();
		updateBlockThread();

		currentBuffer = 0;
		HANDLE_ERROR(cudaMemcpy(getCurrentBuffer(),bufferIn->getCudaBuffer(),sizeof(ImagePixelType)*imageDims.product(),
			cudaMemcpyDeviceToDevice));
	}

	const CudaImageContainer* getCudaBuffer() const
	{
		return getCurrentBuffer();
	}

	size_t getMemoryUsed() {return memoryUsage;}
	size_t getGlobalMemoryAvailable() {return deviceProp.totalGlobalMem;}

	// End Setters / Getters

	//////////////////////////////////////////////////////////////////////////
	// Cuda Operators (Alphabetical order)
	//////////////////////////////////////////////////////////////////////////

	/*
	*	Add a constant to all pixel values
	*/
	template<typename T>
	void addConstant(T additive)
	{
#if (CUDA_CALLS_ON)
		cudaAddFactor<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),additive,minPixel,maxPixel);
#endif
		incrementBufferNumber();
	}

	/*
	*	Adds this image to the passed in one.  You can apply a factor
	*	which is multiplied to the passed in image prior to adding
	*/
	void addImageWith(const CudaProcessBuffer<ImagePixelType>* image, double factor)
	{
#if (CUDA_CALLS_ON)
		cudaAddTwoImagesWithFactor<<<blocks,threads>>>(*getCurrentBuffer(),*(image->getCurrentBuffer()),*getNextBuffer(),factor,
			minPixel,maxPixel);
#endif
		incrementBufferNumber();
	}

	/*
	*	New pixel values will be a*x^2 + b*x + c where x is the original
	*	pixel value.  This new value will be clamped between the min and
	*	max values.
	*/
	template<typename ThresholdType>
	void applyPolyTransformation(ThresholdType a, ThresholdType b, ThresholdType c, ImagePixelType minValue, ImagePixelType maxValue)
	{
#if CUDA_CALLS_ON
		cudaPolyTransferFuncImage<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),a,b,c,minValue,maxValue);
#endif
		incrementBufferNumber();
	}

	/*
	*	This will find the min and max values of the image
	*/ 
	template<typename rtnValueType>
	void calculateMinMax(rtnValueType& minValue, rtnValueType& maxValue)
	{
		double* maxValuesHost = new double[(blocks.x+1)/2];
		double* minValuesHost = new double[(blocks.x+1)/2];

#if CUDA_CALLS_ON
		cudaFindMinMax<<<sumBlocks,sumThreads,2*sizeof(double)*sumThreads.x>>>(*getCurrentBuffer(),minValuesDevice,deviceSum,
			imageDims.product());
#endif

		HANDLE_ERROR(cudaMemcpy(maxValuesHost,deviceSum,sizeof(double)*sumBlocks.x,cudaMemcpyDeviceToHost));
		HANDLE_ERROR(cudaMemcpy(minValuesHost,minValuesDevice,sizeof(double)*sumBlocks.x,cudaMemcpyDeviceToHost));

		maxValue = maxValuesHost[0];
		minValue = minValuesHost[0];

		for (size_t i=1; i<sumBlocks.x; ++i)
		{
			if (maxValue < maxValuesHost[i])
				maxValue = maxValuesHost[i];

			if (minValue > minValuesHost[i])
				minValue = minValuesHost[i];
		}

		delete[] maxValuesHost;
		delete[] minValuesHost;
	}

	/*
	*	Contrast Enhancement will run the Michel High Pass Filter and then a mean filter
	*	Pass in the sigmas that will be used for the Gaussian filter to subtract off and the mean neighborhood dimensions
	*/
	void contrastEnhancement(Vec<float> sigmas, Vec<size_t> medianNeighborhood)
	{
		reserveCurrentBuffer();

		gaussianFilter(sigmas);
#if CUDA_CALLS_ON
		cudaAddTwoImagesWithFactor<<<blocks,threads>>>(*getReservedBuffer(),*getCurrentBuffer(),*getNextBuffer(),-1.0,minPixel,maxPixel);
#endif


		incrementBufferNumber();
		releaseReservedBuffer();

		medianFilter(medianNeighborhood);
	}

	/*
	*	Creates Histogram on the card using the #define NUM_BINS
	*	Use retrieveHistogram to get the results off the card
	*/
	void createHistogram()
	{
		if (isCurrentHistogramDevice)
			return;

		memset(histogramHost,0,NUM_BINS*sizeof(size_t));
		HANDLE_ERROR(cudaMemset(histogramDevice,0,NUM_BINS*sizeof(size_t)));

#if CUDA_CALLS_ON
		cudaHistogramCreate<<<deviceProp.multiProcessorCount*2,NUM_BINS,sizeof(size_t)*NUM_BINS>>>
			(*getCurrentBuffer(),histogramDevice);
#endif

		isCurrentHistogramDevice = true;
	}

	/*
	*	Will smooth the image using the given sigmas for each dimension
	*/ 
	void gaussianFilter(Vec<float> sigmas)
	{
		if (constKernelDims==UNSET || sigmas!=gausKernelSigmas)
		{
			constKernelZeros();
			gausKernelSigmas = sigmas;
			constKernelDims = createGaussianKernel(gausKernelSigmas,hostKernel,gaussIterations);
			HANDLE_ERROR(cudaMemcpyToSymbol(cudaConstKernel,hostKernel,sizeof(float)*(constKernelDims.x+constKernelDims.y+constKernelDims.z)));
		}

		for (int x=0; x<gaussIterations.x; ++x)
		{
#if CUDA_CALLS_ON
			cudaMultAddFilter<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),Vec<size_t>(constKernelDims.x,1,1));
#endif
			incrementBufferNumber();
		}

		for (int y=0; y<gaussIterations.y; ++y)
		{
#if CUDA_CALLS_ON
			cudaMultAddFilter<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),Vec<size_t>(1,constKernelDims.y,1),
				constKernelDims.x);
#endif
			incrementBufferNumber();
		}

		for (int z=0; z<gaussIterations.z; ++z)
		{
#if CUDA_CALLS_ON
			cudaMultAddFilter<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),Vec<size_t>(1,1,constKernelDims.z),
				constKernelDims.x+constKernelDims.y);
#endif
			incrementBufferNumber();
		}
	}

	/*
	*	Mask will mask out the pixels of this buffer given an image and a threshold.
	*	The threshold it to allow the input image to be gray scale instead of logical.
	*	This buffer will get zeroed out where the imageMask is less than or equal to the threshold.
	*/
	void mask(const CudaProcessBuffer<ImagePixelType>* imageMask, ImagePixelType threshold=1)
	{
#if CUDA_CALLS_ON
		cudaMask<<<blocks,threads>>>(*getCurrentBuffer(),*(imageMask->getCudaBuffer()),*getNextBuffer(),threshold);
#endif
		incrementBufferNumber();
	}

	/*
	*	Sets each pixel to the max value of its neighborhood
	*	Dilates structures
	*/ 
	void maxFilter(Vec<size_t> neighborhood, double* kernel=NULL)
	{
		if (kernel==NULL)
			constKernelOnes();
		else
			setConstKernel(kernel,neighborhood);

#if CUDA_CALLS_ON
		cudaMaxFilter<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),neighborhood);
#endif
		incrementBufferNumber();
	}

	/*
	*	produce an image that is the maximum value in z for each (x,y)
	*	Images that are copied out of the buffer will have a z size of 1
	*/
	void maximumIntensityProjection()
	{
#if CUDA_CALLS_ON
		cudaMaximumIntensityProjection<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer());
#endif
		imageDims.z = 1;
		updateBlockThread();
		incrementBufferNumber();
	}

	/*
	*	Filters image where each pixel is the mean of its neighborhood 
	*/
	void meanFilter(Vec<size_t> neighborhood)
	{
#if CUDA_CALLS_ON
		cudaMeanFilter<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),neighborhood);
#endif
		incrementBufferNumber();
	}

	/*
	*	Filters image where each pixel is the median of its neighborhood
	*/
	void medianFilter(Vec<size_t> neighborhood)
	{
		static dim3 localBlocks = blocks;
		static dim3 localThreads = threads;
		int sharedMemorySize = neighborhood.product()*localThreads.x*localThreads.y*localThreads.z;
		if (sizeof(ImagePixelType)*sharedMemorySize>deviceProp.sharedMemPerBlock)
		{
			float maxThreads = (float)deviceProp.sharedMemPerBlock/(sizeof(ImagePixelType)*neighborhood.product());
			size_t threadDim = (size_t)pow(maxThreads,1/3.0f);
			localThreads.x = threadDim;
			localThreads.y = threadDim;
			localThreads.z = threadDim;

			localBlocks.x = (size_t)ceil((float)imageDims.x/localThreads.x);
			localBlocks.y = (size_t)ceil((float)imageDims.y/localThreads.y);
			localBlocks.z = (size_t)ceil((float)imageDims.z/localThreads.z);

			sharedMemorySize = neighborhood.product()*localThreads.x*localThreads.y*localThreads.z;
		}

#if CUDA_CALLS_ON
		cudaMedianFilter<<<localBlocks,localThreads,sizeof(ImagePixelType)*sharedMemorySize>>>(*getCurrentBuffer(),*getNextBuffer(),
			neighborhood);
#endif

		incrementBufferNumber();
	}

	/*
	*	Sets each pixel to the min value of its neighborhood
	*	Erodes structures
	*/ 
	void minFilter(Vec<size_t> neighborhood, double* kernel=NULL)
	{
		if (kernel==NULL)
			constKernelOnes();
		else
			setConstKernel(kernel,neighborhood);

#if CUDA_CALLS_ON
		cudaMinFilter<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),neighborhood);
#endif
		incrementBufferNumber();
	}

	void morphClosure(Vec<size_t> neighborhood, double* kernel=NULL)
	{
		maxFilter(neighborhood,kernel);
		minFilter(neighborhood,kernel);
	}

	void morphOpening(Vec<size_t> neighborhood, double* kernel=NULL)
	{
		minFilter(neighborhood,kernel);
		maxFilter(neighborhood,kernel);
	}

	/*
	*	Sets each pixel by multiplying by the original value and clamping
	*	between minValue and maxValue
	*/
	template<typename FactorType>
	void multiplyImage(FactorType factor)
	{
#if CUDA_CALLS_ON
		cudaMultiplyImage<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),factor,minPixel,maxPixel);
#endif
		incrementBufferNumber();
	}

	/*
	*	Multiplies this image to the passed in one.
	*/
	void multiplyImageWith(const CudaProcessBuffer<ImagePixelType>* image)
	{
#if CUDA_CALLS_ON
		cudaMultiplyTwoImages<<<blocks,threads>>>(*getCurrentBuffer(),*(image->getCurrentBuffer()),*getNextBuffer());
#endif
		incrementBufferNumber();
	}

	/*
	*	This will calculate the normalized covariance between the two images A and B
	*	returns (sum over all{(A-mu(A)) X (B-mu(B))}) / (sigma(A)Xsigma(B)
	*	The images buffers will not change the original data 
	*/
	double normalizedCovariance(CudaProcessBuffer<ImagePixelType>* otherImage)
	{
		ImagePixelType* aOrg = this->retrieveImage();
		ImagePixelType* bOrg = otherImage->retrieveImage();

		double aSum1 = 0.0;
		double bSum1 = 0.0;

		this->sumArray(aSum1);
		otherImage->sumArray(bSum1);

		double aMean = aSum1/this->imageDims.product();
		double bMean = bSum1/otherImage->getDimension().product();

		this->addConstant(-aMean);
		otherImage->addConstant(-bMean);

		double aMidSum;
		double bMidSum;

		if (imageDims.z>1)
		{
			this->sumArray(aMidSum);
			otherImage->sumArray(bMidSum);
		}

		this->reserveCurrentBuffer();
		otherImage->reserveCurrentBuffer();

		this->imagePow(2);
		otherImage->imagePow(2);

		double aSum2 = 0.0;
		double bSum2 = 0.0;
		this->sumArray(aSum2);
		otherImage->sumArray(bSum2);

		double aSigma = sqrt(aSum2/this->getDimension().product());
		double bSigma = sqrt(bSum2/otherImage->getDimension().product());

		this->currentBuffer = this->reservedBuffer;
		otherImage->currentBuffer = otherImage->reservedBuffer;

		this->releaseReservedBuffer();
		otherImage->releaseReservedBuffer();

#if CUDA_CALLS_ON
		cudaMultiplyTwoImages<<<blocks,threads>>>(*(this->getCurrentBuffer()),*(otherImage->getCurrentBuffer()),*(this->getNextBuffer()));
#endif
		this->incrementBufferNumber();

		double multSum = 0.0;
		this->sumArray(multSum);

		this->loadImage(aOrg,this->getDimension());
		otherImage->loadImage(bOrg,otherImage->getDimension());

		delete[] aOrg;
		delete[] bOrg;

		double rtn = multSum/(aSigma*bSigma) / this->getDimension().product();

		return rtn;
	}

	/*
	*	Takes a histogram that is on the card and normalizes it
	*	Will generate the original histogram if one doesn't already exist
	*	Use retrieveNormalizedHistogram() to get a host pointer
	*/
	void normalizeHistogram()
	{
		if (isCurrentNormHistogramDevice)
			return;

		if(!isCurrentHistogramDevice)
			createHistogram();

#if CUDA_CALLS_ON
		cudaNormalizeHistogram<<<NUM_BINS,1>>>(histogramDevice,normalizedHistogramDevice,imageDims);
#endif
		isCurrentNormHistogramDevice = true;
	}

	void otsuThresholdFilter(float alpha=1.0f)
	{
		ImagePixelType thresh = otsuThresholdValue();
		thresholdFilter(thresh*alpha);
	}

	/*
	*	Raise each pixel to a power
	*/
	void imagePow(int p)
	{
#if CUDA_CALLS_ON
		cudaPow<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),p);
#endif
		incrementBufferNumber();
	}

	/*
	*	Calculates the total sum of the buffer's data
	*/
	void sumArray(double& sum)
	{
#if CUDA_CALLS_ON
		cudaSumArray<<<sumBlocks,sumThreads,sizeof(double)*sumThreads.x>>>(*getCurrentBuffer(),deviceSum,imageDims.product());		
#endif
		HANDLE_ERROR(cudaMemcpy(hostSum,deviceSum,sizeof(double)*sumBlocks.x,cudaMemcpyDeviceToHost));

		sum = 0;
		for (size_t i=0; i<sumBlocks.x; ++i)
		{
			sum += hostSum[i];
		}
	}

	/*
	*	Will reduce the size of the image by the factors passed in
	*/
	void reduceImage(Vec<double> reductions)
	{
		reducedDims = Vec<size_t>(
			(size_t)(imageDims.x/reductions.x),
			(size_t)(imageDims.y/reductions.y),
			(size_t)(imageDims.z/reductions.z));

#if CUDA_CALLS_ON
		cudaRuduceImage<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),reductions);
#endif
		incrementBufferNumber();
	}

	/*
	*	This creates a image with values of 0 where the pixels fall below
	*	the threshold and 1 where equal or greater than the threshold
	*	
	*	If you want a viewable image after this, you may want to use the
	*	multiplyImage routine to turn the 1 values to the max values of
	*	the type
	*/
	template<typename ThresholdType>
	void thresholdFilter(ThresholdType threshold)
	{
#if CUDA_CALLS_ON
		cudaThresholdImage<<<blocks,threads>>>(*getCurrentBuffer(),*getNextBuffer(),threshold,minPixel,maxPixel);
#endif
		incrementBufferNumber();
	}

	void unmix(const CudaProcessBuffer<ImagePixelType>* image, Vec<size_t> neighborhood)
	{
#if CUDA_CALLS_ON
		cudaUnmixing<<<blocks,threads>>>(*getCurrentBuffer(),*(image->getCudaBuffer()),*getNextBuffer(), neighborhood,minPixel,maxPixel);
#endif
		incrementBufferNumber();
	}

	// End Cuda Operators

private:
	CudaProcessBuffer();

	void updateBlockThread()
	{
		calcBlockThread(imageDims,deviceProp,blocks,threads);
		calcBlockThread(Vec<size_t>((size_t)imageDims.product(),1,1),deviceProp,sumBlocks,sumThreads);
		sumBlocks.x = (sumBlocks.x+1) / 2;
	}

	void deviceSetup() 
	{
		HANDLE_ERROR(cudaSetDevice(device));
		HANDLE_ERROR(cudaGetDeviceProperties(&deviceProp,device));
		updateBlockThread();
	}

	void memoryAllocation(bool isColumnMajor=false)
	{
		assert(sizeof(ImagePixelType)*imageDims.product()*NUM_BUFFERS < deviceProp.totalGlobalMem*.8);

		for (int i=0; i<NUM_BUFFERS; ++i)
		{
			imageBuffers[i] = new CudaImageContainer(imageDims,device,isColumnMajor);
		}

		currentBuffer = -1;
		bufferSize = imageDims.product();

		updateBlockThread();

		sizeSum = sumBlocks.x;
		HANDLE_ERROR(cudaMalloc((void**)&deviceSum,sizeof(double)*sumBlocks.x));
		memoryUsage += sizeof(double)*sumBlocks.x;
		hostSum = new double[sumBlocks.x];

		HANDLE_ERROR(cudaMalloc((void**)&minValuesDevice,sizeof(double)*sumBlocks.x));
		memoryUsage += sizeof(double)*sumBlocks.x;

		histogramHost = new size_t[NUM_BINS];
		HANDLE_ERROR(cudaMalloc((void**)&histogramDevice,NUM_BINS*sizeof(size_t)));
		memoryUsage += NUM_BINS*sizeof(size_t);

		normalizedHistogramHost = new double[NUM_BINS];
		HANDLE_ERROR(cudaMalloc((void**)&normalizedHistogramDevice,NUM_BINS*sizeof(double)));
		memoryUsage += NUM_BINS*sizeof(double);

		minPixel = std::numeric_limits<ImagePixelType>::min();
		maxPixel = std::numeric_limits<ImagePixelType>::max();
	}

	void getRoi(ImagePixelType* roi, Vec<size_t> starts, Vec<size_t> sizes) const
	{
#if CUDA_CALLS_ON
		cudaGetROI<<<blocks,threads>>>(*getCurrentBuffer(),roi,starts,sizes);
#endif
	}

	void copy(const CudaProcessBuffer<ImagePixelType>* bufferIn)
	{
		defaults();

		imageDims = bufferIn->getDimension();
		device = bufferIn->getDevice();

		deviceSetup();
		memoryAllocation();

		currentBuffer = 0;
		ImagePixelType* inImage = bufferIn->getCurrentBuffer();

		if (inImage!=NULL)
			HANDLE_ERROR(cudaMemcpy(imageBuffers[currentBuffer],inImage,sizeof(ImagePixelType)*imageDims.product(),cudaMemcpyDeviceToDevice));

		if (bufferIn->reducedImageHost!=NULL)
			memcpy(reducedImageHost,bufferIn->reducedImageHost,sizeof(ImagePixelType)*reducedDims.product());

		if (bufferIn->reducedImageDevice!=NULL)
			HANDLE_ERROR(cudaMemcpy(reducedImageDevice,bufferIn->reducedImageDevice,sizeof(ImagePixelType)*reducedDims.product(),
			cudaMemcpyDeviceToDevice));

		if (bufferIn->histogramHost!=NULL)
			memcpy(histogramHost,bufferIn->histogramHost,sizeof(size_t)*imageDims.product());

		if (bufferIn->histogramDevice!=NULL)
			HANDLE_ERROR(cudaMemcpy(histogramDevice,bufferIn->histogramDevice,sizeof(size_t)*NUM_BINS,cudaMemcpyDeviceToDevice));

		if (bufferIn->normalizedHistogramHost!=NULL)
			memcpy(normalizedHistogramHost,bufferIn->normalizedHistogramHost,sizeof(double)*imageDims.product());

		if (bufferIn->normalizedHistogramDevice!=NULL)
			HANDLE_ERROR(cudaMemcpy(normalizedHistogramDevice,bufferIn->normalizedHistogramDevice,sizeof(double)*NUM_BINS,
			cudaMemcpyDeviceToDevice));
	}

	void constKernelOnes()
	{
		memset(hostKernel,1,sizeof(float)*MAX_KERNEL_DIM*MAX_KERNEL_DIM*MAX_KERNEL_DIM);
		HANDLE_ERROR(cudaMemcpyToSymbol(cudaConstKernel,hostKernel,sizeof(float)*MAX_KERNEL_DIM*MAX_KERNEL_DIM*MAX_KERNEL_DIM));
	}

	void constKernelZeros()
	{
		memset(hostKernel,1,sizeof(float)*MAX_KERNEL_DIM*MAX_KERNEL_DIM*MAX_KERNEL_DIM);
		HANDLE_ERROR(cudaMemcpyToSymbol(cudaConstKernel,hostKernel,sizeof(float)*MAX_KERNEL_DIM*MAX_KERNEL_DIM*MAX_KERNEL_DIM));
	}

	void setConstKernel(double* kernel, Vec<size_t> kernelDims)
	{
		memset(hostKernel,0,sizeof(float)*MAX_KERNEL_DIM*MAX_KERNEL_DIM*MAX_KERNEL_DIM);

		Vec<size_t> coordinate(0,0,0);
		for (; coordinate.x<kernelDims.x; ++coordinate.x)
		{
			coordinate.y = 0;
			for (; coordinate.y<kernelDims.y; ++coordinate.y)
			{
				coordinate.z = 0;
				for (; coordinate.z<kernelDims.z; ++coordinate.z)
				{
					hostKernel[kernelDims.linearAddressAt(coordinate)] = (float)kernel[kernelDims.linearAddressAt(coordinate)];
				}
			}
		}
		HANDLE_ERROR(cudaMemcpyToSymbol(cudaConstKernel,hostKernel,sizeof(float)*kernelDims.product()));
	}

	void defaults()
	{
		imageDims = UNSET;
		reducedDims = UNSET;
		constKernelDims = UNSET;
		gausKernelSigmas  = Vec<float>(0.0f,0.0f,0.0f);
		device = -1;
		currentBuffer = -1;
		bufferSize = 0;
		for (int i=0; i<NUM_BUFFERS; ++i)
		{
			imageBuffers[i] = NULL;
		}

		reducedImageHost = NULL;
		reducedImageDevice = NULL;
		histogramHost = NULL;
		histogramDevice = NULL;
		normalizedHistogramHost = NULL;
		normalizedHistogramDevice = NULL;
		isCurrentHistogramHost = false;
		isCurrentHistogramDevice = false;
		isCurrentNormHistogramHost = false;
		isCurrentNormHistogramDevice = false;
		deviceSum = NULL;
		minValuesDevice = NULL;
		hostSum = NULL;
		gaussIterations = Vec<int>(0,0,0);
		reservedBuffer = -1;
		memoryUsage = 0;
	}

	void clean() 
	{
		for (int i=0; i<NUM_BUFFERS; ++i)
		{
			if (imageBuffers[i]!=NULL)
				HANDLE_ERROR(cudaFree(imageBuffers[i]));
		}

		if (reducedImageHost!=NULL)
			delete[] reducedImageHost;

		if (reducedImageDevice!=NULL)
			HANDLE_ERROR(cudaFree(reducedImageDevice));

		if (histogramHost!=NULL)
			delete[] histogramHost;

		if (histogramDevice!=NULL)
			HANDLE_ERROR(cudaFree(histogramDevice));

		if (normalizedHistogramHost!=NULL)
			delete[] normalizedHistogramHost;

		if (normalizedHistogramDevice!=NULL)
			HANDLE_ERROR(cudaFree(normalizedHistogramDevice));

		if (deviceSum!=NULL)
			HANDLE_ERROR(cudaFree(deviceSum));

		if (hostSum!=NULL)
			delete[] hostSum;

		if (minValuesDevice!=NULL)
			HANDLE_ERROR(cudaFree(minValuesDevice));

		memset(hostKernel,0,sizeof(float)*MAX_KERNEL_DIM*MAX_KERNEL_DIM*MAX_KERNEL_DIM);

		defaults();
	}

	CudaImageContainer* getCurrentBuffer() const 
	{
		if (currentBuffer<0 || currentBuffer>NUM_BUFFERS)
			return NULL;

		return imageBuffers[currentBuffer];
	}

	CudaImageContainer* getNextBuffer()
	{
		return imageBuffers[getNextBufferNum()];
	}

	int getNextBufferNum()
	{
		int nextIndex = currentBuffer;
		do 
		{
			++nextIndex;
			if (nextIndex>=NUM_BUFFERS)
				nextIndex = 0;
		} while (nextIndex==reservedBuffer);
		return nextIndex;
	}

	CudaImageContainer* getReservedBuffer()
	{
		if (reservedBuffer<0)
			return NULL;

		return imageBuffers[reservedBuffer];
	}

	void reserveCurrentBuffer()
	{
		reservedBuffer = currentBuffer;
	}

	void releaseReservedBuffer()
	{
		reservedBuffer = -1;
	}

	void incrementBufferNumber()
	{
		cudaThreadSynchronize();
#ifdef _DEBUG
		gpuErrchk( cudaPeekAtLastError() );
#endif // _DEBUG

		currentBuffer = getNextBufferNum();
	}

	//This is the maximum size that the current buffer can handle 
	size_t bufferSize;

	//This is the original size of the loaded images and the size of the buffers
	Vec<size_t> imageDims;

	//This is the dimensions of the reduced image buffer
	Vec<size_t> reducedDims;

	int device;
	cudaDeviceProp deviceProp;
	dim3 blocks, threads;
	int currentBuffer;
	size_t memoryUsage;
	CudaImageContainer* imageBuffers[NUM_BUFFERS];
	CudaImageContainer* reducedImageHost;
	CudaImageContainer* reducedImageDevice;
	double* minValuesDevice;
	ImagePixelType minPixel;
	ImagePixelType maxPixel;
	size_t* histogramHost;
	size_t* histogramDevice;
	double* normalizedHistogramHost;
	double* normalizedHistogramDevice;
	bool isCurrentHistogramHost, isCurrentHistogramDevice, isCurrentNormHistogramHost, isCurrentNormHistogramDevice;
	dim3 sumBlocks, sumThreads;
	double* deviceSum;
	double* hostSum;
	int sizeSum;
	Vec<size_t> constKernelDims;
	Vec<int> gaussIterations;
	Vec<float> gausKernelSigmas;
	float hostKernel[MAX_KERNEL_DIM*MAX_KERNEL_DIM*MAX_KERNEL_DIM];
	int reservedBuffer;
	Vec<size_t> UNSET;
};
