% ImagePow - This will raise each voxel value to the power provided.
%    imageOut = ImProc.ImagePow(imageIn,power);
%    	ImageIn -- can be an image up to three dimensions and of type (uint8,int8,uint16,int16,uint32,int32,single,double).
%    	Power -- must be a double.
%    	ImageOut -- will have the same dimensions and type as imageIn. Values are clamped to the range of the image space.
function imageOut = ImagePow(imageIn,power)
    % check for Cuda capable devices
    devStats = ImProc.Cuda.DeviceStats();
    n = length(devStats);
    
    % if there are devices find the availble one and grab the mutex
    if (n>0)
       [~,I] = max([devStats.totalMem]);
       try
            imageOut = ImProc.Cuda.ImagePow(imageIn,power,I);
        catch errMsg
        	throw(errMsg);
        end
        
    else
        imageOut = lclImagePow(imageIn,power);
    end
end

function imageOut = lclImagePow(imageIn,power)

end

