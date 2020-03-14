% Part I
clear; close all; clc;
load handel
% Signal
v = y';
% Time domain of signal
t = (1:length(v))/Fs;
% Length of signal in seconds
L = t(length(t));
% Number of samples
n = length(v);
% Construct Frequency Domain
k=(2*pi/L)*[0:(n-1)/2 -(n-1)/2:-1]; 
ks=fftshift(k);

%plot Time domain
figure(1);
plot(t,v);
xlabel('Time [sec]');
ylabel('Amplitude');
title('Signal of Interest, v(n)');
%%
%p8 = audioplayer(v,Fs);
%playblocking(p8);
%% Create spectrograms with different window sizes
sgtitle('Spectrograms Created with Gabor Transforms with Different Window Sizes')
a = [1 5 20 50];
for jj = 1:length(a)
    tslide = linspace(0,L,100);
    vgt_spec = zeros(length(tslide),n);
    for j = 1:length(tslide)
        g = exp(-a(jj) * (t-tslide(j)).^2);
        vg = g.*v;
        vgt = fft(vg);
        vgt_spec(j,:) = fftshift(abs(vgt));
    end

    subplot(2,2,jj)
    pcolor(tslide,ks,vgt_spec.'),
    shading interp
    title(['a = ',num2str(a(jj))],'Fontsize',10)
    xlabel('time (sec)')
    ylabel('frequency')
    set(gca,'Ylim',[-1*10^4 1*10^4],'Fontsize',16) 
    colormap(hot)
end
%% Create spectrograms with different numbers of window translations
sgtitle('Spectrograms Created with Gabor Transforms with Different Numbers of Window Translations')
a = 20;
tslide_vec = [10 40 100 400];
for jj = 1:length(tslide_vec)
    tslide = linspace(0,L,tslide_vec(jj));
    vgt_spec = zeros(length(tslide),n);
    for j = 1:length(tslide)
        g = exp(-a * (t-tslide(j)).^2);
        vg = g.*v;
        vgt = fft(vg);
        vgt_spec(j,:) = fftshift(abs(vgt));
    end

    subplot(2,2,jj)
    pcolor(tslide,ks,vgt_spec.'),
    shading interp
    title(['tslide length = ',num2str(length(tslide))],'Fontsize',10)
    xlabel('time (sec)')
    ylabel('frequency')
    set(gca,'Ylim',[-1*10^4 1*10^4],'Fontsize',16) 
    colormap(hot)
end
%% Create spectrograms with different window sizes using a mexican hat wavelet
sgtitle('Spectrograms Created with Gabor Transforms with Different Window Sizes Using a Mexican Hat Wavelet')
a = [1 5 20 50];
for jj = 1:length(a)
    tslide = linspace(0,L,100);
    vgt_spec = zeros(length(tslide),n);
    for j = 1:length(tslide)
        g = (1-a(jj)*(t-tslide(j)).^2).* exp(-a(jj)*(t-tslide(j)).^2/2);
        vg = g.*v;
        vgt = fft(vg);
        vgt_spec(j,:) = fftshift(abs(vgt));
    end

    subplot(2,2,jj)
    pcolor(tslide,ks,vgt_spec.'),
    shading interp
    title(['a = ',num2str(a(jj))],'Fontsize',10)
    xlabel('time (sec)')
    ylabel('frequency')
    set(gca,'Ylim',[-1*10^4 1*10^4],'Fontsize',16) 
    colormap(hot)
end
%% Create spectrograms with different numbers of window translations
sgtitle('Spectrograms Created with Gabor Transforms with Different Numbers of Window Translations with a Mexican Hat Wavelet')
a = 20;
tslide_vec = [10 40 100 400];
for jj = 1:length(tslide_vec)
    tslide = linspace(0,L,tslide_vec(jj));
    vgt_spec = zeros(length(tslide),n);
    for j = 1:length(tslide)
        g = (1-a*(t-tslide(j)).^2).* exp(-a*(t-tslide(j)).^2/2);
        vg = g.*v;
        vgt = fft(vg);
        vgt_spec(j,:) = fftshift(abs(vgt));
    end

    subplot(2,2,jj)
    pcolor(tslide,ks,vgt_spec.'),
    shading interp
    title(['tslide length = ',num2str(length(tslide))],'Fontsize',10)
    xlabel('time (sec)')
    ylabel('frequency')
    set(gca,'Ylim',[-1*10^4 1*10^4],'Fontsize',16) 
    colormap(hot)
end
%% Create spectrograms with different window sizes using a Shannon filter
sgtitle('Spectrograms Created with Gabor Transforms with Different Window Sizes Using a Shannon Filter')
a = [1 5 20 50];
for jj = 1:length(a)
    tslide = linspace(0,L,100);
    vgt_spec = zeros(length(tslide),n);
    for j = 1:length(tslide)
        g = round(exp(-a(jj) * (t-tslide(j)).^2));
        vg = g.*v;
        vgt = fft(vg);
        vgt_spec(j,:) = fftshift(abs(vgt));
    end

    subplot(2,2,jj)
    pcolor(tslide,ks,vgt_spec.'),
    shading interp
    title(['a = ',num2str(a(jj))],'Fontsize',10)
    xlabel('time (sec)')
    ylabel('frequency')
    set(gca,'Ylim',[-1*10^4 1*10^4],'Fontsize',16) 
    colormap(hot)
end
%% Create spectrograms with different numbers of window translations using a Shannon filter
sgtitle('Spectrograms Created with Gabor Transforms with Different Numbers of Window Translations Using a Shannon Filter')
a = 20;
tslide_vec = [10 40 100 400];
for jj = 1:length(tslide_vec)
    tslide = linspace(0,L,tslide_vec(jj));
    vgt_spec = zeros(length(tslide),n);
    for j = 1:length(tslide)
        g = round(exp(-a * (t-tslide(j)).^2));
        vg = g.*v;
        vgt = fft(vg);
        vgt_spec(j,:) = fftshift(abs(vgt));
    end

    subplot(2,2,jj)
    pcolor(tslide,ks,vgt_spec.'),
    shading interp
    title(['tslide length = ',num2str(length(tslide))],'Fontsize',10)
    xlabel('time (sec)')
    ylabel('frequency')
    set(gca,'Ylim',[-1*10^4 1*10^4],'Fontsize',16) 
    colormap(hot)
end