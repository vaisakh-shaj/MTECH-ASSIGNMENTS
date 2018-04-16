function plotDecisionBoundary1(X,mu0,mu1,sigma,n)
   x1max=max(X(:,1));
   x2max=max(X(:,2));
   x1min=min(X(:,1));
   x2min=min(X(:,2));
   x1=linspace(x1min,x1max,100);
   x2=linspace(x2min,x2max,100);
   for i=1:n
    x(i)=[x1(i),x2(i)]
    z(i)=predict(x(i),mu0,mu1,sigma,n);
   end
   contourf(x1,x2,z)
end
   