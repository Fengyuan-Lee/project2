k = 0.45;
T_s = 38;
T_0 = 120;

t = 500;

T = T_s - ( T_0-T_s)*exp(-k*t);

disp(T);