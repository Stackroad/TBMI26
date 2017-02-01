function [ labelsOut ] = kNN(X, k, Xt, Lt)
%KNN Your implementation of the kNN algorithm
%   Inputs:
%               X  - Features to be classified
%               k  - Number of neighbors
%               Xt - Training features
%               LT - Correct labels of each feature vector [1 2 ...]'
%
%   Output:
%               LabelsOut = Vector with the classified labels
% LkNN = kNN(Xt{2}, k, Xt{1}, Lt{1});

labelsOut1 = [];
labelsOut = [];
distance = [];
distanceXY = [];
kVotes = [];

for i = 1: 1: size(X,2)%length(X) 
    for j = 1: 1: size(Xt,2);
        distanceXY =  abs(X(:,i) - Xt(:,j));
        distance  = [distance sqrt(distanceXY(1,1)^2 + distanceXY(2,1)^2)];
    end
    
 %F�r flera k   
% for p = 1: 1: k    
%     [M, Index] = min(distance);
%     kVotes = [kVotes Lt(Index,1)];     
% end




    distance = [];
    
    Funkar f�r k=1
    [M, Index] = min(distance)
    labelsOut1 = [labelsOut1 Lt(Index,1)]; 
    distance = [];
end

  labelsOut =  labelsOut1';

% 
% labelsOut  = zeros(size(X,2),1)
% classes = unique(Lt);
% numClasses = length(classes);


end

