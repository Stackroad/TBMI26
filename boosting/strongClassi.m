function [ acc,wrongClassi ] = strongClassi( weakClassiAll, xTest, yTest, numTest )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
numberOfWeakClass = size(weakClassiAll,1);
correctClassified = 0;
wrongClassified = [];
wrongClassifiedUltimateMatrix = [];

for p = 1:numTest
    resultOneTest = 0;
    for i = 1 : numberOfWeakClass
        thresh = weakClassiAll(i,1);
        polarity = weakClassiAll(i,2);
        haar = weakClassiAll(i,3);
        alph = weakClassiAll(i,4);
        
        %Test feature
        valueByHaar = xTest(haar,p);
        
        if valueByHaar*polarity > thresh*polarity
            resultOneTest = resultOneTest + alph;
        else
            resultOneTest = resultOneTest - alph;
        end
    end
    
    resultOneTest = sign(resultOneTest);
    
    if (resultOneTest == yTest(1,p))
        correctClassified = correctClassified + 1;
    else
        wrongClassified(1,1) = p;
        wrongClassified(1,2) = resultOneTest;
        wrongClassified(1,3) = yTest(1,p);
        
        wrongClassifiedUltimateMatrix = [wrongClassifiedUltimateMatrix; wrongClassified];
    end  
end
acc = correctClassified / numTest;
wrongClassi = wrongClassifiedUltimateMatrix;
end



