function [ weightsNormReturn ] = weightsUpdateFunc( weights, alpha, yTrainClassi, yTrain,polarity  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% 

 if (polarity == -1)
     yTrain = yTrain*(-1);
 else
      yTrain = yTrain*1;
 end
 
 weightsUpdated = zeros(length(yTrainClassi),1);

    for p=1:length(yTrainClassi)
        
        if (yTrainClassi(1,p) == yTrain(1,p) )
            weightsVal = weights(p,1)*exp(-alpha);
        else
            weightsVal = weights(p,1)*exp(alpha);
        end
        
        weightsUpdated(p,1) = weightsVal;

    end

weightsNormReturn = weightsUpdated./(sum(weightsUpdated));

end

