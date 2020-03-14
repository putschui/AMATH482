clear; clc; close all;
% Camera 1 Case 1
load('cam1_1.mat')
% implay(vidFrames1_1)
[xpos_1_1,ypos_1_1] = getPos1(vidFrames1_1, 243,445);
numFrames = size(vidFrames1_1,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_1_1)
hold on
plot(frameNums,xpos_1_1)

% Remove points that are out of place
badFrames = [81, 88, 89, 90, 92, 93, 94, 95, 100, 101, 112, 113, 198, 199, 201, 202, 220, 221];

for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_1_1(badFrame) = [];
    ypos_1_1(badFrame) = [];
end

% Plot to check
figure(2)
plot(frameNums,ypos_1_1)
hold on
plot(frameNums,xpos_1_1)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_1_1, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_1_1, badFrames, 'pchip');

% Add interp points back in
xpos_1_1 = xpos_1_1';
ypos_1_1 = ypos_1_1';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_1_1 = [xpos_1_1(1:badFrame-1), xinterp(k), xpos_1_1(badFrame:end)];
    ypos_1_1 = [ypos_1_1(1:badFrame-1), yinterp(k), ypos_1_1(badFrame:end)];
end
frameNums = 1:numFrames;

% Plot to check
figure(3)
plot(frameNums,ypos_1_1)
hold on
plot(frameNums,xpos_1_1)
xpos_1_1 = xpos_1_1';
ypos_1_1 = ypos_1_1';
%% Camera 2 Case 1
close all
load('cam2_1.mat')
%implay(vidFrames2_1)
[xpos_2_1,ypos_2_1] = getPos1(vidFrames2_1, 240,360);
numFrames = size(vidFrames2_1,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_2_1)
hold on
plot(frameNums,xpos_2_1)

% Remove points that are out of place
badFrames = [5,6,7,8,40,41,42,118,119,120,121,122,135,136,137,138,139,140,141,142,145,146,158,159,160,161,162,181,182,183,184,200,201,203,211,212,213,223,225,239,240,242,243,245,247,259,260,261,263];

for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_2_1(badFrame) = [];
    ypos_2_1(badFrame) = [];
end
% Plot to check
figure(2)
plot(frameNums,ypos_2_1)
hold on
plot(frameNums,xpos_2_1)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_2_1, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_2_1, badFrames, 'pchip');

% Add interp points back in
xpos_2_1 = xpos_2_1';
ypos_2_1 = ypos_2_1';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_2_1 = [xpos_2_1(1:badFrame-1), xinterp(k), xpos_2_1(badFrame:end)];
    ypos_2_1 = [ypos_2_1(1:badFrame-1), yinterp(k), ypos_2_1(badFrame:end)];
end
xpos_2_1 = xpos_2_1';
ypos_2_1 = ypos_2_1';
frameNums = 1:numFrames;
% Plot to check
figure(3)
plot(frameNums,ypos_2_1)
hold on
plot(frameNums,xpos_2_1)
%% Camera 3 Case 1
close all
load('cam3_1.mat')
vidFrames3_1 = permute(vidFrames3_1,[2,1,3,4]);
%implay(vidFrames3_1)

[xpos_3_1,ypos_3_1] = getPos2(vidFrames3_1, 215,373,273,455);
numFrames = size(vidFrames3_1,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_3_1)
hold on
plot(frameNums,xpos_3_1)

% Remove points that are out of place
badFrames = [182,197,198,199,200,201,202,203,205,206,207,208,209,210,211];

% Cut out last area with bad data
numFrames = 220;
frameNums(numFrames+1:end) = [];
xpos_3_1(numFrames+1:end) = [];
ypos_3_1(numFrames+1:end) = [];

for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_3_1(badFrame) = [];
    ypos_3_1(badFrame) = [];
end
% Plot to check
figure(2)
plot(frameNums,ypos_3_1)
hold on
plot(frameNums,xpos_3_1)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_3_1, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_3_1, badFrames, 'pchip');

