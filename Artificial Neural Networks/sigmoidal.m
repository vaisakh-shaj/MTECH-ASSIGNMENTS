function out =  sigmoidal(z)
ep = exp(-z);
out = (2/(1 + ep)) - 1;
end