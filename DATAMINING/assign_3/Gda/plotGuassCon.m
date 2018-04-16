function plotCon(x,y,mu,sigma,C)
[X Y] = meshgrid(x,y); %// all combinations of x, y
Z = mvnpdf([X(:) Y(:)],mu,sigma); %// compute Gaussian pdf
Z = reshape(Z,size(X)); %// put into same size as X, Y
contour(X,Y,Z), axis equal  %// contour plot; set same scale for x and y...
end