% Get test 1 traning data
close all; clear; clc;
[trainClips1,Fs1] = getClips(loadTextFiles('visagertraining.txt'));
[trainClips2,Fs2] = getClips(loadTextFiles('dee_yan_keyTraining.txt'));
[trainClips3,Fs3] = getClips(loadTextFiles('32AndBeyondTraining.txt'));

test1specs1 = makeSpectrogram(trainClips1);
test1specs2 = makeSpectrogram(trainClips2);
test1specs3 = makeSpectrogram(trainClips3);

save('trainingData1.mat','-regexp','^test1')

%% Get test 1 testing data
close all; clear; clc;
[testClips1,Fs1] = getClips(loadTextFiles('visagerTesting.txt'));
[testClips2,Fs2] = getClips(loadTextFiles('dee_yan_keyTesting.txt'));
[testClips3,Fs3] = getClips(loadTextFiles('32AndBeyondTesting.txt'));

test1testspecs1 = makeSpectrogram(testClips1);
test1testspecs2 = makeSpectrogram(testClips2);
test1testspecs3 = makeSpectrogram(testClips3);
test1Ans = [ones(1,100) ones(1,100)*2 ones(1,100)*3];
save('testingData1.mat','-regexp','^test')
%% Get test 2 training data
close all; clear; clc;
[trainClips1,Fs1] = getClips(loadTextFiles('thirdMindMovementTraining.txt'));
[trainClips2,Fs2] = getClips(loadTextFiles('theAgrariansTraining.txt'));
[trainClips3,Fs3] = getClips(loadTextFiles('32AndBeyondTraining.txt'));

test2specs1 = makeSpectrogram(trainClips1);
test2specs2 = makeSpectrogram(trainClips2);
test2specs3 = makeSpectrogram(trainClips3);

save('trainingData2.mat','-regexp','^test2')
%% Get test 2 testing data
close all; clear; clc;
[testClips1,Fs1] = getClips(loadTextFiles('thirdMindMovementTesting.txt'));
[testClips2,Fs2] = getClips(loadTextFiles('theAgrariansTesting.txt'));
[testClips3,Fs3] = getClips(loadTextFiles('32AndBeyondTesting.txt'));

test2testspecs1 = makeSpectrogram(testClips1);
test2testspecs2 = makeSpectrogram(testClips2);
test2testspecs3 = makeSpectrogram(testClips3);
test2Ans = [ones(1,100) ones(1,100)*2 ones(1,100)*3];

save('testingData2.mat','-regexp','^test2')
%% Get test 3 training data
close all; clear; clc;
[trainClips1,Fs1] = getClips(loadTextFiles('halloweenTraining.txt'));
[trainClips2,Fs2] = getClips(loadTextFiles('christmasTraining.txt'));
[trainClips3,Fs3] = getClips(loadTextFiles('birthdayTraining.txt'));

test3specs1 = makeSpectrogram(trainClips1);
test3specs2 = makeSpectrogram(trainClips2);
test3specs3 = makeSpectrogram(trainClips3);
save('trainingData3.mat','-regexp','^test3')

%% Get test 3 testing data
close all; clear; clc;
[testClips1,Fs1] = getClips(loadTextFiles('halloweenTesting.txt'));
[testClips2,Fs2] = getClips(loadTextFiles('christmasTesting.txt'));
[testClips3,Fs3] = getClips(loadTextFiles('birthdayTesting.txt'));

test3testspecs1 = makeSpectrogram(testClips1);
test3testspecs2 = makeSpectrogram(testClips2);
test3testspecs3 = makeSpectrogram(testClips3);
test3Ans = [ones(1,100) ones(1,100)*2 ones(1,100)*3];
save('testingData3.mat','-regexp','^test')