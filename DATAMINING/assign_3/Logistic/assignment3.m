%%%%%%%%%%%%%%%%%%LOADING DATA..........................
clear ; close all; clc
% 
% prompt='Which data to enter?? 1:Data1.csv 2:haberman.csv';
% d=input(prompt);
% if d==1
%     data=load('Data1.csv');
% end
% if d==2
% data = load('haberman.csv');
% [X,y]=split(data);
% ind=find(y==2);
% y(ind)=0;
% ind=find(y==1);
% y(ind)=1;
% data=[X,y];
% end
data=[1 1 -1; 1 -1 1;-1 -1 -1; -1 1 1];
[X,y]=split(data);
Xnew=[ X(:,1).*X(:,1) , X(:,2).*X(:,2) , sqrt(2).*X(:,1).*X(:,2) ]

%%%%%%%%%%%%%%%%PLOTTING AND PREPROCESSING...............
[X,y]=split(data);
m=size(y)
[X,mu,sigma]= featureScale(X);
%add intercept term
X = [ones(m) X];
data=[X,y];%data with intercept term

%%%%%%%%%%%%%%%%%%SPLITTING DATA TO TRAINING ,CROSS-VALIDATION AND TESTING SETS .......
[trainV,valV,testV]=dividerand(data',.6,.2,.2);
trainV=trainV';testV=testV';valV=valV';

%%%%%%%%%%%%%%%%%%TRAINING AND
%%%%%%%%%%%%%%%%%%CROSS-VALIDATION.........................................
 [Xt,yt]=split(trainV);[Xv,yv]=split(valV);
 a=[.0001,.0003,.001,.003,.01,.03,.1,.3,1,3]
 
 for i=1:size(a,2)
     alpha=a(i);
     theta=trainingLog(Xt,yt,alpha);
     J(i)=crossValidateLog(Xv,yv,theta)
     
 end
 
 %%%%%%%%%%%%%%%SELECTING ALPHA AND PLOTTING CORRESPONDING COVERGENCE CURVE
  [val,ind]=min(J);
 alpha=a(ind);
 plotConvergence(Xt,yt,alpha);
 theta=trainingLog(Xt,yt,alpha);

%%%%%%%%%%%%%%%%%%TESTING...............................
 
 [X,y]=split(testV);
 m=size(y);
 plotDecisionBoundary1(theta, X, y);
 h=sigmoid(X*theta);
 for i=1:m
    if h(i)>.5
        ypred(i,1)=1;
    else
         ypred(i,1)=0;
    end
 end
[sensitivity,precision]=testing(testV,ypred,theta)
