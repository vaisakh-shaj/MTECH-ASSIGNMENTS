function [ b ] = b_finding( data)
data=[data(:,1:2)];
min=norm(data(1,:));
for i=1:70
    if norm(data(i,:))>min
        min=norm(data(i,:));
    end
end
b=min^2;

end