% Add interp points back in
xpos_3_1 = xpos_3_1';
ypos_3_1 = ypos_3_1';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_3_1 = [xpos_3_1(1:badFrame-1), xinterp(k), xpos_3_1(badFrame:end)];
    ypos_3_1 = [ypos_3_1(1:badFrame-1), yinterp(k), ypos_3_1(badFrame:end)];
end
frameNums = 1:numFrames;
xpos_3_1 = xpos_3_1';
ypos_3_1 = ypos_3_1';
% Plot to check
figure(3)
plot(frameNums,ypos_3_1)
hold on
plot(frameNums,xpos_3_1)

%% Camera 1 Case 2
close all
load('cam1_2.mat')
%implay(vidFrames1_2)
[xpos_1_2,ypos_1_2] = getPos2(vidFrames1_2, 243,445,212,387);
numFrames = size(vidFrames1_2,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_1_2)
hold on
plot(frameNums,xpos_1_2)

% Remove points that are out of place
badFrames = [11,28,29,40,41,45,50,51,52,63,93,94,120,121,122,123,139,146,152,153,159,160,166,167,283,291,312];

for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_1_2(badFrame) = [];
    ypos_1_2(badFrame) = [];
end

% Plot to check
figure(2)
plot(frameNums,ypos_1_2)
hold on
plot(frameNums,xpos_1_2)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_1_2, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_1_2, badFrames, 'pchip');

% Add interp points back in
xpos_1_2 = xpos_1_2';
ypos_1_2 = ypos_1_2';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_1_2 = [xpos_1_2(1:badFrame-1), xinterp(k), xpos_1_2(badFrame:end)];
    ypos_1_2 = [ypos_1_2(1:badFrame-1), yinterp(k), ypos_1_2(badFrame:end)];
end
frameNums = 1:numFrames;
xpos_1_2 = xpos_1_2';
ypos_1_2 = ypos_1_2';

% Plot to check
figure(3)
plot(frameNums,ypos_1_2)
hold on
plot(frameNums,xpos_1_2)

%% Camera 2 Case 2
close all
load('cam2_2.mat')
%implay(vidFrames2_2)
[xpos_2_2,ypos_2_2] = getPos1(vidFrames2_2, 182,457);
numFrames = size(vidFrames2_2,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_2_2)
hold on
plot(frameNums,xpos_2_2)

% Remove points that are out of place
badFrames = [5,7,28,37,69,67,68,70,71,72,73,74,78,79,126,132,133,134,145,150,151,155,156,161,162,163,182,189,192,194,198,215,237,240,247,248,252,269,284,290,294,305,317,319,324,325,331,334,336,338,348];

for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_2_2(badFrame) = [];
    ypos_2_2(badFrame) = [];
end

% Plot to check
figure(2)
plot(frameNums,ypos_2_2)
hold on
plot(frameNums,xpos_2_2)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_2_2, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_2_2, badFrames, 'pchip');

% Add interp points back in
xpos_2_2 = xpos_2_2';
ypos_2_2 = ypos_2_2';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_2_2 = [xpos_2_2(1:badFrame-1), xinterp(k), xpos_2_2(badFrame:end)];
    ypos_2_2 = [ypos_2_2(1:badFrame-1), yinterp(k), ypos_2_2(badFrame:end)];
end
frameNums = 1:numFrames;
xpos_2_2 = xpos_2_2';
ypos_2_2 = ypos_2_2';

% Plot to check
figure(3)
plot(frameNums,ypos_2_2)
hold on
plot(frameNums,xpos_2_2)
%% Camera 3 Case 2
close all
load('cam3_2.mat')
vidFrames3_2 = permute(vidFrames3_2,[2,1,3,4]);
%implay(vidFrames3_2)
[xpos_3_2,ypos_3_2] = getPos2(vidFrames3_2, 184,323,275,474);
numFrames = size(vidFrames3_2,4);
% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_3_2)
hold on
plot(frameNums,xpos_3_2)

