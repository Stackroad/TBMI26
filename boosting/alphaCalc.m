function [ alphaReturn ] = alphaCalc( error )
%UNTITLED2 Summary of this function goes here
%   Calculates the alhpa
if error > 0.000005
    
    alpha = (1/2)*log((1-error)/error);
else
    alpha = 0.8;
end

alphaReturn = alpha;
end

