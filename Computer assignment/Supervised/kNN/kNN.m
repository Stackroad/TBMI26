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
distance = [];
kVotes = [];


for i = 1: 1: size(X,2)
    for j = 1: 1: size(Xt,2);
        distanceXY =  abs(X(:,i) - Xt(:,j));
        
         distance  = [distance norm(distanceXY)]; %norm calculates the distance of the vector

    end

    for p = 1: 1: k
        [M, Index] = min(distance);
        kVotes = [kVotes Lt(Index,1)];
        distance(Index) = [];
    end  

        [frequencyOcc,labelNumber]=hist(kVotes,unique(kVotes));
        [mostFreq, indexFreq] = max(frequencyOcc);
        frequencyOcc(indexFreq) = [];
        nextMostFreq = max(frequencyOcc);
       
        if mostFreq == nextMostFreq % om oavgjort, tar den kortaste "sträckan"
              labelsOut1 = [labelsOut1 nextMostFreq];
        else
            [labelNumber,F] = mode(kVotes);
            labelsOut1 = [labelsOut1 labelNumber];
        end
        
    kVotes = [];
    distance = [];
end

labelsOut =  labelsOut1';

end



