function hamm_dist = findHammingDistance(par1,par2)

	starter=par1(1);
	indx=find(par2==starter);
	if(par1(1)~=par2(1))
		indx=length(par1)-indx+1;
		par2=circshift(par2,[0,indx]);
	end	

	hamm_dist=sum(par1~=par2);

end

