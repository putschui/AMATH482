function [pickedClips,Fs] = getClips(urls)
%getClips loads in music from a list of urls to songs, then cuts up each
%song into five second clips and returns 100 randomly selected clips
resampleN = 20;
sampleN = 100;
allClips = [];
targetFs = 2205;
fails = [];

for j = 1:length(urls)
    [y,Fs] = webread(urls(j));
    y = y';
    
    % Convert audio to mono
    if size(y,1) > 1
        y = (y(1,:) + y(2,:))./2;
    end
    
    % Resample data
    if mod(Fs,targetFs) == 0
        resampleN = Fs/targetFs;
        y = y(1:resampleN:end);
        Fs = Fs/resampleN;
    else
        fails = [fails j];
        continue
    end
    
    % Divide into 5 second clips
    nclips = round(length(y)/(Fs*5));
    clips = zeros(nclips-1,Fs*5);
    
    for jj = 1:nclips-1
        newClip = y((jj-1)*Fs*5+1:jj*Fs*5);
        clips(jj,:) = newClip;
    end
    
    allClips = [allClips; clips];
end

sampleInds = randsample(size(allClips,1),100);

pickedClips = zeros(sampleN,Fs*5);
for j = 1:length(sampleInds)
    ind = sampleInds(j);
    pickedClips(j,:) = allClips(ind,:);
end


end

