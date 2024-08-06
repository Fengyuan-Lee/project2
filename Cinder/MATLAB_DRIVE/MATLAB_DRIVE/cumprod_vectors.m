function y = cumprod_vectors(x)
    x = [4 3 2 6];
    y = zeros(size(x));
    y(1) = x(1);
    for i = 2:length(x)
        y(i) = y(i-1) * x(i);
    end
end


