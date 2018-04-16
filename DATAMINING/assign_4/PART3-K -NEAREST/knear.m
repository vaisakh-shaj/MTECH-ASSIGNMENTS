clc;clear;
%%%%%%%%%%%%%%%%%%%%%%LOADING DATA........................
data=load('bcw_data.txt');
[X,y]=split(data);

%%%%%%%%%%%%%%%%%%PRE-PROCESSING AND FEATURE NORMALIZE........................
[X, mu, sigma] = featureScale(X);
idx2=find(y==2);
idx4=find(y==4);
y(idx2)=0;
y(idx4)=1;
data=[X,y];
%%%%%%%%%%%%%%%%%%SPLITTING TO TRAINING AND TESTING........
[trainV,valV,testV]=dividerand(data',.6,.2,.2);
trainV=trainV';testV=testV';valV=valV';



%%%%%%%%%%%%%%%%TRAINING...................................
K=input('enter the value of K');
[Xtrain,ytrain]=split(trainV);
[Xtest,Ytest]=split(testV);
m1=size(Xtrain,1);
m2=size(Xtest,1);
for j=1:m2
    for i=1:m1
        d(i)=sum((Xtrain(i,:)-Xtest(j,:)).*(Xtrain(i,:)-Xtest(j,:)));
    end
    sorted=sort(d);
    n=0;p=0;
    for k=1:K
        idx=find(d==sorted(k));
        if(ytrain(idx)==0)
            n=n+1;
        else
            p=p+1;
        end
    end
    if(max(n,p)==p)
        ypred(j,1)=1;
    else
        ypred(j,1)=0;
    end
end
ypred
Ytest
% 
tp=0;fp=0;tn=0;fn=0;
for i=1:m2
    if(ypred(i)==1&Ytest(i)==1)
        tp=tp+1;
    end
    if(ypred(i)==1&Ytest(i)==0)
        fp=fp+1;
    end
    if(ypred(i)==0&Ytest(i)==1)
        fn=fn+1;
    end
    if(ypred(i)==0&Ytest(i)==0)
        tn=tn+1;
    end
end
sensitivity=tp/(tp+fn);
precision=tp/(tp+fp);
F=(2*sensitivity*precision)/(precision+sensitivity)
[X,Y]=perfcurve(Ytest,ypred,1)
plot(X,Y)
xlabel('False positive rate'); ylabel('True positive rate')