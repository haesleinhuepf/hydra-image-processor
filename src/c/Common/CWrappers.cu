#include "CWrappers.cuh"
#include "CudaAdd.cuh"
#include "CudaContrastEnhancement.cuh"
#include "CudaHistogram.cuh"
#include "CudaGaussianFilter.cuh"
#include "CudaGetMinMax.cuh"
#include "CudaMaxFilter.cuh"
#include "CudaMeanFilter.cuh"
#include "CudaMedianFilter.cuh"
#include "CudaMinFilter.cuh"
#include "CudaMultiplyImage.cuh"
#include "CudaNormalizedCovariance.cuh"
#include "CudaPolyTransferFunc.cuh"
#include "CudaPow.cuh"
#include "CudaImageReduction.cuh"
#include "CudaSum.cuh"
#include "CudaThreshold.cuh"

unsigned char* cAddConstant(const unsigned char* imageIn, Vec<size_t> dims, double additive, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return addConstant(imageIn,dims,additive,imageOut,device);
}

unsigned short* cAddConstant(const unsigned short* imageIn, Vec<size_t> dims, double additive, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return addConstant(imageIn,dims,additive,imageOut,device);
}

short* cAddConstant(const short* imageIn, Vec<size_t> dims, double additive, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return addConstant(imageIn,dims,additive,imageOut,device);
}

unsigned int* cAddConstant(const unsigned int* imageIn, Vec<size_t> dims, double additive, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return addConstant(imageIn,dims,additive,imageOut,device);
}

int* cAddConstant(const int* imageIn, Vec<size_t> dims, double additive, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return addConstant(imageIn,dims,additive,imageOut,device);
}

float* cAddConstant(const float* imageIn, Vec<size_t> dims, double additive, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return addConstant(imageIn,dims,additive,imageOut,device);
}

double* cAddConstant(const double* imageIn, Vec<size_t> dims, double additive, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return addConstant(imageIn,dims,additive,imageOut,device);
}


unsigned char* cApplyPolyTransferFunction(const unsigned char* imageIn, Vec<size_t> dims, double a, double b, double c, unsigned char minValue/*=std::numeric_limits<PixelType>::lowest()*/, unsigned char maxValue/*=std::numeric_limits<PixelType>::max()*/, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return applyPolyTransferFunction(imageIn,dims,a,b,c,minValue,maxValue,imageOut,device);
}

unsigned short* cApplyPolyTransferFunction(const unsigned short* imageIn, Vec<size_t> dims, double a, double b, double c, unsigned short minValue/*=std::numeric_limits<PixelType>::lowest()*/, unsigned short maxValue/*=std::numeric_limits<PixelType>::max()*/, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return applyPolyTransferFunction(imageIn,dims,a,b,c,minValue,maxValue,imageOut,device);
}

short* cApplyPolyTransferFunction(const short* imageIn, Vec<size_t> dims, double a, double b, double c, short minValue/*=std::numeric_limits<PixelType>::lowest()*/, short maxValue/*=std::numeric_limits<PixelType>::max()*/, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return applyPolyTransferFunction(imageIn,dims,a,b,c,minValue,maxValue,imageOut,device);
}

unsigned int* cApplyPolyTransferFunction(const unsigned int* imageIn, Vec<size_t> dims, double a, double b, double c, unsigned int minValue/*=std::numeric_limits<PixelType>::lowest()*/, unsigned int maxValue/*=std::numeric_limits<PixelType>::max()*/, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return applyPolyTransferFunction(imageIn,dims,a,b,c,minValue,maxValue,imageOut,device);
}

int* cApplyPolyTransferFunction(const int* imageIn, Vec<size_t> dims, double a, double b, double c, int minValue/*=std::numeric_limits<PixelType>::lowest()*/, int maxValue/*=std::numeric_limits<PixelType>::max()*/, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return applyPolyTransferFunction(imageIn,dims,a,b,c,minValue,maxValue,imageOut,device);
}

