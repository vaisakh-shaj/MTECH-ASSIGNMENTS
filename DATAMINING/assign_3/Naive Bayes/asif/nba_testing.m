
%%%%%%%%% NAIVE BAYES ANALYSIS TESTING %%%%%%%%%%%%%%%%%
%%%%%%% Input arguments = data matrix to be tested,probability
%%%%%%% matrix,corresponding class probability and no:of disrete levels
%%%%%%% Output arguments = calculated probability


function [ p ] = nba_testing( testdata,prob_matrix,prob,c_no)

[m,n]=size(testdata);
p=ones(m,1);
for i=1:m  %loop to find the product of the conditional probabilities corresponding to each data set
    for j=1:n-1
        for k=1:c_no  
            if (testdata(i,j)==(k-1) && j==1)
            p(i,1)=p(i,1)*prob_matrix(1,k);
            end
            if (testdata(i,j)==(k-1) && j==2)
            p(i,1)=p(i,1)*prob_matrix(2,k);
            end   
        end
    end 
     p(i,1)=p(i,1)*prob;
end
display(p);
end

