function [ bestK ] = kCrossVali( X, k, Xt, Lt,Lt2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

acc = [];

for i=1:k
LkNN = kNN( X, i, Xt, Lt);

cM = calcConfusionMatrix( LkNN, Lt2);

% The accuracy
acc = [acc calcAccuracy(cM)];
end

[m,bestK] = max(acc)

end

