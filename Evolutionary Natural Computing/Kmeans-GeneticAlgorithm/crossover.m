function [cross_popu]=crossover(fit_popu,c)
p=size(fit_popu,3);
k=size(fit_popu,1);
for i=1:2:p
    parent1=fit_popu(:,:,i);
    parent2=fit_popu(:,:,i+1);
    r=randi([2,k]);
    temp=parent1(r:k,:);
    parent1(r:k,:)=parent2(r:k,:);
    parent2(r:k,:)=temp;
    cross_popu(:,:,i)=parent1;
    cross_popu(:,:,i+1)=parent2;
end
end

    
    