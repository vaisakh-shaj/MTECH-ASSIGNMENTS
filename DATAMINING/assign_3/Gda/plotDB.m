function plotDB(data,mu0,mu1,sigma)

[X,y]=split(data);
plotData(X,y);    
sigmainv=inv(sigma)
a=(mu0*sigmainv*mu0')-(mu1*sigmainv*mu1')
b=sigmainv(1,1)*(mu1(1,1)-mu0(1,1))+sigmainv(1,2)*(mu1(1,2)-mu0(1,2));
c=sigmainv(2,1)*(mu1(1,1)-mu0(1,1))+sigmainv(2,2)*(mu1(1,2)-mu0(1,2));

x(:,1)=min(X(:,1)):.1:max(X(:,1))
x(:,2)=(-a-(2*x(:,1)*b))/(2*c);


hold on;
plot(x(:,1),x(:,2),'-g','LineWidth',2);
hold off;
end
