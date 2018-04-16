clc;clear;
%%%%%%%%%%%%%%%%%%%%%%LOADING DATA..............................
data=load('Data.txt');
[m,n]=size(data);
%%%%%%%%%%%%%%%%%% FEATURE NORMALIZE............................
[data, mu, sigma] = featureScale(data)
[X,y]=split(data);
X = [ones(m,1) X];
data1=[X,y]

%%%%%%%%%%%%%%%%%%SPLITTING TO TRAINING AND TESTING.............
[trainV,valV,testV]=dividerand(data1',.6,.2,.2);
trainV=trainV';testV=testV';valV=valV';

%%%%%%%%%%%%%%%%TRAINING........................................
[Xtrain,ytrain]=split(trainV);
[Xval,yval]=split(valV);
display('training ...........');
a=[.0001,.0003:.001,.003,.01,.03,.1,.3,1,3];
for k=1:size(a,2)
            alpha=a(k);
            theta=training(Xtrain,ytrain,alpha);
            mse(k)=meansquarederror(Xval,yval,theta);
end

r=find(mse==min(mse));
a(r)
[theta,Jhistory]=training(Xtrain,ytrain,a(r));
figure
plot(1:numel(Jhistory),Jhistory)
xlabel('Iterations');
ylabel('Cost J');

%%%%%%%%%%%%%%TESTING...........................................
[Xtest,ytest]=split(testV);
mseTest=meansquarederror(Xtest,ytest,theta)

