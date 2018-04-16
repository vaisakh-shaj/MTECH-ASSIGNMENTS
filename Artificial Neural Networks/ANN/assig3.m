matrix = [1 1 1;1 -1 -1;-1 1 -1;-1 -1 -1];    %and
matrix = [1 1 1;1 -1 1;-1 1 1;-1 -1 -1];      %or
matrix = [1 1 -1;1 -1 1;-1 1 -1;-1 -1 -1];    %and not
matrix = [1 1 -1;1 -1 1;-1 -1 1;-1 -1 -1];    %ex or
disp(matrix)
ita =1;   
[m,n] = size(matrix);

x  = matrix(:,1:n-1);
y = matrix(:,n);

[m,n] = size(x);

omega = zeros(n,1);
omega1 = zeros(n,1);

net = 0.0000;
s  = 0.0000;
r = 0.0000;
err = 0.00;
count = 0.0000;
ynew = zeros(m,1);
count1 = zeros(m,1);
sum = 0;

for i = 1 : 5000
    count = rem(i,m);
    
    if i > m
        i = count + 1;
    end
    
    if i < m
        net = x(i,:)*omega(:,1);
        r = y(i,1) - sygnum(net);
        omega1 = omega + (ita * r * x(i,:)');
    else
        x(i,:) = x(count + 1,:);
        net = x(i,:)*omega(:,1);
        r = y(i,1) - sygnum(net);
        omega1 = omega+(ita * r * x(i,:)');
    end
    err = norm2(omega1,omega);
    
    
    
    omega = omega1;
    net = 0.0000;
    r = 0.0000;
end

disp('The optimised omega found is to be:  ')
disp(omega)
disp('The iteration is :   ')
disp(i)
