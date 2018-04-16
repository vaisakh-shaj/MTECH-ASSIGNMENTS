function [datapos,dataneg]= seperate(data,n)
    posind=find(data(:,n)==1);
    negind=find(data(:,n)==0);
    datapos=data(posind,:);
    dataneg=data(negind,:);
end
