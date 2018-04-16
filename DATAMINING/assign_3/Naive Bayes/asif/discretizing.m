
%%%%%%%%%   DISCRETISING THE DATA SET %%%%%%%%%

%%%%%%% Input arguments = individual attribute columns of the data set and
%%%%%%% no:of levels they want to be discretized.
%%%%%%% Output arguments = discretized data


function [ data ] = discretizing( data,c_no )

[m,n]=size(data);
maximum = max(max(data));
minimum = min(min(data));

maxi = round(maximum);                  %rounding the maximum value to the nearest integer
mini = round(minimum);                  %rounding the minimum value to the nearest integer
stepsize = abs(maxi-mini)/c_no;         %finding the stepsize between discrete levels

for i=1:m                               %discretizing process starts
if data(i,1)>=minimum && data(i,1)<(minimum+stepsize)
data(i,1)=0;
end

if data(i,1)>=(minimum+stepsize) && data(i,1)<(minimum+(2*stepsize))
data(i,1)=1;
end

if data(i,1)>=(minimum+(2*stepsize)) && data(i,1)<(minimum+(3*stepsize))
data(i,1)=2;
end

if data(i,1)>=(minimum+(3*stepsize)) && data(i,1)<(minimum+(4*stepsize))
data(i,1)=3;
end

if data(i,1)>=(minimum+(4*stepsize)) && data(i,1)<=maximum
data(i,1)=4;
end
end
end
