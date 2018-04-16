%HEBBIAN LEARNING -  with sygnum activation%%
x = [1 -2 1.5 0.0; 1 -0.5 -2 -1.5; 0 1 -1 1.5];
w = [1 -1 0 0.5];
wnew = zeros(1,4);
alpha = 1;
net = 0.0000;
epsilon = 0.0000;


for i = 1 : 100
    
    count = rem(i,3);
    if count == 1
        x(i,:) = x(1,:);
    elseif count == 2
        x(i,:) = x(2,:);
    else
        x(i,:) = x(3,:);
    end
    
    net = w * x(i,:)';
    wnew = w + (alpha * sygnum(net) *x(i,:));
    
    epsilon = norm2(wnew',w');
    if epsilon <= 0.0005
        disp('convergence')
        disp(i)
        break;
    end
    w = wnew;
    
    
end

disp('The learning parameter is : ')
disp(w)
