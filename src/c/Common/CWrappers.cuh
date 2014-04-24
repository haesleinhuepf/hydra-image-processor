#pragma once
#include "Vec.h"
#include <limits>
#include "Defines.h"

unsigned char* cAddConstant(const unsigned char* imageIn, Vec<size_t> dims, double additive, unsigned char** imageOut=NULL, int device=0);
unsigned short* cAddConstant(const unsigned short* imageIn, Vec<size_t> dims, double additive, unsigned short** imageOut=NULL, int device=0);
short* cAddConstant(const short* imageIn, Vec<size_t> dims, double additive, short** imageOut=NULL, int device=0);
unsigned int* cAddConstant(const unsigned int* imageIn, Vec<size_t> dims, double additive, unsigned int** imageOut=NULL, int device=0);
int* cAddConstant(const int* imageIn, Vec<size_t> dims, double additive, int** imageOut=NULL, int device=0);
float* cAddConstant(const float* imageIn, Vec<size_t> dims, double additive, float** imageOut=NULL, int device=0);
double* cAddConstant(const double* imageIn, Vec<size_t> dims, double additive, double** imageOut=NULL, int device=0);

unsigned char* cAddImageWith(const unsigned char* imageIn1, const unsigned char* imageIn2, Vec<size_t> dims, double additive, unsigned char** imageOut=NULL, int device=0);
unsigned short* cAddImageWith(const unsigned short* imageIn1, const unsigned short* imageIn2, Vec<size_t> dims, double additive, unsigned short** imageOut=NULL, int device=0);
short* cAddImageWith(const short* imageIn1, const short* imageIn2, Vec<size_t> dims, double additive, short** imageOut=NULL, int device=0);
unsigned int* cAddImageWith(const unsigned int* imageIn1, const unsigned int* imageIn2, Vec<size_t> dims, double additive, unsigned int** imageOut=NULL, int device=0);
int* cAddImageWith(const int* imageIn1, const int* imageIn2, Vec<size_t> dims, double additive, int** imageOut=NULL, int device=0);
float* cAddImageWith(const float* imageIn1, const float* imageIn2, Vec<size_t> dims, double additive, float** imageOut=NULL, int device=0);
double* cAddImageWith(const double* imageIn1, const double* imageIn2, Vec<size_t> dims, double additive, double** imageOut=NULL, int device=0);

unsigned char* cApplyPolyTransferFunction(const unsigned char* imageIn, Vec<size_t> dims, double a, double b, double c, unsigned char minValue=std::numeric_limits<unsigned char>::lowest(), unsigned char maxValue=std::numeric_limits<unsigned char>::max(), unsigned char** imageOut=NULL, int device=0);
unsigned short* cApplyPolyTransferFunction(const unsigned short* imageIn, Vec<size_t> dims, double a, double b, double c, unsigned short minValue=std::numeric_limits<unsigned short>::lowest(), unsigned short maxValue=std::numeric_limits<unsigned short>::max(), unsigned short** imageOut=NULL, int device=0);
short* cApplyPolyTransferFunction(const short* imageIn, Vec<size_t> dims, double a, double b, double c, short minValue=std::numeric_limits<short>::lowest(), short maxValue=std::numeric_limits<short>::max(), short** imageOut=NULL, int device=0);
unsigned int* cApplyPolyTransferFunction(const unsigned int* imageIn, Vec<size_t> dims, double a, double b, double c, unsigned int minValue=std::numeric_limits<unsigned int>::lowest(),unsigned int maxValue=std::numeric_limits<unsigned int>::max(), unsigned int** imageOut=NULL, int device=0);
int* cApplyPolyTransferFunction(const int* imageIn, Vec<size_t> dims, double a, double b, double c, int minValue=std::numeric_limits<int>::lowest(), int maxValue=std::numeric_limits<int>::max(), int** imageOut=NULL, int device=0);
float* cApplyPolyTransferFunction(const float* imageIn, Vec<size_t> dims, double a, double b, double c, float minValue=std::numeric_limits<float>::lowest(), float maxValue=std::numeric_limits<float>::max(), float** imageOut=NULL, int device=0);
double* cApplyPolyTransferFunction(const double* imageIn, Vec<size_t> dims, double a, double b, double c, double minValue=std::numeric_limits<double>::lowest(), double maxValue=std::numeric_limits<double>::max(),double** imageOut=NULL, int device=0);

