function J= crossValidate(X,y,theta,lambda)
m = length(y); % number of training examples
f=(X*theta);
J = 0;
J=(1/(2*m))*sum((y-f).*(y-f))+(lambda/(2*m))*(sum(theta.*theta)-theta(1)*theta(1));
end