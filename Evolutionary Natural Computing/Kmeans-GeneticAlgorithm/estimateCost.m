function [cost]=estimateCost(X,centroids,idx)
k=size(centroids,1);
m=size(X,1);
c=[];d=0;
for i=1:m
	for j=1:k
        if(j==idx(i))
		d=((centroids(j,:)-X(i,:)).*(centroids(j,:)-X(i,:)));
        d=sum(d,2);
        end
    end
    c(i)=d;
end
cost=sum(c);
end
