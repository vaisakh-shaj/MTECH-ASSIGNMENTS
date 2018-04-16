x = [1 -2 1.5 0.0; 1 -0.5 -2 -1.5; 0 1 -1 1.5];
w = [1 -1 0 0.5];
wnew = zeros(1,4);
ita = 1;
net = 0.0000;
check = 0.0000;

%%This program is for the hebbian learning rule
%% STEPS:
%% for i = 1:optimal solution
%% W_new = W_old + ita*sigmoidal(W_old' * X(step))*X(step)
%%Continues till optimal solution obtained

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
    wnew = w + (ita * sigmoidal(net) * x(i,:));
    
    check = norm2(wnew',w');
    if check <= 0.0005
        break;
    end
    w = wnew;
    
    
end

disp('The optimised omega is : ')
disp(w)
