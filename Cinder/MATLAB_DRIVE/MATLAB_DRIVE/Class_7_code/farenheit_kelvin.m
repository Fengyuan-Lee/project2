deg_c = input('Enter the temp in degrees C:');
choice = input('Do you want K or F?','s');
if choice=='K'
    deg_ = deg_c+273.15;
else
    deg_= (9/5)*deg_c+32;
end
fprintf('The temp in degrees %s is %.1f',choice, deg_);
