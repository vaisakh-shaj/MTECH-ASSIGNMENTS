function regression()

	data=load('data_2.csv');
    data=data(randperm(size(data,1)),:);
    [m, n]=size(data);
    
%%%%%%%%%%%%%%%%PLOTTING AND PREPROCESSING...............

[data,mu,sigma]= featureScale(data);
[X,y]=split(data);

    gama=.2;
    C=.3;
    epsilon=exp(-5);
    tol=exp(-3);
    alfa=zeros(m,1);
    alfaStar=zeros(m,1);
    b=.9;
    ERR=y-epsilon*ones(m,1);

    %computing K for training points
    kern={'poly','rbf'}
    K=kernelmatrix(kern{1},X,X);
    flag=0;
    figure;
    cnt=0;

    while cnt<500,
        for i=1:m,
            Y=y(i);
            if ERR(i)>0,         
                alfa(i)=alfa(i)+(1/K(i,i))*(Y-sum((alfa-alfaStar).* K(i,:)')-epsilon);
                if alfa(i)<0,
                    alfa(i)=0;
                elseif alfa(i)>C,
                    alfa(i)=C;
                end
            else
                alfaStar(i)=alfaStar(i)+(1/K(i,i))*(-Y+sum((alfa-alfaStar).* K(i,:)')-epsilon);
                if alfaStar(i)<0,
                    alfaStar(i)=0;
                elseif alfaStar(i)>C,
                    alfaStar(i)=C;
                end
            end             
            value=sum((alfa-alfaStar).* K(i,:)')+b;                  
            ERR(i)=Y-value-epsilon;
            E=abs(Y-value);
            %E=ERR(i);
            %r=E*y;
            if(abs(E-epsilon)<tol),
               flag=flag+1;
            end
        end

        cnt=cnt+1;
        if flag==m,
            break;
        else
            flag=0;
        end

    end
    cnt
    value=zeros(m,1);
    MSE=0;
    for i=1:m,
        value(i)=sum((alfa-alfaStar).* K(i,:)')+b;
        MSE=MSE+(y(i)-value(i))^2;
    end
    MSE=sqrt(MSE)/m
    ERR=ERR+epsilon;
    mean(ERR)

    for i=1:m,
        if alfa(i)==0,
            plot3(X(i,1),X(i,2),y(i),'r*');
            %plot3(xval(i),yval(i),zval(i),'ro')
        end        
        hold on
    end
    legend('support vectors');
    d = 0.1;
    [X1, X2] = meshgrid(min(X(:,1)):d:max(X(:,1)),min(X(:,2)):d:max(X(:,2)));
    sv=find(alfa>0);

    vals=zeros(size(X1));
    for i=1:size(X1,2),
        this_X=[X1(:, i), X2(:, i)];
        for k=1:size(this_X,1),
            kgrid=zeros(m,1);
            %size(X(j,:))
            %size(this_X(k,:)')
            for j=1:m,
                kgrid(j)=exp(-gama*power(norm(X(j,:)-this_X(k,:)),2));
                %kgrid(j)=power(X(j,:)*this_X(k,:)',3);
            end
            vals(k,i)=sum((alfa-alfaStar).*kgrid)+b;
        end        
    end

    contour(X1,X2,vals,50);
    %contour(X1, X2, vals, [0 0], 'Color', 'b');
    %figure;
    %surf(X1,X2,vals);
    length(sv)
end

