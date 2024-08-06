function val = clac_val(x)
x = -5.55677;
choice = menu('choose the right function', 'fix', 'floor', 'abs');
switch choice 
    case 1
        val = fix(x);
    case 2
        val = floor(x);
    case 3
        val = abs(x);
    otherwise
end