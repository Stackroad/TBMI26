function [ acc ] = strongClassi( weakClassiAll, xTest, yTest, numTest )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
% strongClassi = zeros(1,numImages) ;
% nbrFeat = length(X);
numberOfWeakClass = size(weakClassiAll,1);
correctClassified = 0;


for p = 1:numTest
    
resultOneTest = 0;
for i = 1 : numberOfWeakClass
    thresh = weakClassiAll(i,1);
    polarity = weakClassiAll(i,2);
    haar = weakClassiAll(i,3);
    alph = weakClassiAll(i,4);
    
    %Test feature
    valueByHaar = xTest(haar,p);
    
    if valueByHaar*polarity < thresh*polarity
        resultOneTest = resultOneTest + alph;
    else
        resultOneTest = resultOneTest - alph;
    end
end

resultOneTest = sign(resultOneTest);

if (resultOneTest == yTest(1,p))
    correctClassified = correctClassified + 1;
end 



end
acc = correctClassified / numTest;

end



