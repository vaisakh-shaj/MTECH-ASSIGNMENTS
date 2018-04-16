
a=[-0.02 0.02;0.02 -0.02];
[e_vec,d]=eig(a);
e_value=[d(1,1) d(2,2)];


%%%%%% finding the general solution
syms t;
syms c1;
syms c2;
xc_1=0.7071*c1 + 0.7071*c2*exp(-0.04*t);
xc_2=0.7071*c1 - 0.7071*c2*exp(-0.04*t);
display('general solution is:');
x_t=[xc_1;xc_2];
display(x_t);


%%%%%% solving with initial values 
%%%%%% PS:initial conditions are taken by observing X (t)
b=[0.7071 0.7071;0.7071 -0.7071];
init_value=[0;150];
c=b\init_value;
display('value of c1 and c2 is:');
display(c);

%%%%%% the solution
xc_1=0.7071*106.0670 + 0.7071*-106.0670*exp(-0.04*t);
xc_2=0.7071*106.0670 - 0.7071*-106.0670*exp(-0.04*t);
x_t=[xc_1;xc_2];

display('final solution is:');
display(x_t);


%%%%% graphical representation of the solution
figure(1);
title('Plot of y1(t)');
xlabel('t');
ylabel('y(t)');
f=inline('1319413525841079/17592186044416 - (1319413525841079*exp(-t/25))/17592186044416');
fplot(f,[-1,200]);

figure(2);
title('Plot of y2(t)');
xlabel('t');
ylabel('y(t)');
f=inline('(1319413525841079*exp(-t/25))/17592186044416 + 1319413525841079/17592186044416');
fplot(f,[-1,200]);