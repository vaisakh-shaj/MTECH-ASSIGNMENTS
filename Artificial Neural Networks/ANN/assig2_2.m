matrix = [0.8 0.5 0 1;0.9 0.7 0.3 1;1 0.8 0.5 1;0 0.2 0.3 -1;0.2 0.1 1.3 -1;0.2 0.7 0.8 -1];
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
        z = sigmoidal(net);
        r = y(i,1) - sigmoidal(net);
        omega1 = omega + (ita * r*(1/2*(1-(z^2))) * x(i,:)');
    else
        x(i,:) = x(count + 1,:);
        net = x(i,:)*omega(:,1);
        z = sigmoidal(net);
        r = y(i,1) - sigmoidal(net);
        omega1 = omega + (ita * r*(1/2*(1-(z^2))) * x(i,:)');
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
