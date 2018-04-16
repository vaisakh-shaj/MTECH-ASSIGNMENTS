clock =0 ;
Ta=input('enter mean time between two succesive arrivals');
Ts=input('enter mean time between two succesive services');
m=input('enter the number of servers');
endtime=input('enter the simulation time');
flag=zeros(m+1,1);
tnext(1)=0;
tnext(2:m+1,1)=endtime;
Qstart=[];
n=0;q=0;c=0;l=0;   N=0;t=0;
y=[];waiting=[];nn=[];
while(clock<endtime)
    [clock,p]=min([tnext]);
    clock
    tnext
    Qstart;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SERVER FREE %%%%%%%%%%%%%%%%%%%%%%
    if p==1 && sum(flag~=m)    %%%%%%%%%%% Arrival
            tnext(1)=clock+exprnd(Ta);
            n=n+1;N=N+1;t=t+1;nn(t)=N;
            y(n)=clock  %%%%%%%% storing arrival instants 
        for i=2:(m+1)              %%%%%%%%% Checking for free servers and alloting
            if flag(i)==0 
                flag(i)=1;
                tnext(i)=clock+exprnd(Ts);
                break;
            end
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%% SERVER NOT FREE  
        if p==1&&sum(flag)==m
            q=q+1;N=N+1;t=t+1;nn(t)=N;
            Qstart(q)=clock;  %%%%%%%storing waiting start time
            tnext(1)=clock+exprnd(Ta);
        end
%%%%%%%%%%%%%%%%%%%%%%% DEPARTING and making server free        
    if (p>1)
        c=c+1; N=N-1;t=t+1; z(c)=clock; nn(t)=N;  %%%%%%%%%%%%%%%% service completing instants
        if isempty(Qstart) 
            flag(p)=0;
            tnext(p)=endtime;
        else       %%%%%%%%% Queue non-Empty immediately allot
            tnext(p)=clock+exprnd(Ts);
            [val,qpos]=min(Qstart);
            l=l+1;q=q-1;
            waiting(l)=clock-Qstart(qpos); %%%%%%% waiting time in Queue
            Qstart(qpos)=[];
        end
    end
end
average_waiting_time=sum(waiting)/size(waiting,2)
throughput=c/endtime
plot(y,0,'*b')
xlabel('time');
legend('arrival instants')
figure
plot(y,0,'*r')
xlabel('time');
legend('departure instants')
% plot(1:n-1,y);
nn;