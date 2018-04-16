function initial_popu=popu_init(data,p)
prompt=('enter the no: of initial centroids');
k=input(prompt);
initial_popu=[];
for i=1:p
    initial_popu(:,:,i)=kMeansInitCentroids(data,k);
end
end
