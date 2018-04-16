function P=doublebridge(p)
n=size(p,2);
start=1;
finish=n;
pos1=start+randi(ceil(n/4)); %%%%%%%%% Technique for randomly permuting in the range/arc(between a min and max value) of the tour circle%%%%%%%%%
pos2=pos1+1+randi(ceil(n/4));
pos3=pos2+1+randi(ceil(n/4));
a=p(start:pos1);
b=p(pos3+1:finish);
c=p(pos2+1:pos3);
d=p(pos1+1:pos2);
P=horzcat(a,b,c,d);



