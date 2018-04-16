a=input('input the positive definite matrix in matalb format');
%%%%%%%checking if positive definite%%%%%
n=size(a,1);m=size(a,2);
if(m~=n || det(a)<.0001)
    display('enter a positive definite matrix');
    return;
end
r=zeros(n);
r(1,1)=sqrt(a(1,1));
for j=2:n
    r(1,j)=a(1,j)/r(1,1);
end
for i=2:n
    p=0;
    for k=1:i-1
        p=p+r(k,i).*r(k,i);
    end
    r(i,i)=sqrt(a(i,i)-p);
    for j=(i+1):n
        q=0;
        for k=1:i-1
            q=q+r(k,i).*r(k,j)
        end
        r(i,j)=(a(i,j)-q)/r(i,i);
    end
end
r

            
    
    