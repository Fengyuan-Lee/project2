salaries = [12000, 15000, 18000, 24000, 35000, 50000, 70000];
employees = [3000, 2500, 1500, 1000, 400, 100, 25];

% a. The average salary
average_salary = mean(salaries)

% b. The number of employees above and below this average salary level
above_avg = sum(employees(salaries > average_salary))
below_avg = sum(employees(salaries < average_salary))


% c. The average level salary earned by an individual in the company
total_level_salary = sum(salaries .* employees)
total_employees = sum(employees)
average_individual_salary = total_salary / total_employees