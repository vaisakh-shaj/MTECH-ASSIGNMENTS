omega = [1;-1;0;-0.5];
omega1 = zeros(4,1);
x = [1,1,0;-2,-0.5,1;1.5,-2,-1;0,-1.5,1.5];
net = zeros(1,4);
err = input('input the error value...Remember it should be less than 0.5')
disp('press enter to continue')
pause;

error = 0;

for i = 1 : 100
    net = omega(4,1)' * x(:,i);
    omega1 = omega + (ita * sygnum(net) * x(:,i));
    omega = omega1;
    err = omega1 - omega;
end

