function y=def1(x)
n=length(x);   %Find the length of input vector
y(1)=x(1);     %Calculate the first value of the output vector
for i=2:1:n
    y(i)=y(i-1)*x(i);  %accumulative multiplication
end
end