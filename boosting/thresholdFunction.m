function [ weakClassBest ] = thresholdFunction(xTraina, yTraina, weightsa, numImagesa, nbrHaarFeaturesa)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
polar = 0;
errorCalc = 0;
errorMatrix = zeros(nbrHaarFeaturesa,numImagesa);
polarMatrix = zeros(nbrHaarFeaturesa,numImagesa);
weakClassMatrix = zeros(nbrHaarFeaturesa,4);
% weakClassMatrix = zeros(nbrHaarFeatures,5);
weakClassMatrix(:,4) = 1:nbrHaarFeaturesa;
% yTrainClassiMatrix = zeros(nbrHaarFeatures,numImages);
errorMatrix2 = zeros(nbrHaarFeaturesa,numImagesa);

for rows = 1:nbrHaarFeaturesa
    for cols = 1:numImagesa
        tempThresh = xTraina(rows,cols);
        
        for colsLoop= 1:numImagesa
            if (tempThresh > xTraina(rows,colsLoop))
                if (1 == yTraina(colsLoop))
                    errorCalc = errorCalc + weightsa(colsLoop,1);
                end
            elseif (tempThresh <= xTraina(rows,colsLoop))
                if (-1 == yTraina(colsLoop))
                    errorCalc = errorCalc + weightsa(colsLoop,1);
                end   
            end            
        end
        
         errorMatrix2(rows,cols) =  errorCalc;
        if (errorCalc > 0.5)
            polar = -1;
            errorCalc = 1-errorCalc;
        else
            polar = 1;
        end

        errorMatrix(rows,cols) =  errorCalc;
        polarMatrix(rows,cols) =  polar;
        
        errorCalc = 0;
    end
    [val, pos] = min(errorMatrix(rows,:));
    val2 = errorMatrix2(rows,pos);
    weakClassMatrix(rows,1) = xTraina(rows,pos);
    weakClassMatrix(rows,2) = val;
    weakClassMatrix(rows,3) = polarMatrix(rows,pos);
     weakClassMatrix(rows,5) = val2;
end

[minError, position]= min(weakClassMatrix(:,2));
weakClassBest = weakClassMatrix(position,:);

end

