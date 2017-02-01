function [ acc ] = calcAccuracy( cM )
%CALCACCURACY Takes a confusion matrix amd calculates the accuracy

sizeMatrix = size(cM);
roof = 0;
for i = 1: 1 : sizeMatrix(1)
    roof = roof + cM(i,i);

end

acc = roof/(sum(sum(cM)));
end

