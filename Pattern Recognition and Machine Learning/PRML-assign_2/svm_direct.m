%%%%%%%% ASSIGNMENT #1 => MODELLING OF DATA1   %%%%%%%

%%%%%%%%%% SVM CLASSIFICATION   %%%%%%%%%%%%%%%%

data = load('E:\pattern_recognition\assignments\assign_2\data_1.csv', 'v1');
[mm,nn]=size(data);
j=1;k=1;
C = cvpartition(data(:,3),'Holdout',0.3);
display(C);
holdoutdata = test(C);
kern=1;


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

%for kern =1:4
%for z= 1 :10: 10e+5
[ kernel_mat ] = kernel_matrix_gen( train_data );
coeff_mat=zeros(m,m);

for i=1:m
    for j=1:m
        if i==j
            coeff_mat(i,i)=kernel_mat(i,i,kern);
        else
            coeff_mat(i,j)=train_data(i,n)*train_data(j,n)*kernel_mat(i,j,kern);
        end
    end
end

one_mat=ones(m,1);
% ky=(kernel_mat(:,:,kern)*(train_data(:,3).^1));
% for i=1:m
%     ky(i,1)=1/ky(i,1);
% end
% alpha=ky;
 alpha = (coeff_mat)\one_mat;
 display (alpha);

result  = testing( test_data, alpha,train_data,kern,kernel_mat );
output = [test_data(:,3) result];
display(output);


