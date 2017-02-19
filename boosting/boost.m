% Load face and non-face data and plot a few examples
clear all
close all
load faces, load nonfaces

faces = double(faces); nonfaces = double(nonfaces);
figure(1)
colormap gray
for k=1:25
    subplot(5,5,k), imagesc(faces(:,:,10*k)), axis image, axis off
end
figure(2)
colormap gray
for k=1:25
    subplot(5,5,k), imagesc(nonfaces(:,:,10*k)), axis image, axis off
end
% Generate Haar feature masks

nbrHaarFeatures = 30;
haarFeatureMasks = GenerateHaarFeatureMasks(nbrHaarFeatures);
figure(3)
colormap gray
for k = 1:25
    subplot(5,5,k),imagesc(haarFeatureMasks(:,:,k),[-1 2])
    axis image,axis off
end
% Create a training data set with a number of training data examples
% from each class. Non-faces = class label y=-1, faces = class label y=1


nbrTestExamples = 2000;
testImages = cat(3,faces(:,:,1:nbrTestExamples), ...
    nonfaces(:,:,1:nbrTestExamples));
xTest = ExtractHaarFeatures(testImages,haarFeatureMasks);
yTest = [ones(1,nbrTestExamples), -ones(1,nbrTestExamples)];

nbrTrainExamples = 200;
trainImages = cat(3,faces(:,:,1:nbrTrainExamples),...
    nonfaces(:,:,1:nbrTrainExamples));
xTrain = ExtractHaarFeatures(trainImages,haarFeatureMasks);
yTrain = [ones(1,nbrTrainExamples), -ones(1,nbrTrainExamples)];

numImages = size(xTrain,2);
%%
%initialization
weights=[];
for a=1:size(xTrain,2)
    weights = [weights; 1/numImages];
end

numberOfWeakClass = 100;
weakClassiAll = [];
yTrainClassiAll = [];
accVector = [];
accVectorTest = [];
for T =1 :numberOfWeakClass

[weakClassBest ] = thresholdFunction(xTrain, yTrain, weights, ...
    numImages, nbrHaarFeatures);
%labels with best threshhh... Haar, thresh, pol
yTrainClassi = yTrainClassRow(xTrain((weakClassBest(1,4)),:) ...
    ,weakClassBest(1,1),weakClassBest(1,3));

alpha = alphaCalc(weakClassBest(1,2));
weights = weightsUpdateFunc(weights, alpha, yTrainClassi, ...
    yTrain,weakClassBest(1,3) );
%weights
%Thres,,pol,haar, alpha,error
weakClassiInsert = [weakClassBest(1,1), weakClassBest(1,3), ...
    weakClassBest(1,4), alpha, weakClassBest(1,2),weakClassBest(1,5) ];

%Weak classifiers matrix
weakClassiAll = [weakClassiAll; weakClassiInsert];
[strongClass, wrongClassImn] = strongClassi( weakClassiAll, ...
    xTrain, yTrain, nbrTrainExamples );
accVector = [accVector strongClass];

end

%%
 weakClassiStrong = weakClassiAll(1:50,:)
[strongClass2, wrongClassImn2] = strongClassi( weakClassiStrong, ...
    xTest, yTest, nbrTestExamples*2 );

accVectorTest = strongClass2;

%% Final string classi
figure(55)
plot(accVector)
title('Strong classifier')
xlabel('# weak classifiers')
ylabel('Accuracy')


%%
figure(4)
colormap gray
for wf=1:4
    subplot(2,2,wf), imagesc(faces(:,:,wrongClassImn2(122+wf,1))), ...
        axis image, axis off
end

%% 
figure(5)
colormap gray
for wf=1:4 %modify depending on length of wrongclass...
    subplot(2,2,wf), imagesc(nonfaces(:,:,wrongClassImn2(370-wf,1)...
        -2000)), axis image, axis off
end

