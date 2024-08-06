function [total_reward, game_history] = blackjack()
total_reward = 0;
game_history = [0];
a = 0;
while true
    choice = input('HIT or STAY? ', 's');
    if strcmp(choice, 'HIT')
        reward = randi(10);
        a = a+reward;
        game_history(end+1) = a;
        fprintf('You got %d points from HIT\n', reward);
    elseif strcmp(choice, 'STAY')
        total_reward = a;
        game_history(end+1) = a;
        fprintf('You stay with %d points\n', a);
        break; 
        else
        fprintf('Invalid choice, please enter HIT or STAY\n');
        continue; 
    end
    if a > 21
        total_reward = -5;
        game_history(end) = -5;
        fprintf('You break with %d points\n', a);
        break;
    end
end
