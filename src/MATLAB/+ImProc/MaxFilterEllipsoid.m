% MaxFilterEllipsoid - imageOut = MaxFilterEllipsoid(imageIn,radius,device) 
function imageOut = MaxFilterEllipsoid(imageIn,radius)
    % check for Cuda capable devices
    curPath = which('ImProc.Cuda');
    curPath = fileparts(curPath);
    devStats = ImProc.Cuda.DeviceStats();
	n = length(devStats);

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
				f = fopen(mutexfile,'at');
				fprintf(f,'%s',devStats(deviceIdx).name);
				fclose(f);
                device = deviceIdx;
                break;
            end
        end
        if (~foundDevice)
            pause(2);
        end
       end
       
       try
            imageOut = ImProc.Cuda.MaxFilterEllipsoid(imageIn,radius,device);
        catch errMsg
        	delete(mutexfile);
        	throw(errMsg);
        end
        
        delete(mutexfile);
    else
        imageOut = lclMaxFilterEllipsoid(imageIn,radius);
    end
end

function imageOut = lclMaxFilterEllipsoid(imageIn,radius)

end

