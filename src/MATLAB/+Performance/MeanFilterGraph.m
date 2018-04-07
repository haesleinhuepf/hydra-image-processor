function times = MeanFilterGraph(sizes_rc,sizeItter,types,typeItter,numTrials)
    % times has size of image, cuda time, matlab time, cuda times faster,
    %   matlab over cuda
    % third dimension is type
    numItters = length(sizeItter)*length(typeItter);
    
    kernel = ones(5,5,3,'single');
    
    times = zeros(length(sizeItter),5,length(typeItter));
    prgs = Utils.CmdlnProgress(numItters,true,'MeanFilter');
    j = 0;
    for i = sizeItter
        szImage = rand(2^sizes_rc(i),2^sizes_rc(i),2^(sizes_rc(i)-4),2,3,'single');
        for ty = typeItter
            im = ImUtils.ConvertType(szImage,types{ty},true);
            times(i,1,ty) = numel(im);

            ts = zeros(numTrials,2);
            for j=1:numTrials
                [ts(j,1),ts(j,2)] = Performance.MeanFilter(im,kernel);
            end
            times(i,2:3,ty) = mean(ts,1);
            j = j +1;
            prgs.PrintProgress(j);
        end
    end
    prgs.ClearProgress(true);
    clear im
    times(:,4,:) = (times(:,2,:)./times(:,3,:))*100;
    times(:,5,:) = times(:,3,:)./times(:,2,:);

    Performance.PlotResults(times,'MeanFilter [5,5,3]');
end