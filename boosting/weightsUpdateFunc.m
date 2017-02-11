function [ weightsNormReturn ] = weightsUpdateFunc( weights, alpha, yTrainClassi, yTrain,polarity  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% if (polarity == -1)
%     yTrainClassi = yTrainClassi*(-1);
% end

%  Update Weights

 weightsUpdated = zeros(length(yTrainClassi),1);
% zeros(nbrHaarFeatures,numImages);
    for p=1:length(yTrainClassi)
        
        if (yTrainClassi(1,p) == yTrain(1,p) )
            weightsVal = weights(p,1)*exp((-1)*alpha);
        else
            weightsVal = weights(p,1)*exp((1)*alpha);
        end
        
        weightsUpdated(p,1) = weightsVal;
%         weightsVal = 0;
    end


weightsNormReturn = weightsUpdated./(sum(weightsUpdated));



end

