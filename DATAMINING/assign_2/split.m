function [X,y]=split(data)
[m,n]=size(data);
X=data(:,(1:n-1));
y=data(:,n);
end
