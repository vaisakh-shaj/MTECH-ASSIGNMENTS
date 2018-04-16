function [matrix4] = finderfn(matrixnew,matrixold)
matrix4 =  zeros(7,5);
for i = 1 : 7
    for j = 1 : 5
        if matrixnew(i,j) > 0
            matrix4(i,j) = 1;
        elseif matrixnew(i,j) == 0
            matrix4(i,j) = matrixold(i,j);
        else
            matrix4(i,j) = -1;
        end
    end
end
end