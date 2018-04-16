function c= g(x,d)
a=floor((x-1)/d)+1;
b=mod(x,d);
if(b==0)
    b=d;
end
c=[a,b];
end
