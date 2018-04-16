clc;clear;
%%%%%%%%%%%%%%%%%%%%%%LOADING DATA........................
data=load('cancer1.txt');
[X,y]=split(data);

%%%%%%%%%%%%%%%%%%FEATURE NORMALIZE........................
[X, mu, sigma] = featureScale(X);
y(find(y==2))=0;
y(find(y==4))=1;
data=[X,y];

%%%%%%%%%%%%%%%%%%SPLITTING TO TRAINING AND TESTING........
[trainV,valV,testV]=dividerand(data',.6,.2,.2);
trainV=trainV';testV=testV';valV=valV';

K=10

%%%%%%%%%%%%%%%%TRAINING...................................
[Xtrain,ytrain]=split(trainV);
[Xtest,Ytest]=split(testV);
[Xval,Yval]=split(valV);
m2=size(valV,1)
m1=size(trainV,1)
m3=size(testV,1)
for j=1:m2
    for i=1:m1
        d(i)=sum((Xtrain(i,:)-Xval(j,:)).*(Xtrain(i,:)-Xval(j,:)));
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
        ypred(j)=1;
    else
        ypred(j)=0;
    end
end
tp=0;fp=0;fn=0;tn=0;
for i=1:m3
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
sensitivity= tp/(tp+fn);
precision=tp/(tp+fp);
Ytest
ypred
F=(2*sensitivity*precision)/(precision+sensitivity)
[xx,yy]=perfcurve(Ytest,ypred',1);
plot(xx,yy)


