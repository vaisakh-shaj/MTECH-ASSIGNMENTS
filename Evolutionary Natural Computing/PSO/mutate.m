function p=mutate(p)
n=size(p,2);
a=randi(n);
b=randi(n);
temp=p(1,a);
p(1,a)=p(1,b);
p(1,b)=temp;
end