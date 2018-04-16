function J= mse(X,y,theta,lambda)
m = length(y); % number of training examples
f=(X*theta);
J = 0;
J=(1/(m))*sum((y-f).*(y-f));
end