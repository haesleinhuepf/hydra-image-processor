#pragma once
#include "Vec.h"
#include "CudaDeviceStats.h"
#include "ImageContainer.h"


#ifdef IMAGE_PROCESSOR_DLL
#ifdef IMAGE_PROCESSOR_INTERNAL
#define IMAGE_PROCESSOR_API __declspec(dllexport)
#else
#define IMAGE_PROCESSOR_API __declspec(dllimport)
#endif // IMAGE_PROCESSOR_INTERNAL
#else
#define IMAGE_PROCESSOR_API
#endif // IMAGE_PROCESSOR_DLL

IMAGE_PROCESSOR_API void clearDevice();

IMAGE_PROCESSOR_API int deviceCount();
IMAGE_PROCESSOR_API int deviceStats(DevStats** stats);
IMAGE_PROCESSOR_API int memoryStats(size_t** stats);


/// Example wrapper header calls 
//IMAGE_PROCESSOR_API void fooFilter(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
//IMAGE_PROCESSOR_API void fooFilter(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
//IMAGE_PROCESSOR_API void fooFilter(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
//IMAGE_PROCESSOR_API void fooFilter(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
//IMAGE_PROCESSOR_API void fooFilter(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
//IMAGE_PROCESSOR_API void fooFilter(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
//IMAGE_PROCESSOR_API void fooFilter(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
//IMAGE_PROCESSOR_API void fooFilter(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
//IMAGE_PROCESSOR_API void fooFilter(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);

IMAGE_PROCESSOR_API void closure(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void closure(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void closure(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void closure(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void closure(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void closure(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void closure(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void closure(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void closure(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);

IMAGE_PROCESSOR_API void elementWiseDifference(const ImageContainer<bool> image1In, ImageContainer<bool> image2In, ImageContainer<bool>& imageOut, int device = -1);
IMAGE_PROCESSOR_API void elementWiseDifference(const ImageContainer<char> image1In, ImageContainer<char> image2In, ImageContainer<char>& imageOut, int device = -1);
IMAGE_PROCESSOR_API void elementWiseDifference(const ImageContainer<unsigned char> image1In, ImageContainer<unsigned char> image2In, ImageContainer<unsigned char>& imageOut, int device = -1);
IMAGE_PROCESSOR_API void elementWiseDifference(const ImageContainer<short> image1In, ImageContainer<short> image2In, ImageContainer<short>& imageOut, int device = -1);
IMAGE_PROCESSOR_API void elementWiseDifference(const ImageContainer<unsigned short> image1In, ImageContainer<unsigned short> image2In, ImageContainer<unsigned short>& imageOut, int device = -1);
IMAGE_PROCESSOR_API void elementWiseDifference(const ImageContainer<int> image1In, ImageContainer<int> image2In, ImageContainer<int>& imageOut, int device = -1);
IMAGE_PROCESSOR_API void elementWiseDifference(const ImageContainer<unsigned int> image1In, ImageContainer<unsigned int> image2In, ImageContainer<unsigned int>& imageOut, int device = -1);
IMAGE_PROCESSOR_API void elementWiseDifference(const ImageContainer<float> image1In, ImageContainer<float> image2In, ImageContainer<float>& imageOut, int device = -1);
IMAGE_PROCESSOR_API void elementWiseDifference(const ImageContainer<double> image1In, ImageContainer<double> image2In, ImageContainer<double>& imageOut, int device = -1);

IMAGE_PROCESSOR_API void gaussian(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void gaussian(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void gaussian(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void gaussian(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void gaussian(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void gaussian(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void gaussian(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void gaussian(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void gaussian(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);

IMAGE_PROCESSOR_API void LoG(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void LoG(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void LoG(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void LoG(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void LoG(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void LoG(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void LoG(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void LoG(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void LoG(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, Vec<double> sigmas, int numIterations = 1, int device = -1);

IMAGE_PROCESSOR_API void maxFilter(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void maxFilter(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void maxFilter(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void maxFilter(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void maxFilter(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void maxFilter(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void maxFilter(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void maxFilter(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void maxFilter(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);

IMAGE_PROCESSOR_API void meanFilter(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void meanFilter(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void meanFilter(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void meanFilter(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void meanFilter(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void meanFilter(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void meanFilter(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void meanFilter(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void meanFilter(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);

IMAGE_PROCESSOR_API void medianFilter(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void medianFilter(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void medianFilter(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void medianFilter(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void medianFilter(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void medianFilter(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void medianFilter(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void medianFilter(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void medianFilter(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);

IMAGE_PROCESSOR_API void minFilter(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void minFilter(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void minFilter(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void minFilter(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void minFilter(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void minFilter(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void minFilter(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void minFilter(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void minFilter(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);

IMAGE_PROCESSOR_API void multiplySum(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void multiplySum(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void multiplySum(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void multiplySum(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void multiplySum(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void multiplySum(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void multiplySum(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void multiplySum(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void multiplySum(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);

IMAGE_PROCESSOR_API void opener(const ImageContainer<bool> imageIn, ImageContainer<bool>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void opener(const ImageContainer<char> imageIn, ImageContainer<char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void opener(const ImageContainer<unsigned char> imageIn, ImageContainer<unsigned char>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void opener(const ImageContainer<short> imageIn, ImageContainer<short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void opener(const ImageContainer<unsigned short> imageIn, ImageContainer<unsigned short>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void opener(const ImageContainer<int> imageIn, ImageContainer<int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void opener(const ImageContainer<unsigned int> imageIn, ImageContainer<unsigned int>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void opener(const ImageContainer<float> imageIn, ImageContainer<float>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
IMAGE_PROCESSOR_API void opener(const ImageContainer<double> imageIn, ImageContainer<double>& imageOut, ImageContainer<float> kernel, int numIterations = 1, int device = -1);
