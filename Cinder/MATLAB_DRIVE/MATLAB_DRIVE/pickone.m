function element = pickone(inputvector);
inputvector = input('what is ur input vector?: ')
leng = length(inputvector);
rand = randi([1:leng]);
element = inputvector(rand)
end
