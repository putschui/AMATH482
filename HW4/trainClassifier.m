% Train and test classifier for test 1
% Load case 1 traning data
close all; clear; clc;
load('trainingData1.mat')
%Train Classifier
nfeatures = 20;
[U,S,V,thresh1,thresh2,w,I] = trainer(test1specs1,test1specs2,test1specs3,nfeatures);

%Test classifier
load('testingData1.mat')
TestMat = U'*[test1testspecs1 test1testspecs2 test1testspecs3];
pval = w'*TestMat;
% 1 = Visager (electronic), 2 = Dee Yan-Kee (Jazz), 3 = 32 And Beyond
% (Psych-Rock)

ResVec = (pval<thresh1)*I(3) + (pval>thresh2)*I(1);
ResVec(ResVec == 0) = I(2);

errNum = sum(abs(ResVec-test1Ans))
sucRate = 1-errNum/300

%% Train and test classifier for test 2
% Load case 2 traning data
close all; clear; clc;
load('trainingData2.mat')
%Train Classifier
nfeatures = 20;
[U,S,V,thresh1,thresh2,w,I] = trainer(test2specs1,test2specs2,test2specs3,nfeatures);

%Test classifier
load('testingData2.mat')
TestMat = U'*[test2testspecs1 test2testspecs2 test2testspecs3];
pval = w'*TestMat;
% 1 = Third Mind Movement, 2 = The Agrarians, 3 = 23 and Beyond

ResVec = (pval<thresh1)*I(3) + (pval>thresh2)*I(1);
ResVec(ResVec == 0) = I(2);

errNum = sum(abs(ResVec-test2Ans))
sucRate = 1-errNum/300

%% Train and test classifier for test 3
% Load case 3 traning data
close all; clear; clc;
load('trainingData3.mat')
%Train Classifier
nfeatures = 20;
[U,S,V,thresh1,thresh2,w,I] = trainer(test3specs1,test3specs2,test3specs3,nfeatures);

%Test classifier
load('testingData3.mat')
TestMat = U'*[test3testspecs1 test3testspecs2 test3testspecs3];
pval = w'*TestMat;
% 1 = Halloween, 2 = Christmas, 3 = Birthday

ResVec = (pval<thresh1)*I(3) + (pval>thresh2)*I(1);
ResVec(ResVec == 0) = I(2);

errNum = sum(abs(ResVec-test3Ans))
sucRate = 1-errNum/300
