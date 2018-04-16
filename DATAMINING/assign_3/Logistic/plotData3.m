function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

pos=find(y==1);
neg=find(y==0);
scatter3(X(pos,1),X(pos,2),X(pos,3),15,[0 1 1],'x'); %'r+','LineWidth',2,'MarkerSize',10);
scatter3(X(neg,1),X(neg,2),X(neg,3),15,[0 0 1],'x'); %'bo','LineWidth',2,'MarkerSize',10);






% =========================================================================



hold off;

end
