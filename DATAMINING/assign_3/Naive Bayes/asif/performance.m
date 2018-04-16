
%%%%%%%%% ASSESING THE PERFORMANCE OF THE CLASSIFIER %%%%%%%%
%%%%%%% Input arguments = result matrix
%%%%%%% Output arguments = none

function [ ] = performance( data )
display(data);
confusion_matrix=zeros(2,2);
[m,n]=size(data);
P=0;N=0;
beta=2;

for i=1:m               % loop to find confusion mtrix elements
        if data(i,1)==1
            P=P+1;
        else
            N=N+1;
        end
        if data(i,1)==1 && data(i,1)==data(i,2)
        confusion_matrix(1,1)=confusion_matrix(1,1)+1;
        end
        if data(i,1)==1 && data(i,1)~=data(i,2)
        confusion_matrix(1,2)=confusion_matrix(1,2)+1;
        end
        
        if data(i,1)==0 && data(i,1)==data(i,2)
        confusion_matrix(2,2)=confusion_matrix(2,2)+1;
        end
        if data(i,1)==0 && data(i,1)~=data(i,2)
        confusion_matrix(2,1)=confusion_matrix(2,1)+1;
        end
end

TP=confusion_matrix(1,1);
FN=confusion_matrix(1,2); 
FP=confusion_matrix(2,1);
TN=confusion_matrix(2,2); 

display(TP);
display(FN);
display(FP);
display(TN);

accuracy = (TP+TN)/(P+N);
error_rate= (FP+FN)/(P+N);
tpr = TP/P;
tnr = TN/N;
precision = TP/(TP+FP);
f_score = (2*precision*tpr)/(precision+tpr);
f_beta = (precision*tpr)/(precision+tpr)*(1+(beta^2))/(beta^2);


display(accuracy);
display(error_rate);
display(tpr);
display(tnr);
display(precision);
display(f_score);
display(f_beta);
            
end

