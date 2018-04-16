function [theta,Jhistory]=training(X,y,alpha)
m = length(y);% number of training examples
n=size(X,2);%number of features +1
theta=zeros(n,1);
num_iters=50;
for iter = 1:num_iters
    f=X*theta;
    del=(alpha/m)*((f-y)'*X);
    theta=theta-del';
    Jhistory(iter)=cost(X,y,theta);
end
% figure
% plot(1:num_iters,J)
theta;
Jhistory;
end