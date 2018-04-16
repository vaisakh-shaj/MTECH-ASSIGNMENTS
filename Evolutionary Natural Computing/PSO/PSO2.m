tic
% clc;clear;clear all;
m=load('kroa100.txt');
 m=distancecon(m);
N=size(m,1);
n=input('enter the number of particles');
maxiter=input('enter the max iterations to be performed');
list=[];G=[];
for e=1:1
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
for iter=1:maxiter
    iter;
    c=[0 0 0];
    w1=0.95-(0.95)*((iter)/maxiter);
    w2=.05+.95*((iter)/maxiter);
    w3=.05+.95*((iter)/maxiter);
    
%     c1=(1-0)*((iter)/maxiter)+0;c2=(1-0)*((iter)/maxiter)+0;
%     z=rand();
%     z=4*z*(1-z);
%     w=(0.4)*((iter)/maxiter)+0.1;
%     w=.5*rand()+.5*z;
%       w=.1*rand();
    for i=1:n
        c=[0 0 0];
        x=fortune_wheel([w1,w2,w3]);
        c(x)=1;
        t=t+1;
        I=p(i,:);
        ic(i)=cost(I,m);
         
             I=mutate(I);
         
        if(ic(i)<lbc(i))
            Lbest{i}=p(i,:);
            lbc(i)=cost(Lbest{i},m);
        end
        p3=edgeR1(I,Lbest{i},m);
        p4=edgeR1(I,Gbest,m);
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
%          ssl=swapSeq(Lbest{i},I);
%         ssg=swapSeq(Gbest,I);
        vel{i}=ADD(mul(c(1),vel{i}),mul(c(2),ssl),mul(c(3),ssg));
        p(i,:)=applySwap(I,vel{i});
        vel{i}=swapSeq(p(i,:),I);
    end
     [val,g]=min(lbc);
     Gbest=Lbest{g};
     gbc=cost(Gbest,m);
     G(iter)=gbc;
%      if(iter>6)
%          if(G(iter)==G(iter-1)&&G(iter)==G(iter-2)&&G(iter)==G(iter-3)&&G(iter)==G(iter-4)&&G(iter)==G(iter-5))
%              pause;
%          end
%      end
end
Gbest;
gbc=cost(Gbest,m)
list(e)=gbc;
iter;
size(G,2)
figure
plot(1:maxiter,G)
end
mean(list)
toc