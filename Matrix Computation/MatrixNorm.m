A=input('enter the matrix in the MATLAB format');
n=size(A,1);
colsum=zeros(size(A,1));
rowsum=zeros(size(A,1));

for i=1:n,
    colsum(i)=sum(A(:,i));
end;
oneNorm=max(colsum);	

for i=1:n,
    rowsum(i)=sum(A(i,:));
end;
infNorm=max(rowsum);

fobNorm=sqrt(sum(sum(A.*A)));	


A=A'*A;
euclidnorm=sqrt(max(eig(A)));


fprintf('one Norm :%f\n',oneNorm(1));
fprintf('inf Norm :%f\n',infNorm(1));
fprintf('Fobenius Norm :%f\n',fobNorm(1));
fprintf('Eucledian Norm :%f\n',euclidnorm(1));