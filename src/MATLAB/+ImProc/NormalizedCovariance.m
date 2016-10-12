% NormalizedCovariance - normalizedCovariance = NormalizedCovariance(imageIn1,imageIn2,device) 
function normalizedCovariance = NormalizedCovariance(imageIn1,imageIn2)
    % check for Cuda capable devices
    curPath = which('ImProc.Cuda');
    curPath = fileparts(curPath);
    n = ImProc.Cuda.DeviceCount();

    % if there are devices find the availble one and grab the mutex
    if (n>0)
       foundDevice = false;
       device = -1;
       
       while(~foundDevice)
        for deviceIdx=1:n
            mutexfile = fullfile(curPath,sprintf('device%02d.txt',deviceIdx));
            if (~exist(mutexfile,'file'))
                try
                       fclose(fopen(mutexfile,'wt'));
                catch errMsg
                       continue;
                end
                foundDevice = true;
                device = deviceIdx;
                break;
            end
        end
        if (~foundDevice)
            pause(2);
        end
       end
       
       try
            normalizedCovariance = ImProc.Cuda.NormalizedCovariance(imageIn1,imageIn2,device);
        catch errMsg
        	delete(mutexfile);
        	throw(errMsg);
        end
        
        delete(mutexfile);
    else
        normalizedCovariance = lclNormalizedCovariance(imageIn1,imageIn2);
    end
end

function normalizedCovariance = lclNormalizedCovariance(imageIn1,imageIn2)

end