unsigned char* cContrastEnhancement(const unsigned char* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, unsigned char** imageOut=NULL, int device=0);
unsigned short* cContrastEnhancement(const unsigned short* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, unsigned short** imageOut=NULL, int device=0);
short* cContrastEnhancement(const short* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, short** imageOut=NULL, int device=0);
unsigned int* cContrastEnhancement(const unsigned int* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, unsigned int** imageOut=NULL, int device=0);
int* cContrastEnhancement(const int* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, int** imageOut=NULL, int device=0);
float* cContrastEnhancement(const float* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, float** imageOut=NULL, int device=0);
double* cContrastEnhancement(const double* imageIn, Vec<size_t> dims, Vec<float> sigmas, Vec<size_t> neighborhood, double** imageOut=NULL, int device=0);

size_t* cHistogram(const unsigned char* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned char minVal=std::numeric_limits<unsigned char>::lowest(), unsigned char maxVal=std::numeric_limits<unsigned char>::max(), int device=0);
size_t* cHistogram(const unsigned short* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned short minVal=std::numeric_limits<unsigned short>::lowest(), unsigned short maxVal=std::numeric_limits<unsigned short>::max(), int device=0);
size_t* cHistogram(const short* imageIn, Vec<size_t> dims, unsigned int arraySize, short minVal=std::numeric_limits<short>::lowest(), short maxVal=std::numeric_limits<short>::max(), int device=0);
size_t* cHistogram(const unsigned int* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned int minVal=std::numeric_limits<unsigned int>::lowest(), unsigned int maxVal=std::numeric_limits<unsigned int>::max(), int device=0);
size_t* cHistogram(const int* imageIn, Vec<size_t> dims, unsigned int arraySize, int minVal=std::numeric_limits<int>::lowest(), int maxVal=std::numeric_limits<int>::max(), int device=0);
size_t* cHistogram(const float* imageIn, Vec<size_t> dims, unsigned int arraySize, float minVal=std::numeric_limits<float>::lowest(), float maxVal=std::numeric_limits<float>::max(), int device=0);
size_t* cHistogram(const double* imageIn, Vec<size_t> dims, unsigned int arraySize, double minVal=std::numeric_limits<double>::lowest(), double maxVal=std::numeric_limits<double>::max(), int device=0);

unsigned char* cGaussianFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<float> sigmas, unsigned char** imageOut=NULL, int device=0);
unsigned short* cGaussianFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<float> sigmas, unsigned short** imageOut=NULL, int device=0);
short* cGaussianFilter(const short* imageIn, Vec<size_t> dims, Vec<float> sigmas, short** imageOut=NULL, int device=0);
unsigned int* cGaussianFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<float> sigmas, unsigned int** imageOut=NULL, int device=0);
int* cGaussianFilter(const int* imageIn, Vec<size_t> dims, Vec<float> sigmas, int** imageOut=NULL, int device=0);
float* cGaussianFilter(const float* imageIn, Vec<size_t> dims, Vec<float> sigmas, float** imageOut=NULL, int device=0);
double* cGaussianFilter(const double* imageIn, Vec<size_t> dims, Vec<float> sigmas, double** imageOut=NULL, int device=0);

void cGetMinMax(const unsigned char* imageIn, Vec<size_t> dims, unsigned char& minVal, unsigned char& maxVal, int device=0);
void cGetMinMax(const unsigned short* imageIn, Vec<size_t> dims, unsigned short& minVal, unsigned short& maxVal, int device=0);
void cGetMinMax(const short* imageIn, Vec<size_t> dims, short& minVal, short& maxVal, int device=0);
void cGetMinMax(const unsigned int* imageIn, Vec<size_t> dims, unsigned int& minVal, unsigned int& maxVal, int device=0);
void cGetMinMax(const int* imageIn, Vec<size_t> dims, int& minVal, int& maxVal, int device=0);
void cGetMinMax(const float* imageIn, Vec<size_t> dims, float& minVal, float& maxVal, int device=0);
void cGetMinMax(const double* imageIn, Vec<size_t> dims, double& minVal, double& maxVal, int device=0);

