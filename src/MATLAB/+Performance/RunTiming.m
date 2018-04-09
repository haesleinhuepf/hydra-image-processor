ImProc.BuildScript;

%%
m = memory;
sizes_rc = [5,6,7,8,9,10,11,12];
sizesMask = sizes_rc<=round(log2((m.MemAvailableAllArrays/2/6)^(1/3)));
sizesMask(find(sizesMask,1,'last')) = false;
sizes_rc = sizes_rc(sizesMask);
if (~any(sizes_rc))
    sizes_rc = 5;
end
sizeItter = length(sizes_rc):-1:1;
numTrials = 3;
types = {'uint8';'uint16';'single';'double'};
typeItter = size(types,1):-1:1;

%% Max Filter
maxTimes = Performance.MaxFilterGraph(sizes_rc,sizeItter,types,typeItter,numTrials);

%% Closure 
closeTimes = Performance.ClosureGraph(sizes_rc,sizeItter,types,typeItter,numTrials);

%% Mean Filter
meanTimes = Performance.MeanFilterGraph(sizes_rc,sizeItter,types,typeItter,numTrials);

%% Median Filter
medTimes = Performance.MedianFilterGraph(sizes_rc,sizeItter,types,typeItter,numTrials);

%% Std Filter
stdTimes = Performance.StdFilterGraph(sizes_rc,sizeItter,types,typeItter,numTrials);

%% GaussianFilter
sizeItterSm = sizeItter(1:end-1);
if (isempty(sizeItterSm))
    sizeItterSm = 1;
end
gaussTimes = Performance.GaussianFilterGraph(sizes_rc,sizeItterSm,types,typeItter,numTrials);

%% EntropyFilter
%entropyTimes = Performance.EntropyFilterGraph(sizes_rc,sizeItter,types,typeItter,numTrials);

%% Contrast Enhancement
sizeItterSm = sizeItter(1:end-1);
if (isempty(sizeItterSm))
    sizeItterSm = 1;
end
hpTimes = Performance.HighPassFilterGraph(sizes_rc,sizeItterSm,types,typeItter,numTrials);

%% Save out results
temp = what('ImProc');
ImProcPath = temp.path;
compName = getenv('computername');

save(fullfile(ImProcPath,[compName,'.mat']),'maxTimes','closeTimes','meanTimes','medTimes','stdTimes','medTimes','gaussTimes','hpTimes');