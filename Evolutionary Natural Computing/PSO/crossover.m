function par1 = crossover(par1,par2)
    flag=0;
	p=0.55;
	n=length(par1);
    while(flag==0)
        r=0;
        c1=randi(n);
        ind1=find(par1==c1);	
        if(rand()<p),
            c2=randi(n);
            if(c1==c2),
                c2=randi(n);
            end	

        else
            ind2=find(par2==c1);
            if(ind2~=length(par2)),
                c2=par2(ind2+1);
            else
                c2=par2(1);
            end		
        end	
    


        ind2=find(par1==c2);
        if(ind1>ind2),
            r=n-abs(ind1-ind2)+1;
            par1=circshift(par1,[0,r]);
        end	

        if(abs(ind1-ind2)~=1),
            temp=par1(ind1+1:ind2);
            par1(ind1+1:ind2)=fliplr(temp);
            par1=circshift(par2,[0,-r]);
        else
            flag=1;
        end
    end

end

