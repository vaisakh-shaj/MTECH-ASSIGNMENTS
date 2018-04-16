
%%%%% CREATING THE TRAINING DATA SET AND TESTING DATA SET FOR NAIVE BAYES ANALYSIS %%%%%%%%
%%%%%%% Input arguments = classified data set 
%%%%%%% Output arguments = training data set

function [ data_tr,data_tst ] = nba_training( data )
[m,n]=size(data);
j=1;k=1;
C = cvpartition(data(:,n-1),'Holdout',0.3);
holdoutdata = test(C);

for i=1:m     %loop to classify into training and testing data set
    if(holdoutdata(i,1)==0)
        data_tr(j,:)= data(i,:);
        j=j+1;
    else
        data_tst(k,:)= data(i,:);
        k=k+1;
    end
end

