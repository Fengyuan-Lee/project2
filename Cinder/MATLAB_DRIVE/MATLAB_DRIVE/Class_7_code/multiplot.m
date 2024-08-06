x= 1:13;
y = [6:18; -10:2; -5:7; 5:-1:-7];
%disp(x)
%disp(y)
for i = 1:4
    subplot(2,2,i)
    % create plot i
    plot(x,y(i,:))

end 