function [ kernel_mat ] = kernel_matrix_gen( inp_data )

[m,n]=size(inp_data);

kernel_mat=zeros(m,m,4);
inp_data=[inp_data(:,1:n-1)];
for i=1:4
    
    for j=1:m
        for k=1:m
            if(i==1)
                kernel_mat(j,k,i)= dot(inp_data(j,:),inp_data(k,:));
            end
            if(i==2)
                kernel_mat(j,k,i)= (dot(inp_data(j,:),inp_data(k,:)) + 1)^3;
            end
            if(i==3)
                kernel_mat(j,k,i)= exp(-0.5*(norm(inp_data(j,:)-inp_data(k,:)))^2);
            end    
            if(i==4)
                kernel_mat(j,k,i)= tanh(dot(inp_data(j,:),inp_data(k,:))+1);
            end 
        end
    end
end

