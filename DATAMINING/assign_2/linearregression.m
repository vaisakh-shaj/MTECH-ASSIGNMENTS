clear ; close all; clc

fprintf('Loading data ...\n');
data = load('data.txt');
n=size(data,2);


% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[data mu sigma] = featureScale(data);
X = data(:, 1:n-1);
y = data(:, n);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

num_iters = 400;
ThetaFold=[];
prompt='K value : ';
	k=input(prompt);

set=cvpartition(m,'kfold',k);
c=1;
for alpha=.1:1:10
    alpha
for fold=1:k
    Xtrain= X(training(set,fold),:);
    Ytrain=y(training(set,fold));

    % Init Theta and Run Gradient Descent 
    theta = zeros(n, 1);
    [theta, J_history] = gradientDescentMulti(Xtrain, Ytrain, theta, alpha, num_iters);
    ThetaFold=[ThetaFold,theta];
    Xtest=X(test(set,fold),:);
    Ytest=y(test(set,fold),:);

    J(fold)=computeCostMulti(Xtest,Ytest,theta);
end
    meansquare(c)=mean(J);
    c=c+1
end
[val,index]=min(meansquare);
theta=ThetaFold(:,index);
display('best alpha');
display(index);
    

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');