float* cApplyPolyTransferFunction(const float* imageIn, Vec<size_t> dims, double a, double b, double c, float minValue/*=std::numeric_limits<PixelType>::lowest()*/, float maxValue/*=std::numeric_limits<PixelType>::max()*/, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return applyPolyTransferFunction(imageIn,dims,a,b,c,minValue,maxValue,imageOut,device);
}

double* cApplyPolyTransferFunction(const double* imageIn, Vec<size_t> dims, double a, double b, double c, double minValue/*=std::numeric_limits<PixelType>::lowest()*/, double maxValue/*=std::numeric_limits<PixelType>::max()*/,double** imageOut/*=NULL*/, int device/*=0*/)
{
	return applyPolyTransferFunction(imageIn,dims,a,b,c,minValue,maxValue,imageOut,device);
}


unsigned char* cAddImageWith(const unsigned char* imageIn1, const unsigned char* imageIn2, Vec<size_t> dims, double additive, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return addImageWith(imageIn1,imageIn2,dims,additive,imageOut,device);
}

unsigned short* cAddImageWith(const unsigned short* imageIn1, const unsigned short* imageIn2, Vec<size_t> dims, double additive, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return addImageWith(imageIn1,imageIn2,dims,additive,imageOut,device);
}

short* cAddImageWith(const short* imageIn1, const short* imageIn2, Vec<size_t> dims, double additive, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return addImageWith(imageIn1,imageIn2,dims,additive,imageOut,device);
}

unsigned int* cAddImageWith(const unsigned int* imageIn1, const unsigned int* imageIn2, Vec<size_t> dims, double additive, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return addImageWith(imageIn1,imageIn2,dims,additive,imageOut,device);
}

int* cAddImageWith(const int* imageIn1, const int* imageIn2, Vec<size_t> dims, double additive, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return addImageWith(imageIn1,imageIn2,dims,additive,imageOut,device);
}

float* cAddImageWith(const float* imageIn1, const float* imageIn2, Vec<size_t> dims, double additive, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return addImageWith(imageIn1,imageIn2,dims,additive,imageOut,device);
}

double* cAddImageWith(const double* imageIn1, const double* imageIn2, Vec<size_t> dims, double additive, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return addImageWith(imageIn1,imageIn2,dims,additive,imageOut,device);
}


unsigned char* cContrastEnhancement(const unsigned char* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return contrastEnhancement(imageIn,dims,sigmas,neighborhood,imageOut,device);
}

unsigned short* cContrastEnhancement(const unsigned short* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return contrastEnhancement(imageIn,dims,sigmas,neighborhood,imageOut,device);
}

short* cContrastEnhancement(const short* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return contrastEnhancement(imageIn,dims,sigmas,neighborhood,imageOut,device);
}

unsigned int* cContrastEnhancement(const unsigned int* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return contrastEnhancement(imageIn,dims,sigmas,neighborhood,imageOut,device);
}

int* cContrastEnhancement(const int* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return contrastEnhancement(imageIn,dims,sigmas,neighborhood,imageOut,device);
}

float* cContrastEnhancement(const float* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return contrastEnhancement(imageIn,dims,sigmas,neighborhood,imageOut,device);
}

double* cContrastEnhancement(const double* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return contrastEnhancement(imageIn,dims,sigmas,neighborhood,imageOut,device);
}


