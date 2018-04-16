function [db] = findDB(data,centroids)
sc=findSC(data,centroids);
k=size(centroids,1)
for i=1:k
    r=[];K=1;
    for j=1:k
        if(j~=i)
            d=(centroids(i,:)-centroids(j,:)).*(centroids(i,:)-centroids(j,:));
            d=sum(d,2);
            r(K)=(sc(i)+sc(j))/(sqrt(d));
            K=K+1;
        end
    end
    d(j)=max(r);
end
db=(1/k)*sum(d,2)
end

        