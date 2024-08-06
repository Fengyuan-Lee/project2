function tr = Trace(A)
A = [1 2 3; 4 5 6; 7 8 9];
% Check if A is a square matrix
if size(A,1) ~= size(A,2)
    error('Input matrix must be square');
end
% Calculate the trace of A 
tr = sum(diag(A));
end