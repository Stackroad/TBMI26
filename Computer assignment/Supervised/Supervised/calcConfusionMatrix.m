function [ cM ] = calcConfusionMatrix( Lclass, Ltrue )
% Klarar bara två klasser
classes = unique(Ltrue);
numClasses = length(classes);
cM = zeros(numClasses);

% [cM,order] = confusionmat(Lclass,Ltrue);

for y = 1  : numClasses

    correctVector = (Ltrue == y); %Tar ut den sanna label-vectorn
    
    for x = 1 : numClasses
        firstTestClass = (Lclass == x); %Tar ut vectorn med predikerade labels
        
        compared = and(correctVector,firstTestClass); %Jämför vektorerna och ger en 1 där de är lika        
        input = sum(compared);
        
        cM(y,x) = input;

    end
end
end

%     wantedClass = (Ltrue==y)
% 
% 
%         estimatedClass = (Lclass==x)
%         
%     totalAmount = sum(sum(and(wantedClass,estimatedClass)))
%     cM(y,x) = totalAmount;
    
% for i = 1 : 1 : classes
%     
%     for n = 1: 1 : length(Lclass)
%         
%         if Lclass(n,1) == classes(i,1) && Lclass(n,1) == Ltrue(n,1)
%             cM(i,i) = cM(i,i) + 1;
%             
%         elseif Lclass(n,1) == classes(i,1) && Lclass(n,1) ~= Ltrue(n,1)
%             cM(i,i + 1) = cM(i,i + 1) + 1;
%         end
%     end
% end



% for i = 1: 1 : length(Lclass)
%
%     if Lclass(i,1) == classes(1,1) && Lclass(i,1) == Ltrue(i,1)
%         cM(1,1) = cM(1,1) + 1;
%
%     elseif Lclass(i,1) == classes(1,1) && Lclass(i,1) ~= Ltrue(i,1)
%         cM(1,2) = cM(1,2) + 1;
%
%     elseif Lclass(i,1) == classes(2,1) && Lclass(i,1) == Ltrue(i,1)
%         cM(2,2) = cM(2,2) + 1;
%     elseif Lclass(i,1) == classes(2,1) && Lclass(i,1) ~= Ltrue(i,1)
%         cM(2,1) = cM(2,1) + 1;
%
%     end
%
%
% end
