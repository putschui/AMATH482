% Part II
clear; close all; clc;
[y1,Fs1] = audioread('music1.wav');
[y2,Fs2] = audioread('music2.wav');
% Signal
v1 = y1';
v2 = y2';
% Time domain of signal
t1 = (1:length(v1))/Fs1;
t2 = (1:length(v2))/Fs2;
% Length of signal in seconds
L1 = t1(length(t1));
L2 = t2(length(t2));
% Number of samples
n1 = length(v1);
n2 = length(v2);
% Construct Frequency Domain
k1=(2*pi/L1)*[0:n1/2-1 -n1/2:-1]; 
ks1=fftshift(k1);
k2=(2*pi/L2)*[0:n2/2-1 -n2/2:-1]; 
ks2=fftshift(k2);

a1 = 50;
tslide1 = linspace(0,L1,100);
tslide2 = linspace(0,L2,100);

% Gabor Transform for piano
vgt_spec1 = zeros(length(tslide1),n1);
max_freq1 = zeros(length(tslide1),1);
for j = 1:length(tslide1)
    g1 = exp(-a1 * (t1-tslide1(j)).^2);
    vg1 = g1.*v1;
    vgt1 = fft(vg1);
    vgt_spec1(j,:) = fftshift(abs(vgt1));
    [M,I] = max(abs(vgt1));
    max_freq1(j) = abs(k1(I))/(2*pi);
end

% Gabor Transform for recorder
a2 = 50;
vgt_spec2 = zeros(length(tslide2),n2);
max_freq2 = zeros(length(tslide2),1);
for j = 1:length(tslide2)
    g2 = exp(-a2 * (t2-tslide2(j)).^2);
    vg2 = g2.*v2;
    vgt2 = fft(vg2);
    vgt_spec2(j,:) = fftshift(abs(vgt2));
    [M,I] = max(abs(vgt2));
    max_freq2(j) = abs(k2(I))/(2*pi);
end
%% Plot spectrograms
% Piano
figure(1)
pcolor(tslide1,ks1/(2*pi),vgt_spec1.'),
shading interp
title('Spectrogram of Piano Recording')
xlabel('time (sec)')
ylabel('frequency (Hz)')
set(gca,'Ylim',[0 4000],'Fontsize',16) 
colormap(hot)
%%
figure(2)
pcolor(tslide1,ks1/(2*pi),vgt_spec1.'),
shading interp
title('Spectrogram of Piano Recording Zoomed In')
xlabel('time (sec)')
ylabel('frequency (Hz)')
set(gca,'Ylim',[0 1000],'Fontsize',16) 
colormap(hot)
%%
% Recorder
figure(3)
pcolor(tslide2,ks2/(2*pi),vgt_spec2.'),
shading interp
title('Spectrogram of Recorder Recording')
xlabel('time (sec)')
ylabel('frequency (Hz)')
set(gca,'Ylim',[0 4000],'Fontsize',16) 
colormap(hot)

%% Plots to help identify note frequencies
% Piano
figure(4)
plot(tslide1,max_freq1)
title('Piano Frequencies Over Time')
xlabel('time (sec)')
ylabel('frequency (Hz)')

% Recorder
figure(5)
plot(tslide2,max_freq2)
title('Recorder Frequencies Over Time')
xlabel('time (sec)')
ylabel('frequency (Hz)')