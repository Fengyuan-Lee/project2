%2.1
a=[1 2 3;4 5 6];
b=def3(a)

%2.2
n=10;k=20;
y=def4(n,k)
n=13;k=10;
y=def4(n,k)
n=13;k=20;
y=def4(n,k)


function y=def3(x)
[m,n]=size(x);   %Find the number of rows and columns of the matrix
for i=1:1:m
    y(:,i)=x(i,:); %Matrix transposition
end
end


function y=def4(n,k)
if ((n<=k) && mod(n,2))
    y=1;
else
    y=0;
end
end