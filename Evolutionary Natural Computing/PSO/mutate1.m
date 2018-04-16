function p=mutate(p)
n=size(p,2);
a=randi(n);
b=randi(n);
if(a>b)
    temp=a;
    a=b;
    b=temp;
end
temp=p(a:b);
p(a:b)=fliplr(temp);
end