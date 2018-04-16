function theta=trainingLog(X,y,alpha)
m = length(y);% number of training examples
n=size(X,2); %number of features +1
theta=zeros(n,1);
num_iters=50;
for iter = 1:num_iters
h=sigmoid(X*theta);
del=(alpha/m)*((h-y)'*X);
theta=theta-del';
end
theta
end