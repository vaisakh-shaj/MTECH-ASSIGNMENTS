
%%%%%%%% FUNCTION TO PLOT ROC CURVE %%%%%%%%%

%%%%%%%% Input arguments= actual output values of the test data set & their
%%%%%%%% predicted probabilities
%%%%%%%% Output arguments = none

function [ ] = rocp( probY,Ytest )

mat=[probY Ytest];
%display(mat);
mat= sortrows(mat,1);  % sorting in ascending order
%display(mat);

plotroc (mat(:,2)', mat(:,1)');
end

