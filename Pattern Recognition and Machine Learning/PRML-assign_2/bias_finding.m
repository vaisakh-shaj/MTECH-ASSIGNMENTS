function [  b ] = bias_finding( alpha,kernel_mat,data1,kern )

%b= (1/yi) + f(xi)
[m2,n2]=size(alpha);
b=0;k=0;f_x=0;
for i=1:m2
    
    if (alpha(i,1)~=0)
        for j=1:m2
            f_x = f_x + (alpha(j,1)*data1(j,n2)*kernel_mat(i,j,kern));
        end
        k=k+1;
        b=b+ (1/(data1(i,n2))) +f_x;
    end
end
   b=b/k;     
end

