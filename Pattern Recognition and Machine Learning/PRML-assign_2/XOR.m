data=[1 1 -1; 1 -1 1;-1 -1 -1; -1 1 1];
[X,y]=split(data);
Xnew=[ X(:,1).*X(:,1) , X(:,2).*X(:,2) , sqrt(2).*X(:,1).*X(:,2) ]
plotData3(Xnew,y);