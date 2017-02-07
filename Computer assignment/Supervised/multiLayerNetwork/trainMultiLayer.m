function [Wout,Vout, trainingError, testError ] = trainMultiLayer(Xtraining,Dtraining,Xtest,Dtest, W0, V0,numIterations, learningRate )
%TRAINMULTILAYER Trains the network (Learning)
%   Inputs:
%               X* - Trainin/test features (matrix)
%               D* - Training/test desired output of net (matrix)
%               V0 - Weights of the output neurons (matrix)
%               W0 - Weights of the output neurons (matrix)
%               numIterations - Number of learning setps (scalar)
%               learningRate - The learningrate (scalar)
%
%   Output:
%               Wout - Weights after training (matrix)
%               Vout - Weights after training (matrix)
%               trainingError - The training error for each iteration
%                               (vector)
%               testError - The test error for each iteration
%                               (vector)

% Initiate variables
trainingError = nan(numIterations+1,1);
testError = nan(numIterations+1,1);
numTraining = size(Xtraining,2);
numTest = size(Xtest,2);
numClasses = size(Dtraining,1) - 1;
Wout = W0;
Vout = V0;

% Calculate initial error
Ytraining = runMultiLayer(Xtraining, W0, V0);
Ytest = runMultiLayer(Xtest, W0, V0);
trainingError(1) = sum(sum((Ytraining - Dtraining).^2))/(numTraining*numClasses);
testError(1) = sum(sum((Ytest - Dtest).^2))/(numTest*numClasses);

for n = 1:numIterations
    Ytraining = runMultiLayer(Xtraining, Wout, Vout);
    S = Vout'*Xtraining;
    H = tanhprim(S);
    H = [ones(1,length(H)) ; H];

%      size(Ytraining -Dtraining)
%      size(W0')
%     size(H)
 
    grad_v = 2/numTraining * ((W0*(Ytraining-Dtraining)).*H)*Xtraining'; %Calculate the gradient for the output layer
  grad_v = grad_v(2:end,:);% vafan g�r man h�r? tar bort 1orna s� att
%  dimsensionerna st�mmer till Vout.....
    grad_w = 2/numTraining * (Ytraining-Dtraining)*H'; %..and for the hidden layer.

% size(Wout-learningRate)
% size(grad_w)
% size(Vout - learningRate)
% size(grad_v)

    Wout = Wout - learningRate * grad_w'; %Take the learning step.
    Vout = Vout - learningRate * grad_v'; %Take the learning step.

    Ytraining = runMultiLayer(Xtraining, Wout, Vout);
    Ytest = runMultiLayer(Xtest, Wout, Vout);

    trainingError(1+n) = sum(sum((Ytraining - Dtraining).^2))/(numTraining*numClasses);
    testError(1+n) = sum(sum((Ytest - Dtest).^2))/(numTest*numClasses);
end

end

