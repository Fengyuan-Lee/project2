%Class 7:

value = calc_val(-5.55677);
disp(value);



function val = calc_val(x)
%...
choice = menu('Choose the right function', 'fix', 'floor', 'abs');
switch choice  
    case 1
        val = fix(x);
    case 2
        val = floor(x);
    case 3
        val = abs(x);
    otherwise
        val = 5*x;
end


end





