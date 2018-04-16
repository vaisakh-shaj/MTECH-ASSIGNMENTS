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


pos=find(y==1);neg=find(y==-1);
plot3(X(pos,1),X(pos,2),X(pos,3),'b+');
plot3(X(neg,1),X(neg,2),X(neg,3),'ro');
hold on;

[X,Y] = meshgrid(-2:.2:2, -2:.2:2);
Z=-.0075.*ones(21,21)
size([X Y])
surf(X,Y,Z)







% =========================================================================



hold off;

end
