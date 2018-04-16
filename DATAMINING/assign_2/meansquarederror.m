function mse= meansquarederror(X,y,theta)
m = length(y); % number of training examples
f=(X*theta);
mse=sum((y-f).*(y-f));
end