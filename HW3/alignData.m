clear; clc; close all;
load('posData.mat')

%%
% Plot first case
figure(1)
plot(ypos_1_1)
figure(2)
plot(ypos_2_1)
figure(3)
plot(ypos_3_1)
%%
close all;
% Align data
xpos_1_1(1:3) = [];
ypos_1_1(1:3) = [];
xpos_2_1(1:51) = [];
ypos_2_1(1:51) = [];
%xpos_3_1(1:10) = [];
%ypos_3_1(1:10) = [];

sizes = [length(xpos_1_1),length(xpos_2_1),length(xpos_3_1)];
minSize = min(sizes);
xpos_1_1(minSize+1:end) = [];
ypos_1_1(minSize+1:end) = [];
xpos_2_1(minSize+1:end) = [];
ypos_2_1(minSize+1:end) = [];
xpos_3_1(minSize+1:end) = [];
ypos_3_1(minSize+1:end) = [];

% xpos_1_1 = xpos_1_1 - mean(xpos_1_1);
% ypos_1_1 = ypos_1_1 - mean(ypos_1_1);
% ypos_2_1 = ypos_2_1 - mean(ypos_2_1);
% ypos_3_1 = ypos_3_1 - mean(ypos_3_1);

figure(1)
plot(ypos_1_1)
hold on
plot(ypos_2_1)
plot(ypos_3_1)
legend('cam 1', 'cam 2', 'cam3')
%%
close all;
% Plot second case
figure(1)
plot(ypos_1_2)
figure(2)
plot(ypos_2_2)
figure(3)
plot(ypos_3_2)

%%
close all;
% Align data
xpos_1_2(1:16) = [];
ypos_1_2(1:16) = [];
xpos_2_2(1:1) = [];
ypos_2_2(1:1) = [];
xpos_3_2(1:20) = [];
ypos_3_2(1:20) = [];

figure(1)
plot(ypos_1_2)
hold on
plot(ypos_2_2)
plot(ypos_3_2)

sizes = [length(xpos_1_2),length(xpos_2_2),length(xpos_3_2)];
minSize = min(sizes);
xpos_1_2(minSize+1:end) = [];
ypos_1_2(minSize+1:end) = [];
xpos_2_2(minSize+1:end) = [];
ypos_2_2(minSize+1:end) = [];
xpos_3_2(minSize+1:end) = [];
ypos_3_2(minSize+1:end) = [];
%%
%close all;
% Plot third case
figure(1)
plot(ypos_1_3)
hold on
plot(ypos_2_3)

plot(ypos_3_3)
legend('cam 1', 'cam 2', 'cam3')
%%
close all;
% Align data
xpos_1_3(1:13) = [];
ypos_1_3(1:13) = [];
xpos_2_3(1:39) = [];
ypos_2_3(1:39) = [];
xpos_3_3(1:7) = [];
ypos_3_3(1:7) = [];

figure(1)
plot(ypos_1_3)
hold on
plot(ypos_2_3)

plot(ypos_3_3)
legend('cam 1', 'cam 2', 'cam3')


sizes = [length(xpos_1_3),length(xpos_2_3),length(xpos_3_3)];
minSize = min(sizes);
xpos_1_3(minSize+1:end) = [];
ypos_1_3(minSize+1:end) = [];
xpos_2_3(minSize+1:end) = [];
ypos_2_3(minSize+1:end) = [];
xpos_3_3(minSize+1:end) = [];
ypos_3_3(minSize+1:end) = [];
%%
close all;
% Plot fourth case
figure(1)
plot(ypos_1_4)
hold on
plot(ypos_2_4)
plot(ypos_3_4)
legend('cam 1', 'cam 2', 'cam3')
%%
% Align data
%xpos_1_4(1:9) = [];
%ypos_1_4(1:9) = [];
xpos_2_4(1:9) = [];
ypos_2_4(1:9) = [];
%xpos_3_4(1) = [];
%ypos_3_4(1) = [];

figure(2)
plot(ypos_1_4)
hold on
plot(ypos_2_4)
plot(ypos_3_4)
legend('cam 1', 'cam 2', 'cam3')


sizes = [length(xpos_1_4),length(xpos_2_4),length(xpos_3_4)];
minSize = min(sizes);
xpos_1_4(minSize+1:end) = [];
ypos_1_4(minSize+1:end) = [];
xpos_2_4(minSize+1:end) = [];
ypos_2_4(minSize+1:end) = [];
xpos_3_4(minSize+1:end) = [];
ypos_3_4(minSize+1:end) = [];

%%
close all

snapShot1 = [xpos_1_1';ypos_1_1';xpos_2_1';ypos_2_1';xpos_3_1';ypos_3_1'];
snapShot2 = [xpos_1_2';ypos_1_2';xpos_2_2';ypos_2_2';xpos_3_2';ypos_3_2'];
snapShot3 = [xpos_1_3';ypos_1_3';xpos_2_3';ypos_2_3';xpos_3_3';ypos_3_3'];
snapShot4 = [xpos_1_4';ypos_1_4';xpos_2_4';ypos_2_4';xpos_3_4';ypos_3_4'];

mean1 = mean(snapShot1,2);
snapShot1 = snapShot1-mean1;

mean2 = mean(snapShot2,2);
snapShot2 = snapShot2-mean2;

mean3 = mean(snapShot3,2);
snapShot3 = snapShot3-mean3;

mean4 = mean(snapShot4,2);
snapShot4 = snapShot4-mean4;

figure(1)
plot(snapShot2(2,:))
hold on
plot(snapShot2(4,:))
plot(snapShot2(6,:))
legend('cam 1', 'cam 2', 'cam3')
save('snapShots.mat', '-regexp', '^snapShot')