function [x_inds,y_inds] = getPos1(vid,startx,endx,starty,endy)
% Get position data for videos with clear a clear flashlight image and
% cropping in both dimensions
numFrames = size(vid,4);
% Turn video to greyscale and crop
gvid = zeros(endy-starty+1,endx-startx+1,numFrames);
for j = 1:numFrames
    gvid(:,:,j) = rgb2gray(vid(starty:endy,startx:endx,:,j));
end
% Get position data
x_inds = zeros(numFrames,1);
y_inds = zeros(numFrames,1);
for j = 1:numFrames
    [~,I] = max(gvid(:,:,j), [], 'all', 'linear');
    [row, col] = ind2sub([endy-starty+1,endx-startx+1],I);
    x_inds(j) = col;
    y_inds(j) = row;
end
end

