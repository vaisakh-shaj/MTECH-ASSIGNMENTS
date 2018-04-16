
%%%%%%% FINDING THE CONDITIONAL PROBABILITIES FOR CLASSES %%%%%%%%%

%%%%%%% Input arguments = classified data sets into different classes and
%%%%%%% no of discrete output levels 
%%%%%%% Output arguments = probability matrix of different attributes

function [ prob ] = cond_prob( data,c_no )

[m,n]=size(data);
sum=zeros(1,c_no);
prob=zeros(n-1,c_no);

for j=1:n-1
    
    for i=1:m               %loop for finding number of occurences of individual attribute members

        if data(i,j)==0
            sum(1,1)=sum(1,1)+1;
        elseif data(i,j)==1
            sum(1,2)=sum(1,2)+1;
        elseif data(i,j)==2
            sum(1,3)=sum(1,3)+1;
        elseif data(i,j)==3
            sum(1,4)=sum(1,4)+1;
        else data(i,j)==4;
            sum(1,5)=sum(1,5)+1;
        end   
    end
    for l=1:c_no
    prob(j,l)=sum(1,l)/m;   %probability corresponding to individual attribute members
    end
    sum=zeros(1,5);
end
end

