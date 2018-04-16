function [theta, J_history,J,xx,yy,t] = gradientDescent(X, y, theta, alpha, num_iters)

m = length(y);% number of training examples
J_history = zeros(num_iters, 1); %a vector that stores the Cost function per iteration
n=size(X,2); %number of features +1

h=sigmoid(X*theta);
ThetaFold=[]; % variable to store the theta found in each fold
prompt='K value : '; %input the K value
	k=input(prompt);

set=cvpartition(m,'kfold',k); %m data into K folds using cvpartiton inbuilt function


for fold=1:k % training and testing using each fold data 
hTrain=h(training(set,fold));
Xtrain=X(training(set,fold),:);
Ytrain=y(training(set,fold));

for iter = 1:num_iters
del=[];
  
for j=1:n %you can vectorize futher and avoid this loop (here n= number of features+1) 

	del=[del;(alpha/m)*sum((hTrain-Ytrain).*Xtrain(:,j))];
	    

end

theta=theta-del;

  J_his(fold,iter) = costFunction(theta,Xtrain,Ytrain); %technique to store the  history of costs in all the iteration per fold
end
ThetaFold=[ThetaFold,theta]; %storing the theta found per fold(theta is a column vector
Xtest=X(test(set,fold),:)
Ytest=y(test(set,fold));
J(fold)=costFunction(theta,Xtest,Ytest); %storing cost found using test data per fold


end
figure;
plot(1:k, J(1:k), '-b', 'LineWidth', 2); %plotting cost per fold found using test data
xlabel('Kth Fold');
ylabel('Cost J');
[val,index]=min(J); %finding fold which gave minimum value for cost while testing
theta=ThetaFold(:,index); %storing corresponding theta and J-history per iterations
J_history=J_his(index,:);
end
