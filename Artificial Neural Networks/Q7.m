A1 = [-1 -1 -1 1 -1 -1 -1 -1 -1 1 -1 1 -1 -1 -1 -1 1 -1 1 -1 -1 -1 1 1 -1 1 1 -1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1];
B1 = [0 0 0 1 0 0 0; 
0 0 1 0 1 0 0; 
0 0 1 0 1 0 0; 
0 1 1 0 1 1 0; 
1 1 1 1 1 1 1; 
1 1 1 1 1 1 1; 
1 1 0 0 0 1 1; 
1 1 0 0 0 1 1; 
1 1 0 0 0 1 1; 
1 1 0 0 0 1 1];

A2 = [1 1 1 1 1 1 -1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 1 1 1 1 -1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 1 1 1 1 -1];
B2 = [1 1 1 1 1 1 0;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 1 1 1 1 0;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 1 1 1 1 0];

A3 = [-1 1 1 1 1 1 -1 1 1 -1 -1 -1 -1 1 1 1 -1 -1 -1 -1 -1 1 1 -1 -1 -1 -1 -1 1 1 -1 -1 -1 -1 -1 1 1 -1 -1 -1 -1 -1 1 1 -1 -1 -1 -1 -1 1 1 -1 -1 -1 -1 -1 1 1 -1 -1 -1 -1 1 -1 1 1 1 1 1 -1];
B3 = [0 1 1 1 1 1 0;
 1 1 0 0 0 0 1;
 1 1 0 0 0 0 0;
 1 1 0 0 0 0 0;
 1 1 0 0 0 0 0;
 1 1 0 0 0 0 0;
 1 1 0 0 0 0 0;
 1 1 0 0 0 0 0;
 1 1 0 0 0 0 1;
 0 1 1 1 1 1 0];

A4 = [1 1 1 1 1 1 -1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 1 1 1 1 -1];
B4 = [1 1 1 1 1 1 0;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 0 0 0 1 1;
 1 1 1 1 1 1 0];


A5 = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -1 -1 -1 -1 -1 1 1 -1 -1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 1 1 -1 -1 -1 1 1 -1 -1 -1 -1 -1 1 1 -1 -1 -1 -1 -1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
B5 = [1 1 1 1 1 1 1;
 1 1 1 1 1 1 1;
 1 1 0 0 0 0 0;
 1 1 0 0 0 0 0;
 1 1 1 1 0 0 0;
 1 1 1 1 0 0 0;
 1 1 0 0 0 0 0;
 1 1 0 0 0 0 0;
 1 1 1 1 1 1 1;
 1 1 1 1 1 1 1];

M = A1'*A1 + A2'*A2 + A3'*A3 +A4'*A4 +A5'*A5;

Anew = A1*M;



for i = 1 : 70
    if Anew(1,i) > 0
        Anew(1,i) = 1;
    elseif Anew(1,i) < 0
        Anew(1,i) = -1;
    end
end

if Anew == A1
    disp('Its A')
    J = mat2gray(B1);
      %figure;
      imshow(J);
elseif Anew == A2
    disp('Its B')
    J = mat2gray(B2);
      %figure;
      imshow(J);
elseif Anew == A3
    disp('Its C')
    J = mat2gray(B3);
      %figure;
      imshow(J);
elseif Anew == A4
    disp('Its D')
    J = mat2gray(B4);
      %figure;
      imshow(J);
elseif Anew == A5
    disp('Its E')
    J = mat2gray(B5);
      %figure;
      imshow(J);
else
    disp('Not Yet')
end
