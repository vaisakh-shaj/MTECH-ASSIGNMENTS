a=[2 5;-3 -2];
[e_vec,d]=eig(a);
e_value=[d(1,1) d(2,2)];


%%%%%% finding the general solution
syms t;
syms c1;
syms c2;
xc_1=exp(real(e_value(1,1))*t)*(c1*(real(e_vec(1,1))*cos(imag(e_value(1,1))) - imag(e_vec(1,1))*sin(imag(e_value(1,1)))) + c2*(imag(e_vec(1,1))*cos(imag(e_value(1,1))) + real(e_vec(1,1))*sin(imag(e_value(1,1)))));
xc_2=exp(real(e_value(1,1))*t)*(c1*(real(e_vec(2,1))*cos(imag(e_value(1,1))) - imag(e_vec(2,1))*sin(imag(e_value(1,1)))) + c2*(imag(e_vec(2,1))*cos(imag(e_value(1,1))) + real(e_vec(2,1))*sin(imag(e_value(1,1)))));
display('general solution is:');
x_t=[xc_1;xc_2];
display(x_t);


%%%%%% solving with initial values 
%%%%%% PS:initial conditions are taken by observing X (t)
b=[0.7785 0.1377;0.4027 0.4613];
init_value=[-3;100];
c=b\init_value;
display('value of c1 and c2 is:');
display(c);

%%%%%% the solution
xc_1=exp(real(e_value(1,1))*t)*(1.0656*(real(e_vec(1,1))*cos(imag(e_value(1,1))) - imag(e_vec(1,1))*sin(imag(e_value(1,1)))) + 1.2375*(imag(e_vec(1,1))*cos(imag(e_value(1,1))) + real(e_vec(1,1))*sin(imag(e_value(1,1)))));
xc_2=exp(real(e_value(1,1))*t)*(1.0656*(real(e_vec(2,1))*cos(imag(e_value(1,1))) - imag(e_vec(2,1))*sin(imag(e_value(1,1)))) + 1.2375*(imag(e_vec(2,1))*cos(imag(e_value(1,1))) + real(e_vec(2,1))*sin(imag(e_value(1,1)))));
x_t=[xc_1;xc_2];

display('final solution is:');
display(x_t);
j=1;
% X1=zeros(61,1);
% X2=zeros(61,1);
% for t=-3:0.1:3
%     X1(j,1)=exp(real(e_value(1,1))*t)*(1.0656*(real(e_vec(1,1))*cos(imag(e_value(1,1))) - imag(e_vec(1,1))*sin(imag(e_value(1,1)))) + 1.2375*(imag(e_vec(1,1))*cos(imag(e_value(1,1))) + real(e_vec(1,1))*sin(imag(e_value(1,1)))));
%     X2(j,1)=exp(real(e_value(1,1))*t)*(1.0656*(real(e_vec(2,1))*cos(imag(e_value(1,1))) - imag(e_vec(2,1))*sin(imag(e_value(1,1)))) + 1.2375*(imag(e_vec(2,1))*cos(imag(e_value(1,1))) + real(e_vec(2,1))*sin(imag(e_value(1,1)))));
%     j=j+1;
% end
% % X1(j,1)=0;
% % X2(j,1)=0;
%plot(X1(:,1),X2(:,2));
     sol = dsolve('Dy1=2*y1+5*y2','Dy2=-3*y1+-2*y2','y1(0)=1','y2(0)=1','t');
 
 
 tval = (0:0.7:100)'; % column vector with t-values
 yval = double(subs([sol.y1,sol.y2],'t',tval)); % 2 columns with y1,y2 
 plot(yval(:,1),yval(:,2)) % plot col.2 of yval vs. col.1 of yval
 title('phase plane trajectory');
 xlabel('x1');
 ylabel('x2');