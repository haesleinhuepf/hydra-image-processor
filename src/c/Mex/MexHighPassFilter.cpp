#include "MexCommand.h"
#include "../Cuda/Vec.h"
#include "../Cuda/CWrappers.h"
#include "../Cuda/ImageDimensions.cuh"
#include "../Cuda/ImageContainer.h"
#include "MexKernel.h"

template <typename T>
void MexHighPass_run(const mxArray* inIm, mxArray** outIm, Vec<double> sigmas, int device)
{
	T* imageInPtr;
	T* imageOutPtr;

	ImageDimensions imageDims;
	Script::setupImagePointers(inIm, &imageInPtr, imageDims, outIm, &imageOutPtr);

	ImageView<T> imageIn(imageInPtr, imageDims);
	ImageView<T> imageOut(imageOutPtr, imageDims);

	highPassFilter(imageIn, imageOut, sigmas, device);
}


void MexHighPassFilter::execute(int nlhs, mxArray* plhs[], int nrhs, const mxArray* prhs[]) const
{
	int device = -1;

	if (!mxIsEmpty(prhs[2]))
		device = mat_to_c((int)mxGetScalar(prhs[2]));

	double* sigmasMat = (double*)mxGetData(prhs[1]);
	Vec<double> sigmas(sigmasMat[0], sigmasMat[1], sigmasMat[2]);

	if (mxIsLogical(prhs[0]))
	{
		MexHighPass_run<bool>(prhs[0], &plhs[0], sigmas, device);
	}
	else if (mxIsUint8(prhs[0]))
	{
		MexHighPass_run<uint8_t>(prhs[0], &plhs[0], sigmas, device);
	}
	else if (mxIsUint16(prhs[0]))
	{
		MexHighPass_run<uint16_t>(prhs[0], &plhs[0], sigmas, device);
	}
	else if (mxIsInt16(prhs[0]))
	{
		MexHighPass_run<int16_t>(prhs[0], &plhs[0], sigmas, device);
	}
	else if (mxIsUint32(prhs[0]))
	{
		MexHighPass_run<uint32_t>(prhs[0], &plhs[0], sigmas, device);
	}
	else if (mxIsInt32(prhs[0]))
	{
		MexHighPass_run<int32_t>(prhs[0], &plhs[0], sigmas, device);
	}
	else if (mxIsSingle(prhs[0]))
	{
		MexHighPass_run<float>(prhs[0], &plhs[0], sigmas, device);
	}
	else if (mxIsDouble(prhs[0]))
	{
		MexHighPass_run<double>(prhs[0], &plhs[0], sigmas, device);
	}
	else
	{
		mexErrMsgTxt("Image type not supported!");
	}
}

std::string MexHighPassFilter::check(int nlhs, mxArray* plhs[], int nrhs, const mxArray* prhs[]) const
{
	if (nrhs != 3)
		return "Incorrect number of inputs!";

	if (nlhs != 1)
		return "Requires one output!";

	std::size_t imgNumDims = mxGetNumberOfDimensions(prhs[0]);
	if (imgNumDims > 5)
		return "Image can have a maximum of five dimensions!";

	if (!mxIsDouble(prhs[1]))
		return "Sigmas must a vector of three positive doubles!";

	if (!(mxGetNumberOfDimensions(prhs[1]) != 3))
		return "Sigmas must a vector of three positive doubles!";

	return "";
}

void MexHighPassFilter::usage(std::vector<std::string>& outArgs, std::vector<std::string>& inArgs) const
{
	inArgs.push_back("arrayIn");
	inArgs.push_back("sigmas");
	inArgs.push_back("[device]");
	outArgs.push_back("arrayOut");
}

void MexHighPassFilter::help(std::vector<std::string>& helpLines) const
{
	helpLines.push_back("Filters out low frequency by subtracting a Gaussian blurred version of the input based on the sigmas provided.");

	helpLines.push_back("\timageIn = This is a one to five dimensional array. The first three dimensions are treated as spatial.");
	helpLines.push_back("\t\tThe spatial dimensions will have the kernel applied. The last two dimensions will determine");
	helpLines.push_back("\t\thow to stride or jump to the next spatial block.");
	helpLines.push_back("");

	helpLines.push_back("\tSigmas = This should be an array of three positive values that represent the standard deviation of a Gaussian curve.");
	helpLines.push_back("\t\tZeros (0) in this array will not smooth in that direction.");
	helpLines.push_back("");
	
	helpLines.push_back("\tdevice (optional) = Use this if you have multiple devices and want to select one explicitly.");
	helpLines.push_back("\t\tSetting this to [] allows the algorithm to either pick the best device and/or will try to split");
	helpLines.push_back("\t\tthe data across multiple devices.");
	helpLines.push_back("");

	helpLines.push_back("\timageOut = This will be an array of the same type and shape as the input array.");
}
