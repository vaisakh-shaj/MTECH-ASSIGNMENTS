data=[2,10;2,5;8,4;5,8;7,5;6,4;1,2;4,9];
k=2;
dbidx=[];
for i=1:3
    centroids=kMeansInitCentroids(data,k);
    for j=1:50
        idx=findClosestCentroids(data,centroids);
        centroids=computeCentroids(data,idx,k);
    end
    index=idx';
    figure
    PlotClusters(data,index)
    J(i)=distortion(data,centroids,idx)
    dbidx(i)=findDB(data,centroids);
    k=k+1;
end
figure
plot(2:i+1,J)
xlabel('K value');
ylabel('J(c,mu)');
dbidx
min(dbidx)