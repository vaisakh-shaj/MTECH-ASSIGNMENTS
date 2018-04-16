 clc

clear all

4. close all

5. matrix=importdata('nimai.txt');

6. [m,n]=size(matrix);

7. set=ones(m,1); %setting up the bias

8. matrix=[set matrix]; %appending the 1st columns as ones to set the bias

9. matrix=scaling(matrix); %callig the scaling function

10. [m,n]=size(matrix);

11. X=matrix(:,1:n-1);

12. Y=matrix(:,n);

13. c= cvpartition(Y,'Holdout',0.3); %cvpartioning command using the hold out theory

14. x= X(training(c,1),:);

15. y= Y(training(c,1),1);

16. u= X(test(c,1),:);

17. v= Y(test(c,1),1);

18. [m,n]=size(x);

19. [a,b]=size(u);

20. epsilon = 0.001; %assuming the value of epsilon

21. W= zeros(n,1);

22. wnew= zeros(n,1);

23. Fx= zeros(m,1);

24. sum(1:n)=0;

25. alpha=0.00001; %setting up this value of alpha arbitrarily 

26. itr=100; %number of iterations used

27. itr1=zeros(itr,1); %coping the iterations into a matrix

28. Jw= 0.0;

29. Jw1=zeros(itr,1); %setting up a Jw matrix for the plotting purpose

30. d=1;

31. m1=zeros(1,5000);

33. for itr = 1:30 %main iteration for the computation of W

34. for i = 1:m

35. Fx(i)= (x(i,:)*W); %finding the F(x) which is the summation of product of W and X

36. end

37. wnew=W;

38. for j=1:n

39. for i = 1:m

40. sum(j) = sum(j) + (y(i)-Fx(i))*x(i,j); %Finding the DeltaJ=Sum

41. end

42. W(j)= W(j) + alpha*sum(j); %finding the next iterative value of W

43. end

44. Jw=0;

45. for i= 1:m

46. %display (i);

47. Jw= Jw +(Fx(i)-Y(i))^2; %this is the error analysis

48. end 

49. display (Jw);

50. m1(1,d)=Jw;

51. d=d+1;

52. 

53. 

54. end

56. disp('The following is the values of W:\n')

57. disp(W)

59. %starting the program for the testing data sets for the prediction of

60. %output

62. Er= zeros(a:1);

65. plot(0:29, m1(1:30), '-'); %plotting the curve

68. for itr = 1: 30

69. for i = 1:a

70. Fx(i)= Fx(i) + u(i,:)*W;

71. end

72. 

73. for i = 1: a

74. Er(i) = Fx(i) - v(i);

75. end

76. for i= 1:a

77. Jw= Jw +(Fx(i)-v(i))^2; %this is the error analysis

78. end 

79. Jw1(itr)=Jw; 

80. 

81. end

83. disp('Displaying the Error vector or the difference of predicted output(Fx) and Yi:')

84. disp(Er)

85. disp('Displaying the error calculated')

86. disp(Jw1)