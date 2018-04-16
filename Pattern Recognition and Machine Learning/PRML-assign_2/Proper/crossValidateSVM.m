function J=crossValidateSVM(K,y,alpha,c)
switch(c)
    case 'c'
        ypred=sign(sum(y.*alpha.*K(:,i)));
        mm=length(y);
        tp=0;tn=0;fp=0;fn=0;
        for i=1:mm
            if(ypred(i)==1&Ytest(i)==1)
                tp=tp+1;
            end
            if(ypred(i)==1&Ytest(i)==0)
                fp=fp+1;
            end
            if(ypred(i)==0&Ytest(i)==1)
                fn=fn+1;
            end
            if(ypred(i)==0&Ytest(i)==0)
                tn=tn+1;
            end
        end
        accuracy=(tp+tn)/mm;
        J=1/accuracy;
    case 'r'
        ypred=
end
        