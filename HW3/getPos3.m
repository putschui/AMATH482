%function [diff] = getPos3(vid,startx,endx,starty,endy)
function [x_inds,y_inds] = getPos3(thresh,vid,startx,endx,starty,endy)
% Get position data for videos using averaging
numFrames = size(vid,4);
% Turn video to greyscale and crop
% Get average frame
avgFrame = zeros(endy-starty+1,endx-startx+1);
gvid = zeros(endy-starty+1,endx-startx+1,numFrames);
for j = 1:numFrames
    gvid(:,:,j) = rgb2gray(vid(starty:endy,startx:endx,:,j));
    avgFrame = avgFrame + im2double(gvid(:,:,j));
end
avgFrame = avgFrame/numFrames;

diff = zeros(size(gvid));

for j = 1:numFrames
    frame1 = gvid(:,:,j);
    diff(:,:,j) = frame1-avgFrame;
end
diff(diff<0) = 0;

% Get position data
x_inds = zeros(numFrames,1);
y_inds = zeros(numFrames,1);
for j = 1:numFrames
    [Y,X] = find(diff(:,:,j)>thresh);
    x_inds(j) = mean(X);
    y_inds(j) = mean(Y);
end
end

