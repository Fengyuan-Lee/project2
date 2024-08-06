% part a
A = [1 2 3; 4 5 6; 7 8 9]; % 3*3 matrix A
X = A;
X(:, [2 3]) = X(:, [3 2]) % interchange 2 and 3
X = [A, zeros(size(A, 1), 1)] % add fourth column (0s)
X = [A(1, :); ones(1, size(A, 2)); A(2:end, :)] %insert a row of is as the new second row of A
A = [1 2 3; 7 8 9] %remove the second column 

% part b
c = [12000, 15000, 18000, 24000, 35000, 50000, 70000]; %company 
e = [3000, 2500, 1500, 1000, 400, 100, 25]; %employee
n = c./e
