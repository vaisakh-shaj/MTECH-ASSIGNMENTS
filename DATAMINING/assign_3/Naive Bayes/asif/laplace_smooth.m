
%%%%%%%     LAPLACE SMOOTHING       %%%%%%%%%
%%%%%%% Input arguments = probability matrix and size of the corresponding
%%%%%%% classified matrix
%%%%%%% Output argument = laplace smoothed probability matrix

function [ data ] = laplace_smooth( data,a )
z=0; 
[m,n]=size(data);
 for i=1:n                  %to identify the zero elements in the matrix
        for j=1:m
            if data(j,i)==0
                z=z+1;
            end
        end
 end
 for i=1:n                  %smoothing operation starts
        for j=1:m
            if data(j,i)==0
                data(j,i)= 1/(a+z);
            else
             data(j,i)=  data(j,i)*a/(a+z);
            end 
        end
 end
end

