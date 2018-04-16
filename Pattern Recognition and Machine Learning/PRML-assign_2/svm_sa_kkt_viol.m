%%%%%%%% ASSIGNMENT #1 => MODELLING OF DATA1   %%%%%%%

%%%%%%%%%% SVM CLASSIFICATION   %%%%%%%%%%%%%%%%



%%% NOTE!!! there is change in alpha_initialisation function

data = load('E:\pattern_recognition\assignments\assign_2\data_12.csv', 'v1');
[mm,nn]=size(data);
j=1;k=1;
C = cvpartition(data(:,3),'Holdout',0.3);
display(C);
holdoutdata = test(C);
c=05;flag=1;kern=1;eps=10;itr=1;b=0;uj=0;flag1(itr,1)=0;

for i=1:mm
    if(holdoutdata(i,1)==0)
        train_data(j,:)=data(i,:);
        j=j+1;
    else
        test_data(k,:)=data(i,:);
        k=k+1;
    end
end

[m,n]=size(train_data);
alpha1=zeros(m,1);

alpha_check=zeros(m,3);
%for kern =1:4
%for z= 1 :10: 10e+5
[ alpha ] = alpha_initialisation( c,m );
%alpha=zeros(m,1);
[ kernel_mat ] = kernel_matrix_gen( train_data );
[m1,n1,p1]=size(kernel_mat);

%while(nn>10e-3)
%while (eps>10e-3)
while (flag1(itr,1)<60)
%while (itr<100)
     itr = itr +1;
     
     
     
    %for i=1:m
    
    
    
    
     for i=1:m
         %if(i~=r)
    sum=0;
     for j=1:m
         sum = sum + alpha(j,1)*train_data(j,n)*kernel_mat(i,j);
     end
     %alpha(i,1) = alpha(i,1) + ((1 - (train_data(i,n)*sum))/kernel_mat(i,i));
     alpha(i,1) = alpha(i,1) + ((1 - (train_data(i,n)*sum))/abs(kernel_mat(i,i)));
     %alpha(i,1) = alpha(i,1) + ((1 - (train_data(i,n)*sum))/150);
     if (alpha(i,1)<0)
         alpha(i,1)=0;
     end
     if (alpha(i,1)>c)
         alpha(i,1)=c;
     end 
         %end
     end
    nn=norm(alpha1-alpha);
    alpha1=alpha;   
    
     
     
     kkt(itr,1)=0;
     for ii=1:m
         kkt(itr,1)=kkt(itr,1)+(alpha(ii,1)*train_data(ii,3));
     end
 %end
        
    
   % [b] = bias_finding( alpha,kernel_mat,train_data,kern);
   
   
 sum=0;alphasum=0;
 for i=1:m
     alphasum = alphasum + alpha(i,1);
     for j=1:m
         sum = sum + alpha(i,1)*alpha(j,1)*train_data(i,n)*train_data(j,n)*kernel_mat(i,j);
     end
 end
 w_of_alpha = alphasum - (sum/2);
 dual_obj(itr,1)=w_of_alpha;
 
 eps = (alphasum-(2*w_of_alpha))/(alphasum-w_of_alpha+1);
 
 prim_obj(itr,1)=(eps+dual_obj(itr,1))/(1-eps);
 %eps=abs(eps);                                                              %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 display(eps);       
            
 flag1(itr,1)=0;                               %to check whether kkt conditions are satisfied at convergence(flag1(itr,1) ideally = n(70))
alpha_check(:,1)=zeros(m,1);
 for i=1:m                      
         f_x=0;
         for j=1:m
             f_x = f_x + (alpha(j,1)*train_data(j,n)*kernel_mat(i,j,kern));
         end
         
         if (alpha(i,1)==0)
             if ((f_x+b)*train_data(i,n)>=1)
                 flag1(itr,1)=flag1(itr,1)+1;
                 alpha_check(i,1)=1;
                 alpha_check(i,2)=(f_x+b)*train_data(i,n);
             end
         elseif (alpha(i,1)>0 && (alpha(i,1)<c))
             if ((f_x+b)*train_data(i,n)>0.9 && ((f_x+b)*train_data(i,n)<1.1))
                 flag1(itr,1)=flag1(itr,1)+1;
                 alpha_check(i,1)=1;
                 alpha_check(i,2)=(f_x+b)*train_data(i,n);
             end
         else
             if ((f_x+b)*train_data(i,n)<=1)
                 flag1(itr,1)=flag1(itr,1)+1;
                 alpha_check(i,1)=1;
                 alpha_check(i,2)=(f_x+b)*train_data(i,n);
             end
         end
 end                       
%                 
%       

result  = testing( test_data, alpha,train_data,kern,kernel_mat );
output = [test_data(:,3) result];
display(output);
end

figure(1);
plot(dual_obj);
figure(2);
plot(prim_obj);