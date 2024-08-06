m = randi(100, 2, 3)
[a, b, c, d] = corners(m)
function [a, b, c, d] = corners(x)
a = x(1,1); %top left
b = x(1,end); %top right
c = x(end,1); %bottom left
d = x(end,end); %bottom right
end