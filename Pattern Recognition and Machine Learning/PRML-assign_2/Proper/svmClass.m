function model= svmClass(K,Xt,yt,lambda)
m=size(yt,1);
one=ones(m,1);
cc=input('enter the method to find w 1: direct method 2: gradient descent 3.SMO');
switch cc
    case 1
%         alpha=((yt.*yt).^-1).*(pinv(K)*one);
          alpha=pinv((yt*yt').*K)*one;
% matrix=zeros(m,m);
% for i=1:m
%     for j=1:m
%         if i==j
%             matrix(i,i)=K(i,i);
%         else
%             matrix(i,j)=yt(i)*yt(j)*K(i,j);
%         end
%     end
% end

one_mat=ones(m,1);
% alpha = (matrix)\one_mat;
          WX=((yt.*alpha)'*K);
          x=max(WX(yt==-1));
          y=min(WX(yt==1));
          b=-((x+y)/2);
%           idx = alpha > 0;
          model.X= Xt;
          model.y= yt;
          model.kernel = K;
          model.b= b;
          model.alpha= alpha;
    case 2
        flag=0;
        figure;
        iter=0;
         gama=.09;
         ERR=-yt;
         C=.7;
         J=zeros(30+1);P=zeros(31);
    %epsilon=exp(-5);
    tol=exp(-3);
    alpha=zeros(m,1);
        while iter <30,
            iter
    	for i=1:m,
    		y=yt(i);    		
    		alpha(i)=alpha(i)+(1/K(i,i))*(1-y*(sum(yt.*alpha.* K(i,:)')));
    		if alpha(i)<0,
    			alpha(i)=0;
    		elseif alpha(i)>C,
    			alpha(i)=C;
    		end	    
    		value=sum(yt.*alpha.* K(i,:)')+.01;					
    		ERR(i)=value-y;
    		E=ERR(i);
			r=E*y;
    		%if( (r>-tol && alfa(i)<C) || (r<tol && alfa(i)>0) ),
    		%	flag=flag+1;
    		%end
        end
        if flag==m,
            break;
        else
            flag=0;
        end
    sumAlfa=sum(alpha);
    c=zeros(m);
    for i=1:m
        for j=1:m
                 c(i)=c(i)+alpha(i)*alpha(j)*yt(i)*yt(j)*(Xt(i,:)*Xt(j,:)');
        end
        J(iter+1)=J(iter+1)+alpha(i)-(.5)*c(i);
        dualObj=J(iter+1);
        primalObj= 2*dualObj-sumAlfa-dualObj*(sumAlfa-dualObj+1);
        P(iter+1)=-primalObj/(1+dualObj);
    end
    iter=iter+1;
    end
    
    
    figure
    plot(1:size(J,1), J, '-b');
    figure
     plot(1:size(P,1), P, '-r');
     
%     hold on;
%     plot(1:size(P,1), P, '-r');
%     legend('primalObj','dualObj');
    one_mat=ones(m,1);
% alpha = (matrix)\one_mat;
          WX=((yt.*alpha)'*K);
          x=max(WX(yt==-1));
          y=min(WX(yt==1));
          b=-((x+y)/2);
%           idx = alpha > 0;
          model.X= Xt;
          model.y= yt;
          model.kernel = K;
          model.b= b;
          model.alpha= alpha;
    case 3
        model=SMO(K,Xt,yt,lambda,1e-3, 20 );
        
end
end