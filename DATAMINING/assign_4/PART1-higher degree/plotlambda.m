function plotlambda(trainV,testV,theta,lambda,d)
[Xtrain ytrain]=split(trainV);
[Xtest,ytest]=split(testV);
Xtrain1=mapFeature(Xtrain,d);
Xtest1=mapFeature(Xtest,d);
for i=1:size(lambda,2)
    J1(i)=mse(Xtrain1,ytrain,theta,lambda(i));
    J2(i)=mse(Xtest1,ytest,theta,lambda(i));
end
figure;
plot(1:size(lambda,2),J1,'r')
legend('training error')
hold on;
plot(1:size(lambda,2),J2)
hold off;
end
