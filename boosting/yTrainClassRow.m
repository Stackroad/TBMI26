function [ outputVecReturn ] = yTrainClassRow( xTrainVec, threshold, polarity )
%UNTITLED Summary of this function goes here
%   C
outputVec = [];

numImages = length(xTrainVec);
% polarity
% if (polarity == 1)
    for colsLoop= 1:numImages
        if (threshold > xTrainVec(1,colsLoop))
            outputVec(1,colsLoop)= (-1);
            
            
        else (threshold <= xTrainVec(1,colsLoop))
            outputVec(1,colsLoop)= 1;
            
        end
        
    end
% else
%     for colsLoop= 1:numImages
%         if (threshold < xTrainVec(1,colsLoop))
%             outputVec(1,colsLoop)= (-6);
%           
%             
%         else (threshold >= xTrainVec(1,colsLoop))
%             outputVec(1,colsLoop)= 9;
%           
%         end
%         
%     end
%     
% end


outputVecReturn = outputVec;

end

