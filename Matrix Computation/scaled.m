a=input('enter the matrix is MATLAB format');
[m,n]=size(a);
mul=zeros(m);
A=a(:,1:n-1)
p=eye(m)
for i=1:m-1
    s=max(abs(A),[],2);
    idx=find(abs(a(i:m,i)./s(i:m))==max(abs(a(i:m,i)./s(i:m))))
    i
    temp=a(idx+i-1,:);temp1=p(idx+i-1,:);temp2=mul(idx+i-1,:);temp3=s(idx+i-1,:);
    a(idx+i-1,:)=a(i,:);p(idx+i-1,:)=p(i,:);mul(idx+i-1,:)=mul(i,:);s(idx+i-1)=s(i);
    a(i,:)=temp;p(i,:)=temp1;mul(i,:)=temp2;s(i)=temp3;
    for j=i+1:m
         mul(j,i)=a(j,i)/a(i,i);
         a(j,:)=a(j,:)-mul(j,i)*a(i,:);
    end
    a
end
L=mul+eye(m)
U=a(:,1:n-1)
    