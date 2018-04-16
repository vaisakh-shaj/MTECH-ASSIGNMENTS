function idx = findBMU(X, nuerons)

% Set K
K = size(nuerons, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

m=[];
for i=1:size(X,1)
	for j=1:K
		d=((nuerons(j,:)-X(i,:)).*(nuerons(j,:)-X(i,:)));
		d=sum(d,2);
		m=[m;d];
		end
	[v,idx(i,1)]=min(m); %v=value idx=position
	m=[];
end






% =============================================================

end