size_t* cHistogram(const unsigned char* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned char minVal/*=std::numeric_limits<unsigned char>::lowest()*/, unsigned char maxVal/*=std::numeric_limits<unsigned char>::max()*/, int device/*=0*/)
{
	return calculateHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

size_t* cHistogram(const unsigned short* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned short minVal/*=std::numeric_limits<unsigned short>::lowest()*/, unsigned short maxVal/*=std::numeric_limits<unsigned short>::max()*/, int device/*=0*/)
{
	return calculateHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

size_t* cHistogram(const short* imageIn, Vec<size_t> dims, unsigned int arraySize, short minVal/*=std::numeric_limits<short>::lowest()*/,short maxVal/*=std::numeric_limits<short>::max()*/, int device/*=0*/)
{
	return calculateHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

size_t* cHistogram(const unsigned int* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned int minVal/*=std::numeric_limits<unsigned short>::lowest()*/, unsigned int maxVal/*=std::numeric_limits<unsigned int>::max()*/, int device/*=0*/)
{
	return calculateHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

size_t* cHistogram(const int* imageIn, Vec<size_t> dims, unsigned int arraySize, int minVal/*=std::numeric_limits<int>::lowest()*/, int maxVal/*=std::numeric_limits<int>::max()*/, int device/*=0*/)
{
	return calculateHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

size_t* cHistogram(const float* imageIn, Vec<size_t> dims, unsigned int arraySize, float minVal/*=std::numeric_limits<float>::lowest()*/, float maxVal/*=std::numeric_limits<float>::max()*/, int device/*=0*/)
{
	return calculateHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

size_t* cHistogram(const double* imageIn, Vec<size_t> dims, unsigned int arraySize, double minVal/*=std::numeric_limits<double>::lowest()*/, double maxVal/*=std::numeric_limits<double>::max()*/, int device/*=0*/)
{
	return calculateHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}


unsigned char* cGaussianFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<float> sigmas, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return gaussianFilter(imageIn,dims,sigmas,imageOut,device);
}

unsigned short* cGaussianFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<float> sigmas, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return gaussianFilter(imageIn,dims,sigmas,imageOut,device);
}

short* cGaussianFilter(const short* imageIn, Vec<size_t> dims, Vec<float> sigmas, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return gaussianFilter(imageIn,dims,sigmas,imageOut,device);
}

unsigned int* cGaussianFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<float> sigmas, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return gaussianFilter(imageIn,dims,sigmas,imageOut,device);
}

int* cGaussianFilter(const int* imageIn, Vec<size_t> dims, Vec<float> sigmas, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return gaussianFilter(imageIn,dims,sigmas,imageOut,device);
}

float* cGaussianFilter(const float* imageIn, Vec<size_t> dims, Vec<float> sigmas, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return gaussianFilter(imageIn,dims,sigmas,imageOut,device);
}

double* cGaussianFilter(const double* imageIn, Vec<size_t> dims, Vec<float> sigmas, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return gaussianFilter(imageIn,dims,sigmas,imageOut,device);
}


void cGetMinMax(const unsigned char* imageIn, Vec<size_t> dims, unsigned char& minVal, unsigned char& maxVal, int device/*=0*/)
{
	getMinMax(imageIn,dims,minVal,maxVal,device);
}

void cGetMinMax(const unsigned short* imageIn, Vec<size_t> dims, unsigned short& minVal, unsigned short& maxVal, int device/*=0*/)
{
	getMinMax(imageIn,dims,minVal,maxVal,device);
}

void cGetMinMax(const short* imageIn, Vec<size_t> dims, short& minVal, short& maxVal, int device/*=0*/)
{
	getMinMax(imageIn,dims,minVal,maxVal,device);
}

void cGetMinMax(const unsigned int* imageIn, Vec<size_t> dims, unsigned int& minVal, unsigned int& maxVal, int device/*=0*/)
{
	getMinMax(imageIn,dims,minVal,maxVal,device);
}

void cGetMinMax(const int* imageIn, Vec<size_t> dims, int& minVal, int& maxVal, int device/*=0*/)
{
	getMinMax(imageIn,dims,minVal,maxVal,device);
}

void cGetMinMax(const float* imageIn, Vec<size_t> dims, float& minVal, float& maxVal, int device/*=0*/)
{
	getMinMax(imageIn,dims,minVal,maxVal,device);
}

void cGetMinMax(const double* imageIn, Vec<size_t> dims, double& minVal, double& maxVal, int device/*=0*/)
{
	getMinMax(imageIn,dims,minVal,maxVal,device);
}


unsigned char* cImagePow(const unsigned char* imageIn, Vec<size_t> dims, double additive, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return addConstant(imageIn,dims,additive,imageOut,device);
}

unsigned short* cImagePow(const unsigned short* imageIn, Vec<size_t> dims, double power, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return imagePow(imageIn,dims,power,imageOut,device);
}

short* cImagePow(const short* imageIn, Vec<size_t> dims, double power, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return imagePow(imageIn,dims,power,imageOut,device);
}

unsigned int* cImagePow(const unsigned int* imageIn, Vec<size_t> dims, double power, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return imagePow(imageIn,dims,power,imageOut,device);
}

int* cImagePow(const int* imageIn, Vec<size_t> dims, double power, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return imagePow(imageIn,dims,power,imageOut,device);
}

float* cImagePow(const float* imageIn, Vec<size_t> dims, double power, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return imagePow(imageIn,dims,power,imageOut,device);
}

double* cImagePow(const double* imageIn, Vec<size_t> dims, double power, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return imagePow(imageIn,dims,power,imageOut,device);
}


unsigned char* cMaxFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return maxFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

unsigned short* cMaxFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return maxFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

short* cMaxFilter(const short* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return maxFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

unsigned int* cMaxFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return maxFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

int* cMaxFilter(const int* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return maxFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

float* cMaxFilter(const float* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return maxFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

double* cMaxFilter(const double* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return maxFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}


unsigned char* cMeanFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return meanFilter(imageIn,dims,neighborhood,imageOut,device);
}

unsigned short* cMeanFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return meanFilter(imageIn,dims,neighborhood,imageOut,device);
}

short* cMeanFilter(const short* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return meanFilter(imageIn,dims,neighborhood,imageOut,device);
}

unsigned int* cMeanFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return meanFilter(imageIn,dims,neighborhood,imageOut,device);
}

int* cMeanFilter(const int* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return meanFilter(imageIn,dims,neighborhood,imageOut,device);
}

float* cMeanFilter(const float* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return meanFilter(imageIn,dims,neighborhood,imageOut,device);
}

double* cMeanFilter(const double* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return meanFilter(imageIn,dims,neighborhood,imageOut,device);
}


unsigned char* cMedianFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return medianFilter(imageIn,dims,neighborhood,imageOut,device);
}

unsigned short* cMedianFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return medianFilter(imageIn,dims,neighborhood,imageOut,device);
}

short* cMedianFilter(const short* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return medianFilter(imageIn,dims,neighborhood,imageOut,device);
}

unsigned int* cMedianFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return medianFilter(imageIn,dims,neighborhood,imageOut,device);
}

