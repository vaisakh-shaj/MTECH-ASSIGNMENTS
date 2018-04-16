function [ X ] = scaling( x )

%This is for the scaling purpose

%This is so done for getting thenormalised value of x

[m,n]=size(x);

maxval=max(max(x));

minval=min(min(x));

difference=maxval-minval;

for i=1:m

 for j=1:n-1

 x(i,j)=(x(i,j)-minval)/difference;

 end

end

X=x;
end