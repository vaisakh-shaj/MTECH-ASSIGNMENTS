 clear ; close all; clc
%%%%%%%%%%%%%%%%%%%%%%LOADING DATA..............................
data = load('Data1.csv');

%%%%%%%%%%%%%%%%%% PLOT AND FEATURE NORMALIZE...................
[X,y]=split(data)
plotData(X,y);

%%%%%%%%%%%%%%%%%%SPLITTING TO TRAINING AND TESTING.............
[trainV,valV,testV]=dividerand(data',.8,0,.2);
trainV=trainV';testV=testV';valV=valV';
[Xtrain,Ytrain]=split(trainV);
[Xtrain mu sigma] = featureScale(Xtrain);
trainV=[Xtrain Ytrain];

%%%%%%%%%%%%%%%%%%DEVELOPING MODEL AND FINDING PARAMETERS.......
fprintf('Developing Model And Finding Parameters like p,mu0,mu1,sigma');
[datapos,dataneg]=splitPN(trainV)
[p,q,mu0,mu1,s0,s1,sigma]=estimate(datapos,dataneg)

%%%%%%%%%%%%%%%%%%%TESTING DATA.................................
[sensitivity,precision,predY]=testing(testV,p,q,mu0,mu1,sigma)

    
    
sigmainv=inv(sigma)
a=(mu0'*sigmainv*mu0)-(mu1'*sigmainv*mu1)
b=sigmainv(1,1)*(mu1(1,1)-mu0(1,1))+sigmainv(1,2)*(mu1(2,1)-mu0(2,1));
c=sigmainv(2,1)*(mu1(1,1)-mu0(1,1))+sigmainv(2,2)*(mu1(2,1)-mu0(2,1));

for i=1:100
    x(i,1)=data(i,1);
    x(i,2)=(-a-(2*x(i,1)*b))/(2*c);
end
hold on;grid on
plot(x(:,1),x(:,2),'--y');

%%%%%%%%%%%%%%%%%%%PLOTTING GUASSIAN COUNTOUR........................
x1=min(X(:,1):.1:max(X(:,1)));
x2=min(X(:,2):.1:max(X(:,2)));
figure;
hold on;
plotGuass(x1,x2,mu0,s0)
plotGuass(x1,x2,mu1,s1)
hold off;


