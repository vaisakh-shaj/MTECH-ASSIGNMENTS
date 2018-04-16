function db=findDB(data,centroids)
sc=findSC(data,centroids);
k=size(centroids,1);
for i=1:k
    for j=1:k
        K=0;
        if(j==i)
            continue;
        else
            d=(centroid(i,:)-centroid(j,:)).*(centroid(i,:)-centroid(j,:));
            r(K)=(sc(i)+sc(j))/(sqrt(d));
        end
        K=K+1;
    end
    d(j)=max(r);
end
db=(1/k)*sum(d);
end

        