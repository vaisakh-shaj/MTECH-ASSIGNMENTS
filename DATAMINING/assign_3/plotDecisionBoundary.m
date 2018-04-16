function plotDecisionBoundary(theta, X, y)
%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta
%   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the 
%   positive examples and o for the negative examples. X is assumed to be 
%   a either 
%   1) Mx3 matrix, where the first column is an all-ones column for the 
%      intercept.
%   2) MxN, N>3 matrix, where the first column is all-ones

% Plot Data
n=size(X,2);
plotData(X(:,2:n), y);
hold on

if size(X, 2) <= 3
    % Only need 2 points to define a line, so choose two endpoints
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];

    % Calculate the decision boundary line
    plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));

    % Plot, and adjust axes for better viewing
    plot(plot_x, plot_y,'g-','LineWidth',2)
    
    % Legend, specific for the exercise
    axis([30, 100, 30, 100])
else
  plot_x = [min(X(:,2))-2,  max(X(:,2))+2];
  plot_y = [min(X(:,3))-2,  max(X(:,3))+2];
  plot_z = (-1./theta(4)).*(theta(3).*plot_y + theta(2).*plot_x+theta(1))
  plot3(plot_x,plot_y,plot_z)
end
hold off

end
