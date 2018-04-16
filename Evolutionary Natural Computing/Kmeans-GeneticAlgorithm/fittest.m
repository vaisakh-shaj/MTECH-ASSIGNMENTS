function [fittest_indi,new_popu,cpopu,ii]=fittest(X,popu)
p=size(popu,3);
k=size(popu,1);
m=size(X,1);
for j=1:p
    centroids=popu(:,:,j);
    idx=findClosestCentroids(X,centroids);
    if(j==1)
        ii=idx;
    end
    new_popu(:,:,j)=ComputeCentroids(X,idx,k);
    cpopu(j)=estimateCost(X,new_popu(:,:,j),idx);
end
[val,ind]=min(cpopu);
fittest_indi=new_popu(:,:,ind);
end