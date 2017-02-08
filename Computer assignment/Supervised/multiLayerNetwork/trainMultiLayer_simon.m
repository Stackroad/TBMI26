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
    % Receive the output
    Ytraining = runMultiLayer(Xtraining, Wout, Vout);
% size(Vout')
% size(Xtraining)
% size(Vout'*Xtraining)
% size(Wout(:,2:end)')
size(Wout)
size(Ytraining - Dtraining)
size(Vout'*Xtraining)
size((Wout*(Ytraining - Dtraining)))


%Wout(:,2:end)' moddad i grad_v första parr
    % Bias added to the output layer
    H_bias = [ones(1,size(Vout'*Xtraining,2)) ; tanh(Vout'*Xtraining)];
    % Calculating the gradients
    grad_v = 2/numTraining * ((Wout(:,2:end)'*(Ytraining - Dtraining)).*tanhprim(Vout'*Xtraining)')*Xtraining'; %Calculate the gradient for the output layer
    grad_w = 2/numTraining * (Ytraining - Dtraining)*H_bias'; %..and for the hidden layer.


    Wout = Wout - learningRate * grad_w; %Take the learning step.
    Vout = Vout - learningRate * grad_v; %Take the learning step.

    % Receive the output with the new matrices (back-propagation)
    Ytraining = runMultiLayer(Xtraining, Wout, Vout);
    Ytest = runMultiLayer(Xtest, Wout, Vout);

    %Error
    trainingError(1+n) = sum(sum((Ytraining - Dtraining).^2))/(numTraining*numClasses);
    testError(1+n) = sum(sum((Ytest - Dtest).^2))/(numTest*numClasses);
end

end

