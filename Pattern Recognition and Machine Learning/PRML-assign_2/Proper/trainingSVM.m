function model=trainingSVM(K,Xt,yt,lambda,d)

switch d
    case 1
        model=svmClass(K,Xt,yt,lambda);
    case 2
        epsi=prompt('enter the value of epsilon');
        model=svmReg(K,yt,epsi);
end