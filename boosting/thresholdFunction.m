function [ weakClassBest ] = thresholdFunction(xTrain, yTrain, weights, numImages, nbrHaarFeatures)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

error = 0;
errorMatrix = zeros(nbrHaarFeatures,numImages);
weakClassMatrix = zeros(nbrHaarFeatures,4);
weakClassMatrix(:,4) = 1:nbrHaarFeatures;
% yTrainClassiMatrix = zeros(nbrHaarFeatures,numImages);

for rows = 1:nbrHaarFeatures
    for cols = 1:numImages
        tempThresh = xTrain(rows,cols);
        for colsLoop= 1:numImages
            if (tempThresh > xTrain(rows,colsLoop))
                if (1 == yTrain(1,colsLoop))
                    error = error + weights(colsLoop,1);
                end
            elseif (tempThresh <= xTrain(rows,colsLoop))
                if (-1 == yTrain(1,colsLoop))
                    error = error + weights(colsLoop,1);
                end
            else
                
            end
            
        end
        if (error > 0.5)
            polar = -1;
            error = 1-error;
        else
            polar = 1;
        end

        errorMatrix(rows,cols) =  error;
        error = 0;
    end
    [val, pos] = min(errorMatrix(rows,:));
    weakClassMatrix(rows,1) = xTrain(rows,pos);
    weakClassMatrix(rows,2) = val;
    weakClassMatrix(rows,3) = polar;
end


[minError, position]= min(weakClassMatrix(:,2));
weakClassBest = weakClassMatrix(position,:);

end

