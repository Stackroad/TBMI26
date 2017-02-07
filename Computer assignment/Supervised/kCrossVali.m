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

[m,bestK] = max(acc);

kaxis = 1:15;
[val,index ] = max(acc);

figure(333)
stem(kaxis,acc')
axis([0 15 0 1.01])
title('Dataset 4')
xlabel('k')
ylabel('accuracy')
hold on
%text(kaxis(index), val, sprintf('Acc = %6.3f', val))
stem(kaxis(index), val, 'filled')
hold off;




end

