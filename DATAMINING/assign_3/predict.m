function [ypred,yy]=predict(x,mu0,mu1,sigma,n,p,q)

K=(((2*pi).^(n/2))*det(sigma).^0.5).^-1;
c0=(x-mu0)*inv(sigma)*(x-mu0)';
c1=(x-mu1)*inv(sigma)*(x-mu1)';
p0=K*exp(-.5*c0)*p
p1=K*exp(-.5*c1)*q
if(max(p0,p1)==p0)
    ypred=0;yy=p0;
else
    ypred=1;yy=p1;
end
