function [ outputVecReturn ] = yTrainClassRow( xTrainVec, threshold, polarity )
%UNTITLED Summary of this function goes here

numImages = length(xTrainVec);
outputVec = zeros(1,numImages);

    for colsLoop= 1:numImages
        if (threshold > xTrainVec(colsLoop))
            outputVec(colsLoop)= (-1);
        else  
          outputVec(colsLoop)= 1;
        end
    end
outputVecReturn = outputVec;

end

