function [p,q,cp]=estimateNba(datapos,dataneg,levels)
n=size(datapos,2)
pn=size(datapos,1)
nn=size(dataneg,1)
N=pn+nn;
[Xpos,ypos]=split(datapos);
[Xneg,yneg]=split(dataneg);
p=pn/N;
q=nn/N;
cp=[];
%%%%%%%%%%%%FINDING CONDITIONAL PROBABLITY P(X/Y=1) FOR VARIOUS LeVELS OF
%%%%%%%%%%%%EACH ATTRIBUTE X 

for i=1:(n-1)             %%%%%attributes    
    for j=1:levels        %%%%%levels
        c=0;
        for k=1:pn        
            if(Xpos(k,i)==j)
                c=c+1;
            end
        end
        cp(i,j,2)=c/pn;
    end
end
%%%%%%%%%%%%FINDING CONDITIONAL PROBABLITY P(X/Y=0) FOR VARIOUS LeVELS OF
%%%%%%%%%%%%EACH ATTRIBUTE X  

for i=1:(n-1)
    for j=1:levels
        c=0;
        for k=1:nn
            if(Xneg(k,i)==j)
                c=c+1;
            end
        end
        cp(i,j,1)=c/nn;
    end
end
        
            
end