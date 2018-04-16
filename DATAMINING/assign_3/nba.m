%%%%%%    NAIVE BAYES ANALYSIS   %%%%%%%


%%%%%%%%%%%%%%% DATA UPLOAD AND INITIALISING VARIABLES AND VECTORS%%%%%%
%clc;
data = load ('Data1.csv');
n=size(data,2);

levels=5;    %no of discretising levels
%%%%%%%%%   DISCRETISING THE DATA SET %%%%%%%%%


data=discretize(data,levels);   
display(data);
X = data(:, 1:n-1);
y = data(:, n);
m = length(y);
set=cvpartition(m,'holdout',.2);
Xtrain=X(training(set),:);
Ytrain=y(training(set));
data1=[Xtrain Ytrain];
%%%%%%   CLASSIFYING INTO POSITIVE AND NEGATIVE CLASS %%%%%%%

[datapos,dataneg]=split(data1,n);
 
%%%%%%% FINDING THE CONDITIONAL PROBABILITIES FOR POSITIVE & NEGATIVE CLASS AND THEIR TOTAL PROBABILITY %%%%%%%%%

[p,q,cp] = estimateNba(datapos,dataneg,n,levels);
%%%%%%%     LAPLACE SMOOTHING       %%%%%%%%%


%%%%%%%%% TESTING OF THE DATA STARTS %%%%%%%%%%

Xtest=X(test(set),:)
Ytest=y(test(set))
mm=length(Ytest)
tp=0;tn=0;fp=0;fn=0;
[ypred,yy]=predictNba(Xtest(5,: ),n,levels,cp,p,q)
for i=1:mm
    [ypred,yy]=predictNba(Xtest(i,: ),n,levels,cp,p,q);
    probY(i,1)=yy;
    if(ypred==1&Ytest(i)==1)
        tp=tp+1;
    end
    if(ypred==1&Ytest(i)==0)
        fp=fp+1;
    end
    if(ypred==0&Ytest(i)==1)
        fn=fn+1;
    end
    if(ypred==0&Ytest(i)==0)
        tn=tn+1;
    end
end
sensitivity=tp/(tp+fn);
precision=tp/(tp+fp) ; 
probY
Ytest
rocp(probY,Ytest);