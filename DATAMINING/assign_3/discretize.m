
%%%%%%%%%   DISCRETISING THE DATA SET %%%%%%%%%

%%%%%%% Input arguments = individual attribute columns of the data set and
%%%%%%% no:of levels they want to be discretized.
%%%%%%% Output arguments = discretized data


function [ data ] = discretize( DATA,levels )

n=size(DATA,2);
for k=1:n-1
    data=DATA(:,k);
    m=size(data,1);
    maximum = max(max(data));
    minimum = min(min(data));

    maxi = round(maximum);                  %rounding the maximum value to the nearest integer
    mini = round(minimum);                  %rounding the minimum value to the nearest integer
    stepsize = abs(maxi-mini)/levels;         %finding the stepsize between discrete levels

    for i=1:m     %discretizing process starts
        for j=1:levels
            if data(i,1)>=minimum+(j-1)*stepsize && data(i,1)<(minimum+j*stepsize)
            data(i,1)=j;
            break;
            end
        end
    end
    DATA(
end

