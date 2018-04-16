function [X_norm, mu, sigma] = featureScale(X)
%FEATURESCALE Normalizes the features in X 
%   FEATURESCALE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

X_norm = X
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));       

mu=mean(X);
sigma=std(X);

X_norm=bsxfun(@rdivide,bsxfun(@minus,X,mu ),sigma);







% ============================================================

end
