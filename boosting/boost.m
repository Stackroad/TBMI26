% Load face and non-face data and plot a few examples
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


% xTrain A feature matrix of size [nbrHaarFeatures,nbrOfImages] in which
%        column k contains the result obtained when applying each Haar feature
%        filter to image k.
nbrTrainExamples = 100;
trainImages = cat(3,faces(:,:,1:nbrTrainExamples),nonfaces(:,:,1:nbrTrainExamples));
xTrain = ExtractHaarFeatures(trainImages,haarFeatureMasks);
yTrain = [ones(1,nbrTrainExamples), -ones(1,nbrTrainExamples)];

nbrTrainExamples = 1000;
testImages = cat(3,faces(:,:,1:nbrTrainExamples),nonfaces(:,:,1:nbrTrainExamples));
xTest = ExtractHaarFeatures(testImages,haarFeatureMasks);
yTest = [ones(1,nbrTrainExamples), -ones(1,nbrTrainExamples)];



numImages = size(xTrain,2);
%initialization
weights=[];
for a=1:size(xTrain,2)
    weights = [weights; 1/numImages];
end


numberOfWeakClass = 30;
weakClassiAll = [];
yTrainClassiAll = [];

for T =1 :numberOfWeakClass
    
[weakClassBest ] = thresholdFunction(xTrain, yTrain, weights, numImages, nbrHaarFeatures);
%labels with best threshhh
weakClassBest(1,3)
yTrainClassi = yTrainClassRow(xTrain((weakClassBest(1,4)),:),weakClassBest(1,1),weakClassBest(1,3));
yTrainClassiAll =[yTrainClassiAll; yTrainClassi];


alpha = alphaCalc(weakClassBest(1,2));

%update weights
weights = weightsUpdateFunc(weights, alpha, yTrainClassi, yTrain,weakClassBest(1,3) );
% weights
weakClassiInsert = [weakClassBest(1,1), weakClassBest(1,3),weakClassBest(1,4), alpha ];


%Weak classifiers matrix
weakClassiAll = [weakClassiAll; weakClassiInsert];
% weakClassiInsert = [];
% yTrainClassi = [];

end

%% Final string classi

acc = strongClassi( weakClassiAll, xTest, yTest, nbrTrainExamples );







