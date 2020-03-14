function [spectrograms] = makeSpectrogram(clips)
% Takes an array of music clips and returns an array of the corresponding
% spectrograms
Fs = 2205;
N = size(clips,1);
L = 5;
a = 50;
tslide = linspace(0,L,100);

spectrograms = zeros(length(tslide)*Fs*5,N);

for j=1:N
    v = clips(j,:);
    % Constuct time domain of signal
    t = (1:length(v))/Fs;
    % Number of samples
    n = length(v);
    % Construct Frequency Domain
    k=(2*pi/L)*[0:(n-1)/2 -(n-1)/2:-1]; 
    ks=fftshift(k);
    
    spec = zeros(length(tslide),n);
    
    for jj = 1:length(tslide)
        g = exp(-a * (t-tslide(jj)).^2);
        vg = g.*v;
        vgt = fft(vg);
        spec(jj,:) = fftshift(abs(vgt));
    end
    
    % Stretch spectrogram to a vector
    spec = reshape(spec, [length(tslide)*Fs*5,1]);
    
    spectrograms(:,j) = spec;
end

end

