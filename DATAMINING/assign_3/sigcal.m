function [sigma]=sigcal(X,y,mu0,mu1)
[N,n]=size(X);
x=X;
for i=1:N
    if(y==0)
        x(i,:)=bsxfun(@minus,x(i,: ),mu0);
    else
        x(i,:)=bsxfun(@minus,x(i,: ),mu1); %x(i,:)-mu1
    end
end
sigma=(1/N)*(x'*x);
end

   

        