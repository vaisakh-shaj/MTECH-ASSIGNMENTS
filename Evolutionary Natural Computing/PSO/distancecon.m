function dm=distancecon(m)
m=m(:,2:3);
n=size(m,1);
for i=1:n
    for j=1:n
        dm(i,j)=sqrt((m(i,1)-m(j,1)).*(m(i,1)-m(j,1))+(m(i,2)-m(j,2)).*(m(i,2)-m(j,2)));
    end
end
        
end