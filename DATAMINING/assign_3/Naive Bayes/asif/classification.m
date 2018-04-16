
%%%% CLASSIFYING THE DATA INTO POSITIVE AND NAGATIVE CLASS %%%%%

%%%%%%% Input arguments = data(data)
%%%%%%% Output arguments = matrices classified into positive and negative
%%%%%%% classes 

function [ positive,negative ] = classification(data)

[m,n]=size(data);
p=1;q=1;

for i=1:m
if data(i,n)==1                         
    
    for j=1:n
        positive (p,j)=data(i,j);     %creating the positive class
    end
    p=p+1;
    
else

    for j=1:n
        negative (q,j)=data(i,j);     %creating the negative class
    end
    q=q+1;
    
end
end
end

