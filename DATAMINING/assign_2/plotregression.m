function plotregression(data,theta)
[X,y]=split(data);
[m,n]=size(X);
X1=X(:,2:n)
figure
hold on;
plot(X1,y,'rx','MarkerSize',10)
X1=min(X1):.1:max(X1)
M=size(X1,2)
X=[ones(M,1) X1']
f=X*theta
plot(X1',f);
title('REGRESSION CURVE');
hold off;
end