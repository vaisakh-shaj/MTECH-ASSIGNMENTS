% With Fast Computation of the RBF kernel matrix
% To speed up the computation, we exploit a decomposition of the Euclidean distance (norm)
%
% Inputs:
%       ker:    'lin','poly','rbf','sam'
%       X:      data matrix with training samples in rows and features in columns
%       X2:     data matrix with test samples in rows and features in columns
%       sigma: width of the RBF kernel
%       b:     bias in the linear and polinomial kernel
%       d:     degree in the polynomial kernel
%
% Output:
%       K: kernel matrix
%
% Modified Code of Gustavo Camps-Valls
% 2006(c)
% Jordi (jordi@uv.es), 2007
% 2007-11: if/then -> switch, and fixed RBF kernel

function K = kernelmatrix(ker,X,X2)
X=X';
X2=X2';
switch ker
    case 'lin'
        if exist('X2','var')
            K = X' * X2;
        else
            K = X' * X;
        end

    case 'poly'
%         b=input('enter the value of bias b in (<x1,x2> + b)^d'); 
%         d=input('enter the value of order d in (<x1,x2> + b)^d'); 
        b=0;
        d=1;
        if exist('X2','var')
            K = (X' * X2 + b).^d;
        else
            K = (X' * X + b).^d;
        end

    case 'rbf'
%         sigma=input('enter the value of sigma');
        sigma=1;
        n1sq = sum(X.^2,1);
        n1 = size(X,2);

        if isempty(X2);
            D = (ones(n1,1)*n1sq)' + ones(n1,1)*n1sq -2*X'*X;
        else
            n2sq = sum(X2.^2,1);
            n2 = size(X2,2);
            D = (ones(n2,1)*n1sq)' + ones(n1,1)*n2sq -2*X'*X2;
            
        end;
        K = exp(-D/(2*sigma^2));

    case 'sam'
        if exist('X2','var');
            D = X'*X2;
        else
            D = X'*X;
        end
        K = exp(-acos(D).^2/(2*sigma^2));

    otherwise
        error(['Unsupported kernel ' ker])
end