% Remove points that are out of place
badFrames = [42,44,45,58,59,71,72,82,90,96,100,101,107,111,113,116,120,122,123,126,127,134,135,142,143,154,155,164,165,168,169,172,173,176,177,180,181,185,187,192,193,198,199,200,201,206,207,210,214,215,217,223,224,225,227,229,230,240,248,256,257,258,259,262,263,264,265,286,287,288,290,291,305,206];
badFrames = sort(badFrames);
for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_3_2(badFrame) = [];
    ypos_3_2(badFrame) = [];
end

% Plot to check
figure(2)
plot(frameNums,ypos_3_2)
hold on
plot(frameNums,xpos_3_2)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_3_2, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_3_2, badFrames, 'pchip');

% Add interp points back in
xpos_3_2 = xpos_3_2';
ypos_3_2 = ypos_3_2';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_3_2 = [xpos_3_2(1:badFrame-1), xinterp(k), xpos_3_2(badFrame:end)];
    ypos_3_2 = [ypos_3_2(1:badFrame-1), yinterp(k), ypos_3_2(badFrame:end)];
end
frameNums = 1:numFrames;
xpos_3_2 = xpos_3_2';
ypos_3_2 = ypos_3_2';

% Plot to check
figure(3)
plot(frameNums,ypos_3_2)
hold on
plot(frameNums,xpos_3_2)
%% Camera 1 Case 3
close all
load('cam1_3.mat')
implay(vidFrames1_3)
[xpos_1_3,ypos_1_3]  = getPos3(80,vidFrames1_3,238,404,223,421);
numFrames = size(vidFrames1_3,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_1_3)
hold on
plot(frameNums,xpos_1_3)

%% Camera 2 Case 3
close all
load('cam2_3.mat')
%implay(vidFrames2_3)

[xpos_2_3,ypos_2_3]  = getPos3(90,vidFrames2_3,190,472,160,412);
numFrames = size(vidFrames2_3,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_2_3)
hold on
plot(frameNums,xpos_2_3)

% Remove points that are out of place
badFrames = [2,3,4,5,41,42,43,49,163,164,199];
for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_2_3(badFrame) = [];
    ypos_2_3(badFrame) = [];
end

% Plot to check
figure(2)
plot(frameNums,ypos_2_3)
hold on
plot(frameNums,xpos_2_3)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_2_3, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_2_3, badFrames, 'pchip');

% Add interp points back in
xpos_2_3 = xpos_2_3';
ypos_2_3 = ypos_2_3';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_2_3 = [xpos_2_3(1:badFrame-1), xinterp(k), xpos_2_3(badFrame:end)];
    ypos_2_3 = [ypos_2_3(1:badFrame-1), yinterp(k), ypos_2_3(badFrame:end)];
end
frameNums = 1:numFrames;
xpos_2_3 = xpos_2_3';
ypos_2_3 = ypos_2_3';

% Plot to check
figure(3)
plot(frameNums,ypos_2_3)
hold on
plot(frameNums,xpos_2_3)
%% Camera 3 Case 3
close all
load('cam3_3.mat')
vidFrames3_3 = permute(vidFrames3_3,[2,1,3,4]);
%implay(vidFrames3_3)
[xpos_3_3,ypos_3_3]  = getPos3(80,vidFrames3_3,146,267,160,487);
%[xpos_3_3,ypos_3_3]  = getPos2(vidFrames3_3,146,267,160,487);
numFrames = size(vidFrames3_3,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_3_3)
hold on
plot(frameNums,xpos_3_3)

%% Camera 1 Case 4
close all
load('cam1_4.mat')
%implay(vidFrames1_4)
[xpos_1_4,ypos_1_4]  = getPos3(80,vidFrames1_4,284,496,208,421);
numFrames = size(vidFrames1_4,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_1_4)
hold on
plot(frameNums,xpos_1_4)

% Remove points that are out of place
badFrames = [8,111,112,113,114,115,190,191,192,193,194,236,237,238];

for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_1_4(badFrame) = [];
    ypos_1_4(badFrame) = [];
end

% Plot to check
figure(2)
plot(frameNums,ypos_1_4)
hold on
plot(frameNums,xpos_1_4)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_1_4, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_1_4, badFrames, 'pchip');

