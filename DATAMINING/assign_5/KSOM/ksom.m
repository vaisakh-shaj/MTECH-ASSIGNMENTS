data=load('iris.csv');
[m,n]=size(data)
D=input('number of grids');
d=sqrt(D);

% %%%%%%%%%%%%%%%%%% CREATING GRID AND RANDOMLY INITIALIZING WEIGHTS TO IT
idx=randperm(m);
nuerons=data(idx(1:D),:)
% % k=1;
% % for i=1:4
% %     for j=1:4
% %         gr(:,i,j)=nuerons(k,:);
% %         k=k+1;
% %     end
% % end

%%%%%%%%%%%%%%%%%% FINDING BMU's of each data-point
num_iters=1500
L0=.3;sig0=d/2;
for t=1:num_iters
    idx=findBMU(data,nuerons);
    lambda=(num_iters/log(d/2));
    sig(t)=sig0*exp(-t/lambda);
    L(t)=L0*exp(-t/lambda);
    for i=1:m
        bmuidx=idx(i);
        bmu=data(idx(i),:);
        for j=1:size(nuerons,1)
            dbmu=sum((g(j,d)-g(bmuidx,d)).*(g(j,d)-g(bmuidx,d)),2); %square of the distance%
            n(t)=exp(-dbmu/(2*(sig(t).*sig(t))));
            nuerons(j,:)=nuerons(j,:)+L(t)*n(t)*(bmu-nuerons(j,:));
        end
    end
end
size(idx)
grid=zeros(d);          
for i=1:size(idx,1)
       for k=1:size(nuerons,1)
            if(idx(i)==k)
                c=g(k,d);
                i=c(1,1);
                j=c(1,2);
                grid(i,j)=grid(i,j)+1;
            end
       end
end
grid
imagesc(grid)
colorbar


        
