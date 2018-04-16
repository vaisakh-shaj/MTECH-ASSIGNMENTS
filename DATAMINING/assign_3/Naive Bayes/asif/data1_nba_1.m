%%%%%%%     ASSIGNMENT -->#3     %%%%%%%%%%%%%%%

%%%%%%    NAIVE BAYES ANALYSIS ON DATA1   %%%%%%%


%%%%%%%%%%%%%%% DATA UPLOAD AND INITIALISING VARIABLES AND VECTORS%%%%%%
%clc;
data = load ('Data1.csv');
[m,n]=size(data);
c_no=5;    %no of discretising levels
%%%%%%%%%   DISCRETISING THE DATA SET %%%%%%%%%

for i=1:n-1
    data(:,i)=discretizing(data(:,i),c_no);   
end
display(data);

%%%%%%   CLASSIFYING INTO POSITIVE AND NEGATIVE CLASS %%%%%%%

[ positive,negative]=classification(data);


%%%%%%% CLASSIFYING INTO TRAINING DATA AND TESTING DATA %%%%%%%%%%

[positive_tr,positive_tst] = nba_training( positive );
[a, b]=size(positive_tr);
[negative_tr,negative_tst] = nba_training( negative );
[c ,d]=size(negative_tr);
display(positive_tst);
 
%%%%%%% FINDING THE CONDITIONAL PROBABILITIES FOR POSITIVE & NEGATIVE CLASS AND THEIR TOTAL PROBABILITY %%%%%%%%%

[prob_pos]=cond_prob(positive_tr,5);
[prob_neg]=cond_prob(negative_tr,5);
ppos=a/a+c;
pneg=c/a+c;
% %%%%%%%     LAPLACE SMOOTHING       %%%%%%%%%
% 
% prob_pos=laplace_smooth(prob_pos,a);
% prob_neg=laplace_smooth(prob_neg,c);
%    
% display(prob_pos);
% display(prob_neg);
% 
%%%%%%%%% TESTING OF THE DATA STARTS %%%%%%%%%%

p1=nba_testing( positive_tst,prob_pos,ppos,c_no);
p2=nba_testing( positive_tst,prob_neg,pneg,c_no);
p3=nba_testing( negative_tst,prob_pos,ppos,c_no);
p4=nba_testing( negative_tst,prob_neg,pneg,c_no);
display(p1);
[g, f]=size(p1);
pred1 = zeros(g,1);
pred2 = zeros(g,1);
p5=p1;
prob1= zeros(g,1);
prob2= zeros(g,1);
for i=1:g       %to take the decision corresponding to test data in positive class
    
        if p5(i,1)>=p2(i,1)
            pred1(i,1)=1;
            prob1(i,1)=p5(i,1);         %storing probability values for plotting roc
        else
            pred1(i,1)=0;
            prob1(i,1)=p2(i,1);         %storing probability values for plotting roc
        end
end

for i=1:g           %to take the decision corresponding to test data in negative class
    
        if(p3(i,1)>=p4(i,1))
            pred2(i,1)=1;
            prob2(i,1)=p3(i,1);         %storing probability values for plotting roc
        else
            pred2(i,1)=0;
            prob2(i,1)=p4(i,1);         %storing probability values for plotting roc
        end
end
probability=[prob1' prob2'];
prediction = [pred1' pred2'];
display('prediction...');
actual=[positive_tst(:,3)' negative_tst(:,3)'];
result=[actual;prediction ];
display(result);

%%%%%%%%%%%%%%%%%% ASSESING THE PERFORMANCE OF THE SYSTEM %%%%%%%%%%%%%%
performance(result');


%%%%%%%%%% PLOTTING ROC %%%%%%%%%%%%

rocp(actual',probability');
