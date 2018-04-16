function [theta,Jhistory]=training(X,y,alpha,lambda)
m = length(y);% number of training examples
n=size(X,2);%number of features +1
theta=zeros(n,1);
num_iters=20;
for iter = 1:num_iters
f=X*theta;
del=(alpha/m)*((f-y)'*X)-(lambda/m)*theta';
theta=theta-del';
theta(1,1)=theta(1,1)-(alpha/m)*((f-y)'*X(:,1));
Jhistory(iter)=crossValidate(X,y,theta,1);
end
% figure
% plot(1:num_iters,J)
theta;
Jhistory;
end