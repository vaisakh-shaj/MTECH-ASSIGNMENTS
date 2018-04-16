
h=0.2;
step_size=2/h;
t=0;y=0.5;
output=zeros(step_size,1);
for i=1:step_size
    
    k1=h*(y-(t^2)+1);
    k2=h*((y+k1/2)-(t+(h/2))^2 +1);
    k3=h*((y+k2/2)-(t+(h/2))^2 +1);
    k4=h*((y+k3)-(t+h)+1);
    
ynew = y+((k1+k2+k3+k4)/6);
output(i,1)=ynew;
display('Value at iteration');
i
display(ynew);
y=ynew;
t=t+h;
end
h=0.2;
for i=1:10
    hh(i,1)=h;
    h=h+0.2;
end
plot(output,hh);