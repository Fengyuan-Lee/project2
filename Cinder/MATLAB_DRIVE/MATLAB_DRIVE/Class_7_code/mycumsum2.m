function res = mycumsum2(vec)
    n = length(vec);
    res = zeros(1,n);
    res(1) = vec(1);
    for i = 2:n
        res(i) = res(i-1)+ vec(i);
    end
end
