%%%%%%%%%%%%%%%%%%LOADING DATA..........................
clear ; close all; clc

prompt='1-classification and 2-regression';
d=input(prompt);
if d==1;
    data=load('data_1.csv');
end
if d==2;
    data = load('data_2.xlsx');
end
data=data(randperm(size(data,1)),:);
[X,y]=split(data);

%%%%%%%%%%%%%%%%PLOTTING AND PREPROCESSING...............
[X,y]=split(data);
m=size(y);
[X,mu,sigma]= featureScale(X);


%%%%%%%%%%%%%%%%%%SPLITTING DATA TO TRAINING ,CROSS-VALIDATION AND TESTING SETS .......
[trainV,valV,testV]=dividerand(data',.6,.2,.2);
trainV=trainV';testV=testV';valV=valV';

%%%%%%%%%%%%%%%%%%TRAINING AND
%%%%%%%%%%%%%%%%%%CROSS-VALIDATION.........................................
 [Xt,yt]=split(trainV);[Xv,yv]=split(valV);
 kern={'poly','rbf'}
 prompt='Enter the value of regularization parameter';
 lambda=input(prompt);
% for i=1:size(kern,2)
%      kern=k{i};
     Kt=kernelmatrix(kern{1},Xt,Xt);
%      Ktv=kernelmatrix(kern{2},Xt,Xv);
    model=trainingSVM(Kt,Xt,yt,lambda,d)
%      J(i)=crossValidateSVM(Ktv,yv,alpha,c)
%      
% end
%    [val,idx]=max(J);
%    alpha=Alpha[:,i];

%  
 [Xtest,ytest]=split(testV);
 m=size(ytest);
 Ktt=kernelmatrix(kern{1},model.X,Xtest);

[F,accuracy]=testingSVM(Ktt,yt,ytest,model,d)
 visualizeBoundary(Xtest, ytest, model, kern{1});