% Add interp points back in
xpos_1_4 = xpos_1_4';
ypos_1_4 = ypos_1_4';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_1_4 = [xpos_1_4(1:badFrame-1), xinterp(k), xpos_1_4(badFrame:end)];
    ypos_1_4 = [ypos_1_4(1:badFrame-1), yinterp(k), ypos_1_4(badFrame:end)];
end
frameNums = 1:numFrames;
xpos_1_4 = xpos_1_4';
ypos_1_4 = ypos_1_4';

% Plot to check
figure(3)
plot(frameNums,ypos_1_4)
hold on
plot(frameNums,xpos_1_4)

%% Camera 2 Case 4
close all
load('cam2_4.mat')
%implay(vidFrames2_4)
[xpos_2_4,ypos_2_4]  = getPos3(80,vidFrames2_4,153,443,86,371);
numFrames = size(vidFrames2_4,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_2_4)
hold on
plot(frameNums,xpos_2_4)

% Remove points that are out of place
badFrames = [34,43,44,59,88,138,193,198,397,398,399,400,401];
for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_2_4(badFrame) = [];
    ypos_2_4(badFrame) = [];
end

% Plot to check
figure(2)
plot(frameNums,ypos_2_4)
hold on
plot(frameNums,xpos_2_4)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_2_4, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_2_4, badFrames, 'pchip');

% Add interp points back in
xpos_2_4 = xpos_2_4';
ypos_2_4 = ypos_2_4';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_2_4 = [xpos_2_4(1:badFrame-1), xinterp(k), xpos_2_4(badFrame:end)];
    ypos_2_4 = [ypos_2_4(1:badFrame-1), yinterp(k), ypos_2_4(badFrame:end)];
end
frameNums = 1:numFrames;
xpos_2_4 = xpos_2_4';
ypos_2_4 = ypos_2_4';

% Plot to check
figure(3)
plot(frameNums,ypos_2_4)
hold on
plot(frameNums,xpos_2_4)
%% Camera 3 Case 4
close all
load('cam3_4.mat')
vidFrames3_4 = permute(vidFrames3_4,[2,1,3,4]);
%implay(vidFrames3_4)

[xpos_3_4,ypos_3_4]  = getPos3(65,vidFrames3_4,117,297,298,529);
numFrames = size(vidFrames3_4,4);

% Plot position data to look for incongruities
frameNums = 1:numFrames;
figure(1)
plot(frameNums,ypos_3_4)
hold on
plot(frameNums,xpos_3_4)

% Remove points that are out of place
badFrames = [38,39,103,104,105,160,163,165,167,201,202,231,232,233,280,302,346,347,348,349,390,391];
for k = length(badFrames):-1:1
    badFrame = badFrames(k);
    frameNums(badFrame) = [];
    xpos_3_4(badFrame) = [];
    ypos_3_4(badFrame) = [];
end

% Plot to check
figure(2)
plot(frameNums,ypos_3_4)
hold on
plot(frameNums,xpos_3_4)

% Use interpotation to get data for missing points
xinterp = interp1(frameNums, xpos_3_4, badFrames, 'pchip');
yinterp = interp1(frameNums, ypos_3_4, badFrames, 'pchip');

% Add interp points back in
xpos_3_4 = xpos_3_4';
ypos_3_4 = ypos_3_4';
for k = 1:length(badFrames)
    badFrame = badFrames(k);
    xpos_3_4 = [xpos_3_4(1:badFrame-1), xinterp(k), xpos_3_4(badFrame:end)];
    ypos_3_4 = [ypos_3_4(1:badFrame-1), yinterp(k), ypos_3_4(badFrame:end)];
end
frameNums = 1:numFrames;
xpos_3_4 = xpos_3_4';
ypos_3_4 = ypos_3_4';

% Plot to check
figure(3)
plot(frameNums,ypos_3_4)
hold on
plot(frameNums,xpos_3_4)
%% Save position data
close all
save('posData.mat', '-regexp', '^xpos','^ypos')