 clear ; close all; clc

fprintf('Loading data ...\n');
data = load('Data1.csv');
n=size(data,2);
X = data(:, 1:n-1);
y = data(:, n);
m = length(y);



% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');
[trainV,valV,testV]=dividerand(data',.8,0,.2);
trainV=trainV';testV=testV';valV=valV';
[Xtrain,Ytrain]=split(trainV);
%Developing Model Using Training DATA%
[Xtrain mu sigma] = featureScale(Xtrain);
data1=[Xtrain Ytrain];
plotData(Xtrain,Ytrain);
fprintf('Finding Parameters like p,mu0,mu1,sigma');
[datapos,dataneg]=splitPN(data1)
[p,q,mu0,mu1,sigma]=estimate(datapos,dataneg)
[Xtest,Ytest]=split(testV);
[sigma]=cov(X)
mm=length(Ytest);
%x=input('enter the input features as a vector');
tp=0;tn=0;fp=0;fn=0;
for i=1:mm
    [ypred,yy]=predict(Xtest(i,:),mu0,mu1,sigma,n-1,p,q);
    probY(i,1)=yy;
    predY(i,1)=ypred;
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
sensitivity=tp/(tp+fn)
precision=tp/(tp+fp)
size(probY)
size(Ytest)
probY
Ytest
predY
F=(2*sensitivity*precision)/(precision+sensitivity)
rocp(probY,Ytest);

    
    




