a=input('enter the matrix is MATLAB format');
[m,n]=size(a);
mul=zeros(m);
A=a(:,1:n-1)
for i=1:m-1
    for j=i+1:m
         mul(j,i)=a(j,i)/a(i,i);
         a(j,:)=a(j,:)-mul(j,i)*a(i,:);
    end
    a
end
L=mul+eye(m)
U=a(:,1:n-1)
    