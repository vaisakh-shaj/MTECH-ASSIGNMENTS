function [val]=findSC(X,centroids)
idx=findClosestCentroids(X,centroids);
k=size(centroids,1);
m=size(X,1);
c=[];d=0;
for j=1:k
	for i=1:m
        if(j==idx(i))
		d=((centroids(j,:)-X(i,:)).*(centroids(j,:)-X(i,:)));
        d=sum(d,2);
        end
    end
    val(j)=sqrt(d);
end