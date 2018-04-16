function [matrix3] = findit(matrixold)
matrix3 = ones(7,5);
for i = 1 : 7
    for j = 1 : 5
        if matrixold(i,j) == -1
            matrix3(i,j) = 0;
        end
    end
end
end