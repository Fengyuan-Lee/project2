function res = my_cumsum(vec)
n = length(vec);
res = zero(1, n);
rum_sum = 0;
for i = 1:n
    rum_sum = run_sum+vec(i);
    res(i) = rum_sum;
end
end

