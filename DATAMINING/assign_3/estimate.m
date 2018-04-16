function [p,q,mu0,mu1,sigma]=estimate(datapos,dataneg)
pn=size(datapos,1)
nn=size(dataneg,1)
N=pn+nn;
[Xpos,ypos]=split(datapos)
[Xneg,yneg]=split(dataneg)
p=pn/N;
q=nn/N;
mu1=sum(Xpos)./pn;
mu0=sum(Xneg)./nn;
S1=cov(bsxfun(@minus,Xpos,mu1))
S0=cov(bsxfun(@minus,Xneg,mu0))
sigma=(pn/N)*S1+(nn/N)*S0
end