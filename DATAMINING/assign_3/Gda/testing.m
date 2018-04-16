function [sensitivity,precision,predY]=testing(data,p,q,mu0,mu1,sigma)
[Xtest,Ytest]=split(data);
mm=length(Ytest);
n=size(data,2);
%x=input('enter the input features as a vector');
probY=[];ypred=[];
tp=0;tn=0;fp=0;fn=0;
for i=1:mm
    [ypred,yprob]=predict(Xtest(i,:),mu0,mu1,sigma,n-1,p,q);
    probY(i,1)=yprob;
    predY(i,1)=ypred;
    if(ypred==1&Ytest(i)==1)
        tp=tp+1;
    end
    if(ypred==1&Ytest(i)==0)
        fp=fp+1;
    end
    if(ypred==0&Ytest(i)==1)
        fn=fn+1;
    end
    if(ypred==0&Ytest(i)==0)
        tn=tn+1;
    end
end
sensitivity=tp/(tp+fn);
precision=tp/(tp+fp);
F=(2*sensitivity*precision)/(precision+sensitivity)
[xx,yy]=perfcurve(Ytest,predY,1);
Ytest
plot(xx,yy)
% rocp(probY,Ytest);
end



