% Load case 1 traning data
close all; clear; clc;

load('trainingData1.mat')
clips = trainClips3(40,:,:);
%clips = reshape(clips, [100,55125]);
specs1 = makeSpectrogram(clips);
specs1 = reshape(specs1, [100,55125]);
%%
music = audioplayer(clips,11025);
play(music)
%%
vgt_spec = specs1;
n = size(vgt_spec,2);
L = 5;
tslide = linspace(0,L,100);
k=(2*pi/L)*[0:(n-1)/2 -(n-1)/2:-1]; 
ks=fftshift(k);

pcolor(tslide,ks,vgt_spec.'),
shading interp
set(gca,'Ylim',[0 1*10^4],'Fontsize',16) 
colormap(hot)