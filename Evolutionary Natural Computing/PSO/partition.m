[child] = function partition(p1 p2)
% Take two parents as the arguments and returns the child %
  e=edgeT(p1,p2);
  N=size(p1);
  list=p1;
  k=1;
  %%%%%%%%%%%%%%%%%%% bringing all degree 2 towards the front%%%%%%%%%%%%%%%%%%%%
  for i=1:N
    c=list(i);
    if size([e{c}])==2
      k=k+1;
      temp=list(k);
      list(k)=list(i);
      list(i)=temp;
    end
  end
  
  pc=0;f=0;
  listU=list(k:N);
  n=size(listU);
  pc=pc+1;
  c=listU(1);
  temp=listU(pc);
  listU(pc)=listU(n-pc+1);
  listU(n-pc+1)=temp;
 

  while(FIFO!=[] || pc==1)
  
  %%%%%%%%%%%%%%%%%% Update List %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  p=p+1;
  
  
 
  canF=edgeT(c);
  t=size(canF);
  for i=1:t
    if canF(i)>0 && sum(canF(i)==list((n-p):n))==0 
      f=f+1;
      FIFO(f)=canF(i);
    end
  end
  
  
  c=FIFO(1);
  pc=pc+1;
  p=find(listU==c);
  temp=listU(p);
  listU(p)=listU(n-pc+1);
  listU(n-pc+1)=temp;
  FIFO(1)=[];
  
  %%%%%%%%%%%%%% For implementing x in O(n) need another list %%%%%%%%%%%
  
  end     
  
  child=