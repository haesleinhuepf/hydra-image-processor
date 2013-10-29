#include "MexCommand.h"
#include "Process.h"

void ContrastEnhancement::execute( int nlhs, mxArray* plhs[], int nrhs, const mxArray* prhs[] )
{
	Vec<unsigned int> imageDims;
	HostPixelType* imageIn, * imageOut;
	setupImagePointers(prhs[0],&imageIn,&imageDims,&plhs[0],&imageOut);

	double* sigmasD = (double*)mxGetData(prhs[1]);
	double* neighborhoodD = (double*)mxGetData(prhs[2]);

	Vec<float> sigmas((float)sigmasD[0],(float)sigmasD[1],(float)sigmasD[2]);
	Vec<unsigned int> neighborhood((int)neighborhoodD[0],(int)neighborhoodD[1],(int)neighborhoodD[2]);
	
	contrastEnhancement(imageIn,imageOut,imageDims,sigmas,neighborhood);
}

std::string ContrastEnhancement::check( int nlhs, mxArray* plhs[], int nrhs, const mxArray* prhs[] )
{
	if (nrhs!=3)
		return "Incorrect number of inputs!";

	if (nlhs!=1)
		return "Requires one output!";

	if (!mxIsUint8(prhs[0]))
		return "Image has to be formated as a uint8!";

	size_t numDims = mxGetNumberOfDimensions(prhs[0]);
	if (numDims>3 || numDims<2)
		return "Image can only be either 2D or 3D!";

	size_t numEl= mxGetNumberOfElements(prhs[1]);
	if (numEl!=3 || !mxIsDouble(prhs[1]))
		return "Sigmas has to be an array of three doubles!";

	numEl = mxGetNumberOfElements(prhs[2]);
	if (numEl!=3 || !mxIsDouble(prhs[2]))
		return "Median neighborhood has to be an array of three doubles!";

	return "";
}

std::string ContrastEnhancement::printUsage()
{
	return "imageOut = CudaMex('ContrastEnhancement',imageIn,[sigmaX,sigmaY,sigmaZ],[MedianNeighborhoodX,MedianNeighborhoodY,MedianNeighborhoodZ])";
}