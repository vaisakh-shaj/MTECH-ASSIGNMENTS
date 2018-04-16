function J= crossValidateLog(X,y,theta)
m = length(y);% number of training examples
n=size(X,2); %number of features +1
h=sigmoid(X*theta);
J=(-1/m)*sum((y.*log(h))+((1-y).*log(1-h)));
end