function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)

m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
s=size(X,2);
for iter = 1:num_iters
del=[];
  
for j=1:s
    del=[del;(alpha/m)*sum((X*theta-y).*X(:,j))];
	J_his(iter) = computeCostMulti(X, y, theta);   
end
theta=theta-del;

end

end
