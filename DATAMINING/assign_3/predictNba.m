function [ypred,yy]= predictNba(x,levels,cp,p,q)
n=size(x,2);
py1=1;py0=1;
for i=1:n-1
    for j=1:levels
        if(x(1,i)==j)
            py1=py1.*cp(i,j,2);
            break;
        end
    end
end
py1=py1*p;
for i=1:n-1
    for j=1:levels
        if(x(1,i)==j)
            py0=py0.*cp(i,j,1);
            break;
        end
    end
end
py0=py0*q;
if(max(py0,py1)==py0)
    ypred=0;yy=py0;
else
    ypred=1;yy=py1;
end
end

