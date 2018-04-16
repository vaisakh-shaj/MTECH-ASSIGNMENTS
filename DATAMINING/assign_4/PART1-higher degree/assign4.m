clc;clear;
%%%%%%%%%%%%%%%%%%%%%%LOADING DATA..............................
data=load('Data.txt');

%%%%%%%%%%%%%%%%%% PLOT AND FEATURE NORMALIZE............................
[data, mu, sigma] = featureScale(data);
[X,y]=split(data);
figure
plot(X,y,'rx','MarkerSize',10)
[m,n]=size(data);
%%%%%%%%%%%%%%SPLITTING TO TRAINING AND TESTING.......................
c=cvpartition(m,'Leaveout')
%%%%%%%%%%%%%%%%TRAINING and CROSSVALIDATING..........................
D=input('enter the degrees to be fitted as a vector');
a=[.0001,.0003:.001,.003,.01,.03,.1,.3,1,3];
lambda=[0,.001,.001,.01,.03,.1,.3,1,3,10];
d=D;
for k=1:size(a,2)
        alpha=a(k);
        for i=1:m 
            train=training(c,i);
            val=test(c,i);
            trainV=data(train,:);
            train=training(c,i);
            val=test(c,i);
            valV=data(val,:);
            [Xtrain,ytrain]=split(trainV);
            [Xval,yval]=split(valV);
            Xtrain1=mapFeature(Xtrain,d);
            Xval1=mapFeature(Xval,d);
            theta=training(Xtrain1,ytrain,alpha,0);
            cost(i)=mse(Xval1,yval,theta,0);
        end
        J(k)=mean(cost);
end
     pos=find(J==min(J(:)))
     alpha=a(pos)
for j=1:size(lambda,2)
        for i=1:m 
             train=training(c,i);
            val=test(c,i);
            trainV=data(train,:);
            train=training(c,i);
            val=test(c,i);
            valV=data(val,:);
            [Xtrain,ytrain]=split(trainV);
            [Xval,yval]=split(valV);
            Xtrain1=mapFeature(Xtrain,d);
            Xval1=mapFeature(Xval,d);
            theta=training(Xtrain1,ytrain,alpha,lambda(j));
            J1(i)=mse(Xtrain1,ytrain,theta);
            J2(i)=mse(Xval1,yval,theta);
        end
        MSQtrain(j)=mean(J1);
        MSQtest(j)=mean(J2);
end
pos=find(MSQtest==min(MSQtest(:)))
lambda1=lambda(pos);
% % %%%%%%%%%%%%%%%%%%%PLOTTING Jcurve and RegressionCurve.....................................
[MSQtrain' MSQtest']
size(lambda)
figure;
plot(1:size(lambda,2),MSQtrain','r')
legend('training error')
hold on;
plot(1:size(lambda,2),MSQtest')
hold off;
[theta,Jhistory]=training(Xtrain1,ytrain,alpha,lambda1);
figure
plot(1:numel(Jhistory),Jhistory)
xlabel('Iterations');
ylabel('Cost J');
plotregression(data,theta,D)
% lambda1=[0,.001,.001,.01,.03,.1,.3,1,3,10];
% plotlambda(trainV,valV,theta,lambda1,D)
MSQ=min(MSQtest(:))
alpha
lambda1