int* cMedianFilter(const int* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return medianFilter(imageIn,dims,neighborhood,imageOut,device);
}

float* cMedianFilter(const float* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return medianFilter(imageIn,dims,neighborhood,imageOut,device);
}

double* cMedianFilter(const double* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return medianFilter(imageIn,dims,neighborhood,imageOut,device);
}


unsigned char* cMinFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return minFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

unsigned short* cMinFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return minFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

short* cMinFilter(const short* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return minFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

unsigned int* cMinFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return minFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

int* cMinFilter(const int* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return minFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

float* cMinFilter(const float* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return minFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}

double* cMinFilter(const double* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel/*=NULL*/, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return minFilter(imageIn,dims,kernelDims,kernel,imageOut,device);
}


unsigned char* cMultiplyImage(const unsigned char* imageIn, Vec<size_t> dims, double multiplier, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImage(imageIn,dims,multiplier,imageOut,device);
}

unsigned short* cMultiplyImage(const unsigned short* imageIn, Vec<size_t> dims, double multiplier, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImage(imageIn,dims,multiplier,imageOut,device);
}

short* cMultiplyImage(const short* imageIn, Vec<size_t> dims, double multiplier, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImage(imageIn,dims,multiplier,imageOut,device);
}

unsigned int* cMultiplyImage(const unsigned int* imageIn, Vec<size_t> dims, double multiplier, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImage(imageIn,dims,multiplier,imageOut,device);
}

int* cMultiplyImage(const int* imageIn, Vec<size_t> dims, double multiplier, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImage(imageIn,dims,multiplier,imageOut,device);
}

float* cMultiplyImage(const float* imageIn, Vec<size_t> dims, double multiplier, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImage(imageIn,dims,multiplier,imageOut,device);
}

double* cMultiplyImage(const double* imageIn, Vec<size_t> dims, double multiplier, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImage(imageIn,dims,multiplier,imageOut,device);
}


unsigned char* cMultiplyImageWith(const unsigned char* imageIn1, const unsigned char* imageIn2, Vec<size_t> dims, double factor, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImageWith(imageIn1,imageIn2,dims,factor,imageOut,device);
}

unsigned short* cMultiplyImageWith(const unsigned short* imageIn1, const unsigned short* imageIn2, Vec<size_t> dims, double factor, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImageWith(imageIn1,imageIn2,dims,factor,imageOut,device);
}

short* cMultiplyImageWith(const short* imageIn1, const short* imageIn2, Vec<size_t> dims, double factor, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImageWith(imageIn1,imageIn2,dims,factor,imageOut,device);
}

unsigned int* cMultiplyImageWith(const unsigned int* imageIn1, const unsigned int* imageIn2, Vec<size_t> dims, double factor, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImageWith(imageIn1,imageIn2,dims,factor,imageOut,device);
}

int* cMultiplyImageWith(const int* imageIn1, const int* imageIn2, Vec<size_t> dims, double factor, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImageWith(imageIn1,imageIn2,dims,factor,imageOut,device);
}

float* cMultiplyImageWith(const float* imageIn1, const float* imageIn2, Vec<size_t> dims, double factor, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImageWith(imageIn1,imageIn2,dims,factor,imageOut,device);
}

double* cMultiplyImageWith(const double* imageIn1, const double* imageIn2, Vec<size_t> dims, double factor, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return multiplyImageWith(imageIn1,imageIn2,dims,factor,imageOut,device);
}


double cNormalizedCovariance(const unsigned char* imageIn1, const unsigned char* imageIn2, Vec<size_t> dims, int device/*=0*/)
{
	return normalizedCovariance(imageIn1,imageIn2,dims,device);
}

double cNormalizedCovariance(const unsigned short* imageIn1, const unsigned short* imageIn2, Vec<size_t> dims, int device/*=0*/)
{
	return normalizedCovariance(imageIn1,imageIn2,dims,device);
}

double cNormalizedCovariance(const short* imageIn1, const short* imageIn2, Vec<size_t> dims, int device/*=0*/)
{
	return normalizedCovariance(imageIn1,imageIn2,dims,device);
}

double cNormalizedCovariance(const unsigned int* imageIn1, const unsigned int* imageIn2, Vec<size_t> dims, int device/*=0*/)
{
	return normalizedCovariance(imageIn1,imageIn2,dims,device);
}

double cNormalizedCovariance(const int* imageIn1, const int* imageIn2, Vec<size_t> dims, int device/*=0*/)
{
	return normalizedCovariance(imageIn1,imageIn2,dims,device);
}

double cNormalizedCovariance(const float* imageIn1, const float* imageIn2, Vec<size_t> dims, int device/*=0*/)
{
	return normalizedCovariance(imageIn1,imageIn2,dims,device);
}

double cNormalizedCovariance(const double* imageIn1, const double* imageIn2, Vec<size_t> dims, int device/*=0*/)
{
	return normalizedCovariance(imageIn1,imageIn2,dims,device);
}


double* cNormalizeHistogram(const unsigned char* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned char minVal/*=std::numeric_limits<unsigned char>::lowest()*/, unsigned char maxVal/*=std::numeric_limits<unsigned char>::max()*/, int device/*=0*/)
{
	return normalizeHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

double* cNormalizeHistogram(const unsigned short* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned short minVal/*=std::numeric_limits<unsigned short>::lowest()*/, unsigned short maxVal/*=std::numeric_limits<unsigned short>::max()*/, int device/*=0*/)
{
	return normalizeHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

double* cNormalizeHistogram(const short* imageIn, Vec<size_t> dims, unsigned int arraySize, short minVal/*=std::numeric_limits<short>::lowest()*/, short maxVal/*=std::numeric_limits<short>::max()*/, int device/*=0*/)
{
	return normalizeHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

double* cNormalizeHistogram(const unsigned int* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned int minVal/*=std::numeric_limits<unsigned int>::lowest()*/, unsigned int maxVal/*=std::numeric_limits<unsigned int>::max()*/, int device/*=0*/)
{
	return normalizeHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

double* cNormalizeHistogram(const int* imageIn, Vec<size_t> dims, unsigned int arraySize, int minVal/*=std::numeric_limits<int>::lowest()*/, int maxVal/*=std::numeric_limits<int>::max()*/, int device/*=0*/)
{
	return normalizeHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

double* cNormalizeHistogram(const float* imageIn, Vec<size_t> dims, unsigned int arraySize, float minVal/*=std::numeric_limits<float>::lowest()*/, float maxVal/*=std::numeric_limits<float>::max()*/, int device/*=0*/)
{
	return normalizeHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}

double* cNormalizeHistogram(const double* imageIn, Vec<size_t> dims, unsigned int arraySize, double minVal/*=std::numeric_limits<double>::lowest()*/, double maxVal/*=std::numeric_limits<double>::max()*/, int device/*=0*/)
{
	return normalizeHistogram(imageIn,dims,arraySize,minVal,maxVal,device);
}


unsigned char* cOtsuThresholdFilter(const unsigned char* imageIn, Vec<size_t> dims, double alpha/*=1.0*/, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return otsuThresholdFilter(imageIn,dims,alpha,imageOut,device);
}

unsigned short* cOtsuThresholdFilter(const unsigned short* imageIn, Vec<size_t> dims, double alpha/*=1.0*/, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return otsuThresholdFilter(imageIn,dims,alpha,imageOut,device);
}

short* cOtsuThresholdFilter(const short* imageIn, Vec<size_t> dims, double alpha/*=1.0*/, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return otsuThresholdFilter(imageIn,dims,alpha,imageOut,device);
}

unsigned int* cOtsuThresholdFilter(const unsigned int* imageIn, Vec<size_t> dims, double alpha/*=1.0*/, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return otsuThresholdFilter(imageIn,dims,alpha,imageOut,device);
}

int* cOtsuThresholdFilter(const int* imageIn, Vec<size_t> dims, double alpha/*=1.0*/, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return otsuThresholdFilter(imageIn,dims,alpha,imageOut,device);
}

float* cOtsuThresholdFilter(const float* imageIn, Vec<size_t> dims, double alpha/*=1.0*/, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return otsuThresholdFilter(imageIn,dims,alpha,imageOut,device);
}

double* cOtsuThresholdFilter(const double* imageIn, Vec<size_t> dims, double alpha/*=1.0*/, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return otsuThresholdFilter(imageIn,dims,alpha,imageOut,device);
}


unsigned char cOtsuThresholdValue(const unsigned char* imageIn, Vec<size_t> dims, int device/*=0*/)
{
	return otsuThresholdValue(imageIn,dims,device);
}

unsigned short cOtsuThresholdValue(const unsigned short* imageIn, Vec<size_t> dims, int device/*=0*/)
{
	return otsuThresholdValue(imageIn,dims,device);
}

short cOtsuThresholdValue(const short* imageIn, Vec<size_t> dims, int device/*=0*/)
{
	return otsuThresholdValue(imageIn,dims,device);
}

unsigned int cOtsuThresholdValue(const unsigned int* imageIn, Vec<size_t> dims, int device/*=0*/)
{
	return otsuThresholdValue(imageIn,dims,device);
}

int cOtsuThresholdValue(const int* imageIn, Vec<size_t> dims, int device/*=0*/)
{
	return otsuThresholdValue(imageIn,dims,device);
}

float cOtsuThresholdValue(const float* imageIn, Vec<size_t> dims, int device/*=0*/)
{
	return otsuThresholdValue(imageIn,dims,device);
}

double cOtsuThresholdValue(const double* imageIn, Vec<size_t> dims, int device/*=0*/)
{
	return otsuThresholdValue(imageIn,dims,device);
}


unsigned char* cReduceImage(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method/*=MEAN*/, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return reduceImage(imageIn,dims,reductions,reducedDims,method,imageOut,device);
}

unsigned short* cReduceImage(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method/*=MEAN*/, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return reduceImage(imageIn,dims,reductions,reducedDims,method,imageOut,device);
}

short* cReduceImage(const short* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method/*=MEAN*/, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return reduceImage(imageIn,dims,reductions,reducedDims,method,imageOut,device);
}

unsigned int* cReduceImage(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method/*=MEAN*/, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return reduceImage(imageIn,dims,reductions,reducedDims,method,imageOut,device);
}

int* cReduceImage(const int* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method/*=MEAN*/, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return reduceImage(imageIn,dims,reductions,reducedDims,method,imageOut,device);
}

float* cReduceImage(const float* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method/*=MEAN*/, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return reduceImage(imageIn,dims,reductions,reducedDims,method,imageOut,device);
}

double* cReduceImage(const double* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method/*=MEAN*/, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return reduceImage(imageIn,dims,reductions,reducedDims,method,imageOut,device);
}


double cSumArray(const unsigned char* imageIn, size_t n, int device/*=0*/)
{
	return sumArray(imageIn,n,device);
}

double cSumArray(const unsigned short* imageIn, size_t n, int device/*=0*/)
{
	return sumArray(imageIn,n,device);
}

double cSumArray(const short* imageIn, size_t n, int device/*=0*/)
{
	return sumArray(imageIn,n,device);
}

double cSumArray(const unsigned int* imageIn, size_t n, int device/*=0*/)
{
	return sumArray(imageIn,n,device);
}

double cSumArray(const int* imageIn, size_t n, int device/*=0*/)
{
	return sumArray(imageIn,n,device);
}

double cSumArray(const float* imageIn, size_t n, int device/*=0*/)
{
	return sumArray(imageIn,n,device);
}

double cSumArray(const double* imageIn, size_t n, int device/*=0*/)
{
	return sumArray(imageIn,n,device);
}


unsigned char* cThresholdFilter(const unsigned char* imageIn, Vec<size_t> dims, unsigned char thresh, unsigned char** imageOut/*=NULL*/, int device/*=0*/)
{
	return thresholdFilter(imageIn,dims,thresh,imageOut,device);
}

unsigned short* cThresholdFilter(const unsigned short* imageIn, Vec<size_t> dims, unsigned short thresh, unsigned short** imageOut/*=NULL*/, int device/*=0*/)
{
	return thresholdFilter(imageIn,dims,thresh,imageOut,device);
}

short* cThresholdFilter(const short* imageIn, Vec<size_t> dims, short thresh, short** imageOut/*=NULL*/, int device/*=0*/)
{
	return thresholdFilter(imageIn,dims,thresh,imageOut,device);
}

unsigned int* cThresholdFilter(const unsigned int* imageIn, Vec<size_t> dims, unsigned int thresh, unsigned int** imageOut/*=NULL*/, int device/*=0*/)
{
	return thresholdFilter(imageIn,dims,thresh,imageOut,device);
}

int* cThresholdFilter(const int* imageIn, Vec<size_t> dims, int thresh, int** imageOut/*=NULL*/, int device/*=0*/)
{
	return thresholdFilter(imageIn,dims,thresh,imageOut,device);
}

float* cThresholdFilter(const float* imageIn, Vec<size_t> dims, float thresh, float** imageOut/*=NULL*/, int device/*=0*/)
{
	return thresholdFilter(imageIn,dims,thresh,imageOut,device);
}

double* cThresholdFilter(const double* imageIn, Vec<size_t> dims, double thresh, double** imageOut/*=NULL*/, int device/*=0*/)
{
	return thresholdFilter(imageIn,dims,thresh,imageOut,device);
}