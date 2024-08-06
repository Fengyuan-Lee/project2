%1.1
x=[4 3 2 6];
y=def1(x)

%1.2
x=[1 2 3;4 5 6;7 8 9];
tra=def2(x)



function y=def1(x)
n=length(x);   %Find the length of input vector
y(1)=x(1);     %Calculate the first value of the output vector
for i=2:1:n
    y(i)=y(i-1)*x(i);  %accumulative multiplication
end
end


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
end