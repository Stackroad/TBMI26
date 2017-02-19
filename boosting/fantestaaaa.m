
ytrain = [1 1 1 -1 -1 -1];

Xtrain = [15 14 -5 -11 -13 5;
          -1 -2 -5 -11 -13 5];
weight = 1/6;
% tempT = Xtrain(6);
error = 0;
errorMatrix = zeros(2,6);
polar = 0;
polarMatrix = zeros(2,6);
numImages = length(Xtrain);
for rows = 1:2
    for cols = 1:numImages
        tempT = Xtrain(rows,cols);
        for col = 1:numImages
            if(tempT > Xtrain(rows,col))
%                              disp('mindre än temp')
                if(1 == ytrain(col))
                    %                 disp('mindre än temp och fel')
                    error = error +weight;
                end
            elseif(tempT <= Xtrain(rows,col))
                %             disp('större än temp')
                if(-1 == ytrain(col))
                    %                 disp('större än temp och fel')
                    error = error +weight;
                end
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
        polarMatrix(rows,cols) = polar;
    end
     errorMatrix;
%     error = 0;
end
% for rows = 1:nbrHaarFeatures
%     for cols = 1:numImages
%         tempThresh = xTrain(rows,cols);
%         for colsLoop= 1:numImages
%             if (tempThresh > xTrain(rows,colsLoop))
%                 if (1 == yTrain(colsLoop))
%                     error = error + weights(colsLoop,1);
%                 end
%             elseif (tempThresh <= xTrain(rows,colsLoop))
%                 if (-1 == yTrain(colsLoop))
%                     error = error + weights(colsLoop,1);
%                 end   
%             end
%             
%         end
%         if (error > 0.5)
%             polar = -1;
%             error = 1-error;
%         else
%             polar = 1;
%         end
% 
%         errorMatrix(rows,cols) =  error;
%         error = 0;
%     end
%     [val, pos] = min(errorMatrix(rows,:));
%     weakClassMatrix(rows,1) = xTrain(rows,pos);
%     weakClassMatrix(rows,2) = val;
%     weakClassMatrix(rows,3) = polar;
% end
% 
% 
% [minError, position]= min(weakClassMatrix(:,2));
% 
% weakClassBest = weakClassMatrix(position,:);
% minError
% % end