unsigned char* cImagePow(const unsigned char* imageIn, Vec<size_t> dims, double power, unsigned char** imageOut=NULL, int device=0);
unsigned short* cImagePow(const unsigned short* imageIn, Vec<size_t> dims, double power, unsigned short** imageOut=NULL, int device=0);
short* cImagePow(const short* imageIn, Vec<size_t> dims, double power, short** imageOut=NULL, int device=0);
unsigned int* cImagePow(const unsigned int* imageIn, Vec<size_t> dims, double power, unsigned int** imageOut=NULL, int device=0);
int* cImagePow(const int* imageIn, Vec<size_t> dims, double power, int** imageOut=NULL, int device=0);
float* cImagePow(const float* imageIn, Vec<size_t> dims, double power, float** imageOut=NULL, int device=0);
double* cImagePow(const double* imageIn, Vec<size_t> dims, double power, double** imageOut=NULL, int device=0);

unsigned char* cMaxFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, unsigned char** imageOut=NULL, int device=0);
unsigned short* cMaxFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, unsigned short** imageOut=NULL, int device=0);
short* cMaxFilter(const short* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, short** imageOut=NULL, int device=0);
unsigned int* cMaxFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, unsigned int** imageOut=NULL, int device=0);
int* cMaxFilter(const int* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, int** imageOut=NULL, int device=0);
float* cMaxFilter(const float* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, float** imageOut=NULL, int device=0);
double* cMaxFilter(const double* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, double** imageOut=NULL, int device=0);

unsigned char* cMeanFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned char** imageOut=NULL, int device=0);
unsigned short* cMeanFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned short** imageOut=NULL, int device=0);
short* cMeanFilter(const short* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, short** imageOut=NULL, int device=0);
unsigned int* cMeanFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned int** imageOut=NULL, int device=0);
int* cMeanFilter(const int* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, int** imageOut=NULL, int device=0);
float* cMeanFilter(const float* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, float** imageOut=NULL, int device=0);
double* cMeanFilter(const double* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, double** imageOut=NULL, int device=0);

unsigned char* cMedianFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned char** imageOut=NULL, int device=0);
unsigned short* cMedianFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned short** imageOut=NULL, int device=0);
short* cMedianFilter(const short* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, short** imageOut=NULL, int device=0);
unsigned int* cMedianFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, unsigned int** imageOut=NULL, int device=0);
int* cMedianFilter(const int* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, int** imageOut=NULL, int device=0);
float* cMedianFilter(const float* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, float** imageOut=NULL, int device=0);
double* cMedianFilter(const double* imageIn, Vec<size_t> dims, Vec<size_t> neighborhood, double** imageOut=NULL, int device=0);


unsigned char* cMinFilter(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, unsigned char** imageOut=NULL, int device=0);
unsigned short* cMinFilter(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, unsigned short** imageOut=NULL, int device=0);
short* cMinFilter(const short* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, short** imageOut=NULL, int device=0);
unsigned int* cMinFilter(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, unsigned int** imageOut=NULL, int device=0);
int* cMinFilter(const int* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, int** imageOut=NULL, int device=0);
float* cMinFilter(const float* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, float** imageOut=NULL, int device=0);
double* cMinFilter(const double* imageIn, Vec<size_t> dims, Vec<size_t> kernelDims, float* kernel=NULL, double** imageOut=NULL, int device=0);

unsigned char* cMultiplyImage(const unsigned char* imageIn, Vec<size_t> dims, double multiplier, unsigned char** imageOut=NULL, int device=0);
unsigned short* cMultiplyImage(const unsigned short* imageIn, Vec<size_t> dims, double multiplier, unsigned short** imageOut=NULL, int device=0);
short* cMultiplyImage(const short* imageIn, Vec<size_t> dims, double multiplier, short** imageOut=NULL, int device=0);
unsigned int* cMultiplyImage(const unsigned int* imageIn, Vec<size_t> dims, double multiplier, unsigned int** imageOut=NULL, int device=0);
int* cMultiplyImage(const int* imageIn, Vec<size_t> dims, double multiplier, int** imageOut=NULL, int device=0);
float* cMultiplyImage(const float* imageIn, Vec<size_t> dims, double multiplier, float** imageOut=NULL, int device=0);
double* cMultiplyImage(const double* imageIn, Vec<size_t> dims, double multiplier, double** imageOut=NULL, int device=0);

