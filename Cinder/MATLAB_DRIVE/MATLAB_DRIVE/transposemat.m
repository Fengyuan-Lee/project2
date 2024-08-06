function result = transposemat(x)
x = [1 2 3; 4 5 6];
% Returns the transpose of the input matrix

% Determine size of the matrix
[m, n] = size(x);

result = zeros(n, m);

% Loop over the rows and transpose
for i = 1:m
    for j = 1:n
        result(j, i) = x(i, j);
    end
end
end