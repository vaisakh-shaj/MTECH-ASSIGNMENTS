function alpha=svmReg(K,yt,epsi)

cc=prompt('enter the method to find w 1: direct method 2: gradient descent');
switch cc
    case 1
        alpha=inv(K)*(yt-epsi);
    case 2
        
end
end
