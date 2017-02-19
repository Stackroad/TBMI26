function [ alphaReturn ] = alphaCalc( error )
%UNTITLED2 Summary of this function goes here   
    alpha = (0.5)*log((1-error)/error);

alphaReturn = alpha;
end

