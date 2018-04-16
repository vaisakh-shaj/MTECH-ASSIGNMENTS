function [F,accuracy]=testingSVM(K,Ytrain,Ytest,model,c)
switch(c)
    case 1
        size(Ytrain)
        size(model.alpha)
        size(K)
%         WX=((Ytrain.*alpha)'*K);
%         x=max(WX(Ytest==-1));
%         y=min(WX(Ytest==1));
%         b=-((x+y)/2);
        ypred=(sign((model.y.*model.alpha)'*K+model.b))'
        mm=length(Ytest);
        tp=0;tn=0;fp=0;fn=0;
        for i=1:mm
            if(ypred(i)==1&&Ytest(i)==1)
                tp=tp+1;
            end
            if(ypred(i)==1&&Ytest(i)==0)
                fp=fp+1;
            end
            if(ypred(i)==0&&Ytest(i)==1)
                fn=fn+1;
            end
            if(ypred(i)==0&&Ytest(i)==0)
                tn=tn+1;
            end
        end
        accuracy=sum(ypred==Ytest)/mm;
        sensitivity=tp/(tp+fn);
        precision=tp/(tp+fp);
        F=(2*sensitivity*precision)/(precision+sensitivity);
    case 2
end
        
end