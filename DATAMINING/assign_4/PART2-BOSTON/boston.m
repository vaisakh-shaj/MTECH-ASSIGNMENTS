clc;clear;
%%%%%%%%%%%%%%%%%%%%%%LOADING DATA........................
data=load('data2.txt');
[X,y]=split(data);

%%%%%%%%%%%%%%%%%%FEATURE NORMALIZE........................
[X, mu, sigma] = featureScale(X);
data=[X,y];

%%%%%%%%%%%%%%%%%%SPLITTING TO TRAINING AND TESTING........
[trainV,valV,testV]=dividerand(data',.6,.2,.2);
trainV=trainV';testV=testV';valV=valV';



%%%%%%%%%%%%%%%%TRAINING...................................
[Xtrain,ytrain]=split(trainV);
[Xval,yval]=split(valV);
a=[.0001,.0003:.001,.003,.01,.03,.1,.3,1,3]

for j=1:3
     lambda=10.^(j-1);
     for k=1:size(a,2)
         alpha=a(k);
         theta=training(Xtrain,ytrain,alpha,lambda);
         J(j,k)=crossValidate(Xval,yval,theta,lambda);
     end
 end

[r,c]=find(J==min(J(:)))


% % %%%%%%%%%%%%%%%%%%%PLOTTING Jcurve......................
[theta,Jhistory]=training(Xtrain,ytrain,a(c),0)
figure
plot(1:numel(Jhistory),Jhistory)
xlabel('Iterations');
ylabel('Cost J');
% plotregression(data,theta,D)
% lambda=[0,1,10,100,1000];
% plotlambda(trainV,testV,theta,lambda,D)
    

