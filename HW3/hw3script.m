clear; clc; close all;

load('cam1_1.mat')
implay(vidFrames1_1)

numFrames = size(vidFrames1_1,4);

% Make all frames grey
% And get average of all frames
%avgFrame = zeros(480,640);
startx = 243;
endx = 445;
gvidFrames1_1 = zeros(480,endx-startx+1,numFrames);
for j = 1:numFrames
    gvidFrames1_1(:,:,j) = rgb2gray(vidFrames1_1(:,startx:endx,:,j));
    %avgFrame = avgFrame + im2double(gvidFrames1_1(:,:,j));
end

%avgFrame = avgFrame/numFrames;
%%
% display average frame
% figure(1)
% imagesc(avgFrame)
% colormap gray

diff = zeros(480,640,numFrames);

for j = 1:numFrames
    frame1 = gvidFrames1_1(:,:,j);
    diff(:,:,j) = frame1-avgFrame;
end

diff(diff<0) = 0;
%Display difference video
for j = 1:numFrames
    X = diff(:,:,j);
    figure(2)
    imagesc(X)
    colormap gray
    drawnow
end

%% Collect position data
x_inds = zeros(numFrames,1);
y_inds = zeros(numFrames,1);
for j = 1:numFrames
    [M,I] = max(gvidFrames1_1(:,:,j), [], 'all', 'linear');
    [row, col] = ind2sub([480,640],I);
    x_inds(j) = col;
    y_inds(j) = row;
end
%% plot position data
figure(2)
plot(1:numFrames,y_inds)
