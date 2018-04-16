function [ result ] = testing( test_d, alpha,train_d,kern,kern_mat )

[m,n]=size(test_d);
result=zeros(m,1);
[m1,n1]=size(train_d);
b=0;k=0;
for i=1:m1
    sum=0;
    if(alpha(i,1)~=0)
        k=k+1;
    for j=1:m1
        sum=sum+(train_d(j,n1)*kern_mat(j,i));
    end
    b=b+ sum;
    end
end
b=b/k;

display(b);


test_d=[test_d(:,n-1)];
train_y=[train_d(:,3)];
train_d=[train_d(:,n1-1)];
for i=1:m
    summ=0;
    if(kern==1)
    for j=1:m1
        summ=summ+ alpha(j,1)*train_y(j,1)*dot(test_d(i,:),train_d(j,:));
    end
    end

    if(kern==2)
    for j=1:m1
        summ=summ+ alpha(j,1)*train_y(j,1)*(dot(test_d(i,:),train_d(j,:)))^2;
    end
    end

    if(kern==3)
    for j=1:m1
        summ=summ+ alpha(j,1)*train_y(j,1)*exp(-0.5*(norm(test_d(i,:)-train_d(j,:)))^2);
    end
    end
    
    if(kern==4)
    for j=1:m1
        summ=summ+ alpha(j,1)*train_y(j,1)*tanh(dot(test_d(i,:),train_d(j,:))+1);
    end
    end
 b=0;   
if((summ + b) >= 0)
    result(i,1)=1;
else
    result(i,1)=-1;
end
end


    
