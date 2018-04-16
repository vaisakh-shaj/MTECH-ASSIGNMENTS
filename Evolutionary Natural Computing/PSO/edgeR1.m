function p3= edgeR(p1,p2,m)
n=size(p1,2);
et=cell(n,1);
for i=1:n
    k=1;
%     pos1=find(p1==i);
%     pos2=find(p2==i);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    pos1=p1(i);
    if(i==n)
        a1=p1(1);
    else
        a1=p1(i+1);
    end
    if(i==1)
        a2=p1(n);
    else
        a2=p1(i-1);
    end
    et{pos1}=horzcat(et{pos1},[a1,a2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    pos2=p2(i);
    if(i==n)
        b1=p2(1);
    else
        b1=p2(i+1);
    end
    if(i==1)
        b2=p2(n);
    else
        b2=p2(i-1);
    end
    et{pos2}=horzcat(et{pos2},[b1,b2]);
end
% for i=1:n
% et{i}
% end
%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:n
    a=[];
    row=et{i};
    a1=row(1);a2=row(2);b1=row(3);b2=row(4);
    if((a1==b1)&(a2==b2)|(a1==b2)&(a2==b1))
        et{i}=[-a1 -a2];
    else
        if(a1==b1|a1==b2)
            k=1;
            a(k)=-a1;k=k+1;
            a(k)=a2;k=k+1;
            if(a1==b1)
                a(k)=b2;
            else
                a(k)=b1;
            end
        else
            if(a2==b1|a2==b2)
                k=1;
                a(k)=-a2;k=k+1;
                a(k)=a1;k=k+1;
                if(a2==b1)
                    a(k)=b2;
                else
                    a(k)=b1;
                end
            else
                a(1)=a1;
                a(2)=a2;
                a(3)=b1;
                a(4)=b2;
            end
        end
        et{i}=a;
    end
    et{i};
end
% for i=1:n
% et{i}
% end
p3=[];
k=1;
p3(k)=p1(1);
k=k+1;
while(k<=n)
    current=p3(k-1);
    cc=abs(p3(k-1));
%     for i=1:n
%         temp=et{i};
%         temp=temp(temp~=current);
%         temp=temp(temp~=-current);
%         et{i}=temp;
%     end
temp=et{cc};
    for i=1:size(et{cc},2)
        p=abs(et{cc}(i));
        if(any(p3==p))    %%%%%%%%%%%see how from O(n2) to O(n)
            temp=temp(temp~=p);
            temp=temp(temp~=-p);
        end
    end
    et{cc}=temp;
    if(isempty(et{cc}))
%         for r=1:n
%             if(~any(p3==r))
%                 p3(k)=r;
%                 k=k+1;
%                 break;
%             end
%         end
        r=randperm(n,1);
        while(any(p3==r))
            r=randperm(n,1);
        end
            p3(k)=r;
            k=k+1;
    else
        if(isempty(find(et{cc}<0)))
            temp=et{cc};
            [val,pos]=min(m(cc,abs(temp)));
            p3(k)=abs(temp(pos));
            k=k+1;
        else
            temp=et{cc};
            pos=find(temp<0);
            p3(k)=abs(temp(pos(1)));
            k=k+1;
        end
    end
end
p1;
p2;
p3;



        
        