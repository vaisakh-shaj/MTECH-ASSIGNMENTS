%%%% Solving  Differential Equation Of A Damped System
syms x(t);
dsolve(M*diff(x,2)+D*diff(x)+K*x==0);