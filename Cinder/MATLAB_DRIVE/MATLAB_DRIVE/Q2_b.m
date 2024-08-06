vowel_count = 0;
user_input = ' ';

while user_input ~= 'q'
    user_input = input('Enter a character: ', 's');
    if any(user_input == ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'])
        vowel_count = vowel_count + 1;
    end
end

fprintf('Total number of vowels entered: %d\n', vowel_count);