unsigned char* cMultiplyImageWith(const unsigned char* imageIn1, const unsigned char* imageIn2, Vec<size_t> dims, double factor, unsigned char** imageOut=NULL, int device=0);
unsigned short* cMultiplyImageWith(const unsigned short* imageIn1, const unsigned short* imageIn2, Vec<size_t> dims, double factor, unsigned short** imageOut=NULL, int device=0);
short* cMultiplyImageWith(const short* imageIn1, const short* imageIn2, Vec<size_t> dims, double factor, short** imageOut=NULL, int device=0);
unsigned int* cMultiplyImageWith(const unsigned int* imageIn1, const unsigned int* imageIn2, Vec<size_t> dims, double factor, unsigned int** imageOut=NULL, int device=0);
int* cMultiplyImageWith(const int* imageIn1, const int* imageIn2, Vec<size_t> dims, double factor, int** imageOut=NULL, int device=0);
float* cMultiplyImageWith(const float* imageIn1, const float* imageIn2, Vec<size_t> dims, double factor, float** imageOut=NULL, int device=0);
double* cMultiplyImageWith(const double* imageIn1, const double* imageIn2, Vec<size_t> dims, double factor, double** imageOut=NULL, int device=0);

double cNormalizedCovariance(const unsigned char* imageIn1, const unsigned char* imageIn2, Vec<size_t> dims, int device=0);
double cNormalizedCovariance(const unsigned short* imageIn1, const unsigned short* imageIn2, Vec<size_t> dims, int device=0);
double cNormalizedCovariance(const short* imageIn1, const short* imageIn2, Vec<size_t> dims, int device=0);
double cNormalizedCovariance(const unsigned int* imageIn1, const unsigned int* imageIn2, Vec<size_t> dims, int device=0);
double cNormalizedCovariance(const int* imageIn1, const int* imageIn2, Vec<size_t> dims, int device=0);
double cNormalizedCovariance(const float* imageIn1, const float* imageIn2, Vec<size_t> dims, int device=0);
double cNormalizedCovariance(const double* imageIn1, const double* imageIn2, Vec<size_t> dims, int device=0);

double* cNormalizeHistogram(const unsigned char* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned char minVal=std::numeric_limits<unsigned char>::lowest(), unsigned char maxVal=std::numeric_limits<unsigned char>::max(), int device=0);
double* cNormalizeHistogram(const unsigned short* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned short minVal=std::numeric_limits<unsigned short>::lowest(), unsigned short maxVal=std::numeric_limits<unsigned short>::max(), int device=0);
double* cNormalizeHistogram(const short* imageIn, Vec<size_t> dims, unsigned int arraySize, short minVal=std::numeric_limits<int>::lowest(), short maxVal=std::numeric_limits<short>::max(), int device=0);
double* cNormalizeHistogram(const unsigned int* imageIn, Vec<size_t> dims, unsigned int arraySize, unsigned int minVal=std::numeric_limits<unsigned int>::lowest(), unsigned int maxVal=std::numeric_limits<unsigned int>::max(), int device=0);
double* cNormalizeHistogram(const int* imageIn, Vec<size_t> dims, unsigned int arraySize, int minVal=std::numeric_limits<int>::lowest(), int maxVal=std::numeric_limits<int>::max(), int device=0);
double* cNormalizeHistogram(const float* imageIn, Vec<size_t> dims, unsigned int arraySize, float minVal=std::numeric_limits<float>::lowest(), float maxVal=std::numeric_limits<float>::max(), int device=0);
double* cNormalizeHistogram(const double* imageIn, Vec<size_t> dims, unsigned int arraySize, double minVal=std::numeric_limits<double>::lowest(), double maxVal=std::numeric_limits<double>::max(), int device=0);

