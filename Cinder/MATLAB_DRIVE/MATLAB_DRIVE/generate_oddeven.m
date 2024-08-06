function [evens, odds] = generate_oddeven()
    random_num = randi([50, 100], 1, 20);
   
    evens = random_num(mod(random_num, 2) == 0);
    odds = random_num(mod(random_num, 2) == 1);
end