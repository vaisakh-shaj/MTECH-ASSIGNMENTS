
%%%%%%%%%   DISCRETISING THE DATA SET %%%%%%%%%

%%%%%%% Input arguments = individual attribute columns of the data set and
%%%%%%% no:of levels they want to be discretized.
%%%%%%% Output arguments = discretized data


function [ data ] = discretize( data,levels )

n=size(data,2);
for k=1:n-1
    feature=data(:,k);
    m=size(data,1);
    maximum = max(max(feature));
    minimum = min(min(feature));

    maxi = round(maximum);                  %rounding the maximum value to the nearest integer
    mini = round(minimum);                  %rounding the minimum value to the nearest integer
    stepsize = abs(maxi-mini)/levels;         %finding the stepsize between discrete levels

    for i=1:m     %discretizing process starts
        for j=1:levels
            if feature(i,1)>=minimum+(j-1)*stepsize && feature(i,1)<(minimum+j*stepsize)
            feature(i,1)=j-1;
            break;
            end
        end
    end
    data(:,k)=feature(:,1);
end
end

