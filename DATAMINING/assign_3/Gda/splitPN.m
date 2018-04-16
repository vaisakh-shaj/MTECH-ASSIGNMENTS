function [datapos,dataneg]= splitPN(data)
    n=size(data,2);
    posind=find(data(:,n)==1);
    negind=find(data(:,n)==0);
    datapos=data(posind,:);
    dataneg=data(negind,:);
end
