function ypred=svmPredict(model,K)
ypred=(sign((model.y.*model.alpha)'*K+model.b))';
end