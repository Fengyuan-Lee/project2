val = input('Enter a val: ');

switch val
    case 5 < val < 7
        disp('ok(val)')
    case val < 9
        disp('xx(val)') 
    case 3 < val
        disp('yy(val)')
    case 3 == val
        disp('tt(val)')
    otherwise
        disp('mid(val)')
end