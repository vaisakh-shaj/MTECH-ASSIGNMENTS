x = [1 -2 0 -1; 0 -1.5 -0.5 -1; -1 1 0.5 -1];
d = [-1 -1 1]';
w = [1 -1 0 0.5];
wnew = zeros(1,4);
ita = 1;
net = 0.0000;
check = 0.0000;
bhalo = 0.0000;


for i = 1 : 100
    
    count = rem(i,3);
    if count == 1
        x(i,:) = x(1,:);
        d(i,1) = d(1,1);
    elseif count == 2
        x(i,:) = x(2,:);
        d(i,1) = d(2,1);
    else
        x(i,:) = x(3,:);
        d(i,1) = d(3,1);
    end
    
    
    net = w * x(i,:)';
    wnew = w + ((ita*(d(i,1) - sygnum(net)))*x(i,:));
    
    check = norm2(wnew',w');
    if check <= 0.0005
        break;
    end
    w = wnew;
    
end

disp('The optimised omega is : ')
disp(w)
    