function res = mycumsum(vec)
    n = length(vec);
    res = zeros(1,n);  
    cum_sum = 0;
    for i = 1:n
        cum_sum = cum_sum + vec(i);
        res(i) = cum_sum;
    end
end
