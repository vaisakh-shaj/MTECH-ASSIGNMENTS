function out = norm2(w1,w2)
[m,n] = size(w1);

sum = 0.0000;

for i = 1 : m
    sum = sum + sqrt(w1(i,1)^2 + w2(i,1)^2);
end
out = sum;