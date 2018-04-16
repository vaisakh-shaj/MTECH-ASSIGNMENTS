function J = computeCostMulti(X, y, theta)

m = length(y); % number of training examples

J = 0;

J=(1/(2*m))*sum((X *theta-y).*(X*theta-y));


end
