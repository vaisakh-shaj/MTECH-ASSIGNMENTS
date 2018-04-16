 clear ; close all; clc
%%%%%%%%%%%%%%%%%%%%%%LOADING DATA..............................
data = load('Data1.csv');
levels=4;
%%%%%%%%%%%%%%%%%% split AND DISCRETIZE.........................
[X,y]=split(data);
data=discretize(data,levels);

%%%%%%%%%%%%%%%%%%SPLITTING TO TRAINING AND TESTING.............
[trainV,valV,testV]=dividerand(data',.8,0,.2);
trainV=trainV';testV=testV';valV=valV';
% [Xtrain,Ytrain]=split(trainV);
% [Xtrain mu sigma] = featureScale(Xtrain);
% trainV=[Xtrain Ytrain];

%%%%%%%%%%%%%%%%%%DEVELOPING MODEL AND FINDING PARAMETERS.......
fprintf('Developing Model And Finding Parameters p,q,cp');
[datapos,dataneg]=splitPN(trainV);
[p,q,cp] = estimateNba(datapos,dataneg,levels)

%%%%%%%%%%%%%%%%TESTING.........................................
[sensitivity,precision,predY]=testing(testV,levels,cp,p,q)
