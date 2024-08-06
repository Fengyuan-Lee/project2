function y=def2(x)
[m,n]=size(x);   %Find the number of rows and columns of the matrix
if (m~=n)
    disp('The input is not a square matrix, please re-enter')
else
    y=0;
    for i=1:1:m
        y=y+x(i,i);   %find trace
    end
end