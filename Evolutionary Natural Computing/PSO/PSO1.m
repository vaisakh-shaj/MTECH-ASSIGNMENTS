clc;clear;clear all;
m=load('gr17_d.txt');
N=size(m,1);
n=input('enter the number of particles');
vel=[];p=[];pos=[];
for i=1:n
    p(i,:)=randperm(N);
    vel{i}=swapSeq(randperm(N),p(i,:));
    Lbest{i}=randperm(N);
    lbc(i)=cost(Lbest{i},m);
end

[val,g]=min(lbc);
Gbest=Lbest{g};gbc=cost(Gbest,m);
l=0;t=0;L=0;
for iter=1:100
    iter
    c1=2*rand();c2=2*rand();
%     if(c1<1)
%         c1=c1+1;
%     end
%     if(c2<1)
%         c2=c2+1;
%     end
    for i=1:n
        t=t+1;
        I=p(i,:);
        p3=edgeR(I,Lbest{i},m);
        p4=edgeR(I,Gbest,m);
        if(cost(p3,m)<lbc(i))
            ssl=swapSeq(p3,I);
            l=l+1;
        else
            ssl=swapSeq(Lbest{i},I);
        end
        if(cost(p4,m)<gbc)
            L=L+1;
            ssg=swapSeq(p4,I);
        else
            ssg=swapSeq(Gbest,I);
        end
        vel{i}=ADD(mul(.3,vel{i}),mul(c1,ssl),mul(c2,ssg));
        p(i,:)=applySwap(I,vel{i});
        vel{i}=swapSeq(p(i,:),I);
        ic(i)=cost(p(i,:),m);
        lbc(i)=cost(Lbest{i},m);
        gbc=cost(Gbest,m);
        if(ic(i)<lbc(i))
            Lbest{i}=p(i,:);
            lbc(i)=cost(Lbest{i},m);
        end
        if(lbc(i)<gbc)
            Gbest=Lbest{i};
            gbc=cost(Gbest,m);
        end
    end
end
Gbest
gbc=cost(Gbest,m)