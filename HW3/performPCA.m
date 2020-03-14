clear; clc; close all;
load('snapShots.mat')

% Perform SVD on each snapshot matrix
[U1,S1,V1] = svd(snapShot1, 'econ');
[U2,S2,V2] = svd(snapShot2, 'econ');
[U3,S3,V3] = svd(snapShot3, 'econ');
[U4,S4,V4] = svd(snapShot4, 'econ');

% Plot singular values of each matrix
figure(1)
plot(diag(S1),'.-', 'linewidth', 2, 'markersize', 20); hold on
plot(diag(S2),'.-', 'linewidth', 2, 'markersize', 20)
plot(diag(S3),'.-', 'linewidth', 2, 'markersize', 20)
plot(diag(S4),'.-', 'linewidth', 2, 'markersize', 20)
title('Singular Values for Each Case', 'fontsize', 15)
legend('Case 1', 'Case 2', 'Case 3', 'Case 4')

% Compute low rank approximations for each matrix
n = 1;
rankn_1 = U1(:,1:n)*S1(1:n,1:n)*V1(:,1:n)';
rankn_2 = U2(:,1:n)*S2(1:n,1:n)*V2(:,1:n)';
rankn_3 = U3(:,1:n)*S3(1:n,1:n)*V3(:,1:n)';
rankn_4 = U4(:,1:n)*S4(1:n,1:n)*V4(:,1:n)';

% Plot low rank approximations of positions
figure(2)
subplot(2,2,1)
plot(rankn_1(1,:), 'linewidth', 2); hold on
plot(rankn_1(3,:), 'linewidth', 2)
plot(rankn_1(5,:), 'linewidth', 2)
title('Case 1')

subplot(2,2,2)
plot(rankn_2(1,:), 'linewidth', 2); hold on
plot(rankn_2(3,:), 'linewidth', 2)
plot(rankn_2(5,:), 'linewidth', 2)
title('Case 2')

subplot(2,2,3)
plot(rankn_3(1,:), 'linewidth', 2); hold on
plot(rankn_3(3,:), 'linewidth', 2)
plot(rankn_3(5,:), 'linewidth', 2)
title('Case 3')

subplot(2,2,4)
plot(rankn_4(1,:), 'linewidth', 2); hold on
plot(rankn_4(3,:), 'linewidth', 2)
plot(rankn_4(5,:), 'linewidth', 2)
title('Case 4')

sgtitle('Low Rank Approximations of X positions', 'fontsize', 15)
legend({'Cam 1','Cam 2','Cam 3'}, 'fontsize', 10)

figure(3)
subplot(2,2,1)
plot(rankn_1(2,:), 'linewidth', 2); hold on
plot(rankn_1(4,:), 'linewidth', 2)
plot(rankn_1(6,:), 'linewidth', 2)
title('Case 1')

subplot(2,2,2)
plot(rankn_2(2,:), 'linewidth', 2); hold on
plot(rankn_2(4,:), 'linewidth', 2)
plot(rankn_2(6,:), 'linewidth', 2)
title('Case 2')

subplot(2,2,3)
plot(rankn_3(2,:), 'linewidth', 2); hold on
plot(rankn_3(4,:), 'linewidth', 2)
plot(rankn_3(6,:), 'linewidth', 2)
title('Case 3')

subplot(2,2,4)
plot(rankn_4(2,:), 'linewidth', 2); hold on
plot(rankn_4(4,:), 'linewidth', 2)
plot(rankn_4(6,:), 'linewidth', 2)
title('Case 4')

sgtitle('Low Rank Approximations of Y positions', 'fontsize', 15)
legend({'Cam 1','Cam 2','Cam 3'}, 'fontsize', 10)

%%
% Plot original positions
figure(1)
subplot(2,2,1)
plot(snapShot1(1,:), 'linewidth', 2); hold on
plot(snapShot1(3,:), 'linewidth', 2)
plot(snapShot1(5,:), 'linewidth', 2)
title('Case 1')

subplot(2,2,2)
plot(snapShot2(1,:), 'linewidth', 2); hold on
plot(snapShot2(3,:), 'linewidth', 2)
plot(snapShot2(5,:), 'linewidth', 2)
title('Case 2')

subplot(2,2,3)
plot(snapShot3(1,:), 'linewidth', 2); hold on
plot(snapShot3(3,:), 'linewidth', 2)
plot(snapShot3(5,:), 'linewidth', 2)
title('Case 3')

subplot(2,2,4)
plot(snapShot4(1,:), 'linewidth', 2); hold on
plot(snapShot4(3,:), 'linewidth', 2)
plot(snapShot4(5,:), 'linewidth', 2)
title('Case 4')

sgtitle('Actual X positions', 'fontsize', 15)
legend({'Cam 1','Cam 2','Cam 3'}, 'fontsize', 10)

figure(2)
subplot(2,2,1)
plot(snapShot1(2,:), 'linewidth', 2); hold on
plot(snapShot1(4,:), 'linewidth', 2)
plot(snapShot1(6,:), 'linewidth', 2)
title('Case 1')

subplot(2,2,2)
plot(snapShot2(2,:), 'linewidth', 2); hold on
plot(snapShot2(4,:), 'linewidth', 2)
plot(snapShot2(6,:), 'linewidth', 2)
title('Case 2')

subplot(2,2,3)
plot(snapShot3(2,:), 'linewidth', 2); hold on
plot(snapShot3(4,:), 'linewidth', 2)
plot(snapShot3(6,:), 'linewidth', 2)
title('Case 3')

subplot(2,2,4)
plot(snapShot4(2,:), 'linewidth', 2); hold on
plot(snapShot4(4,:), 'linewidth', 2)
plot(snapShot4(6,:), 'linewidth', 2)
title('Case 4')

sgtitle('Actual Y positions', 'fontsize', 15)
legend({'Cam 1','Cam 2','Cam 3'}, 'fontsize', 10)

%%
% Plot right singular vectors
subplot(2,2,1)
plot(V1(:,1:n), 'linewidth', 2)
title('Case 1')

subplot(2,2,2)
plot(V2(:,1:n), 'linewidth', 2)
title('Case 2')

subplot(2,2,3)
plot(V3(:,1:n), 'linewidth', 2)
title('Case 3')

subplot(2,2,4)
plot(V4(:,1:n), 'linewidth', 2)
title('Case 4')

sgtitle('Right Singular Vectors for Each Case', 'fontsize', 15)