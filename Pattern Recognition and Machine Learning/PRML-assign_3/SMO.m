function [model] = SMO(K,Xt, yt, lambda, tol, max_iter)
%SMO Trains an SVM classifier the SMO algorithm. 
%    X is the matrix of training examples.  Each row is a training example, and the jth column holds the 
%   jth feature.  
%    Y is a column matrix containing 1 for positive examples and 0 for negative examples.  
%    C is the standard SVM regularization parameter.  
%    tol is a tolerance value 
%    max_passes controls the number of iterations over the dataset (without changes to alpha) before the algorithm quits.
%
%
%

if ~exist('tol', 'var') || isempty(tol)
    tol = 1e-3;
end

if ~exist('max_iter', 'var') || isempty(max_iter)
    max_iter = 5;
end

% Data parameters
m = size(Xt, 1);
n = size(Xt, 2);

% Map 0 to -1
yt(yt==0) = -1;

% Variables
alpha = zeros(m, 1);
b = 0;
E = zeros(m, 1);
iter = 0;
eta = 0;
L = 0;
H = 0;


% Train
fprintf('\nTraining ...');
dots = 12;
 J=zeros(max_iter+1);
while iter < max_iter,
            
    num_changed_alphas = 0;
    for i = 1:m,
        
        % Calculate Ei = f(x(i)) - y(i)  
        % E(i) = b + sum (X(i, :) * (repmat(alphas.*Y,1,n).*X)') - Y(i);
        E(i) = b + sum (alpha.*yt.*K(:,i)) - yt(i);
        
        if ((yt(i)*E(i) < -tol && alpha(i) < lambda) || (yt(i)*E(i) > tol && alpha(i) > 0)),
            
            %  In this simplified code, we select aplha1 and alpha2 randomly.
            j = ceil(m * rand());
            while j == i,  % Make sure i \neq j
                j = ceil(m * rand());
            end

            % Calculate Ej = f(x(j)) - y(j) using (2).
            E(j) = b + sum (alpha.*yt.*K(:,j)) - yt(j);

            % Save old alphas
            alpha_i_old = alpha(i);
            alpha_j_old = alpha(j);
            
            % Compute L and H . 
            if (yt(i) == yt(j)),
                L = max(0, alpha(j) + alpha(i) - lambda);
                H = min(lambda, alpha(j) + alpha(i));
            else
                L = max(0, alpha(j) - alpha(i));
                H = min(lambda, lambda + alpha(j) - alpha(i));
            end
           
            if (L == H),
                % continue to next i. 
                continue;
            end

            % Compute eta by (14).
            eta = 2 * K(i,j) - K(i,i) - K(j,j);
            if (eta >= 0),
                % continue to next i. 
                continue;
            end
            
            % Compute and clip new value for alpha j using (12) and (15).
            alpha(j) = alpha(j) - (yt(j) * (E(i) - E(j))) / eta;
            
            % Clip
            alpha(j) = min (H, alpha(j));
            alpha(j) = max (L, alpha(j));
            
            % Check if change in alpha is significant
            if (abs(alpha(j) - alpha_j_old) < tol),
                % continue to next i. 
                % replace anyway
                alpha(j) = alpha_j_old;
                continue;
            end
            
            % Determine value for alpha i using (16). 
            alpha(i) = alpha(i) + yt(i)*yt(j)*(alpha_j_old - alpha(j));
            
            % Compute b1 and b2 using (17) and (18) . 
            b1 = b - E(i) ...
                 - yt(i) * (alpha(i) - alpha_i_old) *  K(i,j)' ...
                 - yt(j) * (alpha(j) - alpha_j_old) *  K(i,j)';
            b2 = b - E(j) ...
                 - yt(i) * (alpha(i) - alpha_i_old) *  K(i,j)' ...
                 - yt(j) * (alpha(j) - alpha_j_old) *  K(j,j)';

            % Compute b . 
            if (0 < alpha(i) && alpha(i) < lambda),
                b = b1;
            elseif (0 < alpha(j) && alpha(j) < lambda),
                b = b2;
            else
                b = (b1+b2)/2;
            end
            
             num_changed_alphas = num_changed_alphas + 1;

        end
        
    end
    
    if (num_changed_alphas == 0),
        iter = iter + 1;
    else
        iter = 0;
    end
  c=zeros(m);
%     J(iter+1)=(-.5)*((alpha.*yt)'*Xt)*((alpha.*yt)'*Xt)'+sum(alpha)
    for i=1:m
        for j=1:m
                 c(i)=c(i)+alpha(i)*alpha(j)*yt(i)*yt(j)*(Xt(i,:)*Xt(j,:)');
        end
        J(iter+1)=J(iter+1)+alpha(i)-(.5)*c(i);
    end
end
plot(1:size(J,1), J, '-b');
idx = alpha > 0;
model.X= Xt(idx,:);
model.y= yt(idx);
model.kernel = K;
model.b= b;
model.alpha= alpha(idx);
% model.w = ((alpha.*Y)'*X)';

end