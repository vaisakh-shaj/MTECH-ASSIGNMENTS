function model= svmClass(K,Xt,yt,lambda)
one=ones(size(yt,1),1);
cc=input('enter the method to find w 1: direct method 2: gradient descent 3.SMO');
switch cc
    case 1
%         alpha=((yt.*yt).^-1).*(inv(K)*one);
          alpha=inv((yt*yt').*K)*one;
          WX=((yt.*alpha)'*K);
          x=max(WX(yt==-1));
          y=min(WX(yt==1));
          b=-((x+y)/2);
          idx = alpha > 0;
          model.X= Xt(idx,:);
          model.y= yt(idx);
          model.kernel = K;
          model.b= b;
          model.alpha= alpha(idx);
    case 2
    case 3
        model=SMO(K,Xt,yt,lambda,1e-3, 20 );
        
end
end