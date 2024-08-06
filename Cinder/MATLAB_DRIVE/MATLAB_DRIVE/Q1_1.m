% Generates a random 3x3 matrix
A = rand(3,3)

% a. Interchange columns 2 and 3
A = A(:,[1 3 2])

% b. Add a fourth column (of 0s)
A = [A, zeros(3,1)]

% c. Insert a row of 1s as the new second row of A (move the current second and third rows down)
A = [A(1,:); ones(1,4); A(2:3,:)]

% d. Remove the second column
A(:,2) = []

