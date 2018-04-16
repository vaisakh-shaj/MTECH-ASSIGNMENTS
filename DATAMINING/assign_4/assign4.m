clc;clear;
%%%%%%%%%%%%%%%%%%%%%%LOADING DATA..............................
data=load('Data.txt');

%%%%%%%%%%%%%%%%%% PLOT AND FEATURE NORMALIZE............................
[X,y]=split(data);
plot(X,y,'rx','MarkerSize',10)
[data, mu, sigma] = featureScale(data);

%%%%%%%%%%%%%%%%%%SPLITTING TO TRAINING AND TESTING.............
[trainV,valV,testV]=dividerand(data',.6,.2,.2);
trainV=trainV';testV=testV';valV=valV';

%%%%%%%%%%%%%%%%TRAINING........................................
D=input('enter the degrees to be fitted as a vector');
[X,y]=split(trainV);
a=[.1:.1:.6]
for i=1:size(D)
    d=D(i);
    X=mapFeature(X(:,1),d);
    for j=1:3
        lambda=10.^(j-1);
        for k=1:size(a,2)
            alpha=a(k);
            theta=training(X,y,alpha,0);
            J(j,k)=crossValidate(X,y,theta,lambda);
        end
    end
end
%%%%%%%%%%%%%%%%%%%TESTING.....................................
theta=training(X,y,.3,0)
[X,y]=split(testV);

    