unsigned char* cOtsuThresholdFilter(const unsigned char* imageIn, Vec<size_t> dims, double alpha=1.0, unsigned char** imageOut=NULL, int device=0);
unsigned short* cOtsuThresholdFilter(const unsigned short* imageIn, Vec<size_t> dims, double alpha=1.0, unsigned short** imageOut=NULL, int device=0);
short* cOtsuThresholdFilter(const short* imageIn, Vec<size_t> dims, double alpha=1.0, short** imageOut=NULL, int device=0);
unsigned int* cOtsuThresholdFilter(const unsigned int* imageIn, Vec<size_t> dims, double alpha=1.0, unsigned int** imageOut=NULL, int device=0);
int* cOtsuThresholdFilter(const int* imageIn, Vec<size_t> dims, double alpha=1.0, int** imageOut=NULL, int device=0);
float* cOtsuThresholdFilter(const float* imageIn, Vec<size_t> dims, double alpha=1.0, float** imageOut=NULL, int device=0);
double* cOtsuThresholdFilter(const double* imageIn, Vec<size_t> dims, double alpha=1.0, double** imageOut=NULL, int device=0);

unsigned char cOtsuThresholdValue(const unsigned char* imageIn, Vec<size_t> dims, int device=0);
unsigned short cOtsuThresholdValue(const unsigned short* imageIn, Vec<size_t> dims, int device=0);
short cOtsuThresholdValue(const short* imageIn, Vec<size_t> dims, int device=0);
unsigned int cOtsuThresholdValue(const unsigned int* imageIn, Vec<size_t> dims, int device=0);
int cOtsuThresholdValue(const int* imageIn, Vec<size_t> dims, int device=0);
float cOtsuThresholdValue(const float* imageIn, Vec<size_t> dims, int device=0);
double cOtsuThresholdValue(const double* imageIn, Vec<size_t> dims, int device=0);

unsigned char* cReduceImage(const unsigned char* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method=REDUC_MEAN, unsigned char** imageOut=NULL, int device=0);
unsigned short* cReduceImage(const unsigned short* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method=REDUC_MEAN, unsigned short** imageOut=NULL, int device=0);
short* cReduceImage(const short* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method=REDUC_MEAN, short** imageOut=NULL, int device=0);
unsigned int* cReduceImage(const unsigned int* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method=REDUC_MEAN, unsigned int** imageOut=NULL, int device=0);
int* cReduceImage(const int* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method=REDUC_MEAN, int** imageOut=NULL, int device=0);
float* cReduceImage(const float* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method=REDUC_MEAN, float** imageOut=NULL, int device=0);
double* cReduceImage(const double* imageIn, Vec<size_t> dims, Vec<size_t> reductions, Vec<size_t>& reducedDims, ReductionMethods method=REDUC_MEAN, double** imageOut=NULL, int device=0);

double cSumArray(const unsigned char* imageIn, size_t n, int device=0);
double cSumArray(const unsigned short* imageIn, size_t n, int device=0);
double cSumArray(const short* imageIn, size_t n, int device=0);
double cSumArray(const unsigned int* imageIn, size_t n, int device=0);
double cSumArray(const int* imageIn, size_t n, int device=0);
double cSumArray(const float* imageIn, size_t n, int device=0);
double cSumArray(const double* imageIn, size_t n, int device=0);

unsigned char* cThresholdFilter(const unsigned char* imageIn, Vec<size_t> dims, unsigned char thresh, unsigned char** imageOut=NULL, int device=0);
unsigned short* cThresholdFilter(const unsigned short* imageIn, Vec<size_t> dims, unsigned short thresh, unsigned short** imageOut=NULL, int device=0);
short* cThresholdFilter(const short* imageIn, Vec<size_t> dims, int thresh, short** imageOut=NULL, int device=0);
unsigned int* cThresholdFilter(const unsigned int* imageIn, Vec<size_t> dims, unsigned int thresh, unsigned int** imageOut=NULL, int device=0);
int* cThresholdFilter(const int* imageIn, Vec<size_t> dims, int thresh, int** imageOut=NULL, int device=0);
float* cThresholdFilter(const float* imageIn, Vec<size_t> dims, float thresh, float** imageOut=NULL, int device=0);
double* cThresholdFilter(const double* imageIn, Vec<size_t> dims, double thresh, double** imageOut=NULL, int device=0);