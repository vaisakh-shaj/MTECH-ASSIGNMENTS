disp('This program is for AND, OR, NAND')
disp('The Threshold value should be either 1 or between 1 and -1 ')
d = input('Please input the threshold value')
a = input('Please input a:  ')
b = input('Please input b:  ')
disp('the output is :   ')

out = 0;

sum = a + b;
if (a == 0) & (b == 0)& (sum >= d)
    out  = 0;
    disp(out)
    disp('the network  is OR')
elseif (a == 1) & (b == 0) & (sum >= d)
    out = 1;
    disp(out)
    disp('the network  is OR')
elseif (a == 0) & (b== 1) & (sum >= d)
    out = 1;
    disp(out)
    disp('the network  is OR')
elseif (a==1) & (b==1) & (sum >= d)
    out = 1;
    disp(out)
    disp('the network  is OR')
elseif (a==0) & (b==0) & (sum <= d)
    out = 0;
    disp(out)
    disp('the network  is AND')
elseif (a==0) & (b==1) & (sum <=d)
    out = 0;
    disp(out)
    disp('the network  is AND')
elseif (a==1) & (b==0) & (sum <=d)
    out = 0;
    disp(out)
    disp('the network  is AND')
elseif (a==1) & (b==1) & (sum <=d)
    out = 1;
    disp(out)
    disp('the network  is AND')
elseif (a==0) & (b==0) & (sum >= -1) & (sum <= 1) & (d >= -1) & (d <= 1)
    out = 1;
    disp(out)
    disp('the network  is nAND')
elseif (a==0) & (b==1) & (sum >= -1) & (sum <= 1)& (d >= -1) & (d <= 1)
    out = 1;
    disp(out)
    disp('the network  is nAND')
    
elseif (a==1) & (b==0) & (sum >= -1) & (sum <= 1)& (d >= -1) & (d <= 1)
    out = 1;
    disp(out)
    disp('the network  is nAND')
elseif (a==1) & (b==1) & (sum >= -1) & (sum <= 1)& (d >= -1) & (d <= 1)
    out = 0;
    disp(out)
    disp('the network  is nAND')
else
    disp('Untrainable or OUT of SCOPE')
end
    