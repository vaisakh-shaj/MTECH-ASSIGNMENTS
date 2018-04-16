 clear ; close all; clc
%%%%%%%%%%%%%%%%%%%%%%LOADING DATA..............................
data = load('Data1.csv');

%%%%%%%%%%%%%%%%%% PLOT AND FEATURE NORMALIZE...................
[X,y]=split(data);
plotData(X,y);
[X, mu, sigma] = featureScale(X);
data=[X,y];

%%%%%%%%%%%%%%%%%%SPLITTING TO TRAINING AND TESTING.............
[trainV,valV,testV]=dividerand(data',.8,0,.2);
trainV=trainV';testV=testV';valV=valV';


%%%%%%%%%%%%%%%%%%DEVELOPING MODEL AND FINDING PARAMETERS.......
fprintf('Developing Model And Finding Parameters like p,mu0,mu1,sigma');
[datapos,dataneg]=splitPN(trainV);
[p,q,mu0,mu1,s0,s1,sigma]=estimate(datapos,dataneg)
%[sigma]=cov(X)

%%%%%%%%%%%%%%%%%%%TESTING DATA.................................
figure;
[sensitivity,precision,predY]=testing(testV,p,q,mu0,mu1,sigma)
plotDB(testV,mu0,mu1,sigma);

%%%%%%%%%%%%%%%%%%%PLOTTING GUASSIAN SURFACE AND CONTOURS........................
x1=min(X(:,1)):.1:max(X(:,1));
x2=min(X(:,2)):.1:max(X(:,2));
figure;
hold on;
plotGuass(x1,x2,mu0,s0)
plotGuass(x1,x2,mu1,s1)
hold off;
figure;
hold on;
plotGuassCon(x1,x2,mu0,s0)
plotGuassCon(x1,x2,mu1,s1)
hold off;


