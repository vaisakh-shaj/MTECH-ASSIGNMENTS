function plotregression(data,theta,d)
[X,y]=split(data);
figure
hold on;
plot(X,y,'rx','MarkerSize',10)
X=min(X):.1:max(X);
X1=mapFeature(X',d);
f=X1*theta;
plot(X,f);
title('REGRESSION CURVE');
hold off;
end