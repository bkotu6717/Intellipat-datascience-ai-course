-- Find the highest salary
-- LIMIT 0 - Will skip 0 rows and brings next one record
SELECT DISTINCT(salary)
FROM employees
ORDER BY salary DESC
LIMIT 0, 1;

-- Find the second highest salary
-- LIMIT 1 - Will skip 1 rows and brings next one record
SELECT DISTINCT(salary)
FROM employees
ORDER BY salary DESC
LIMIT 1, 1;

-- Find the third highest salary
-- LIMIT 2 - Will skip 2 rows and brings next one record
SELECT DISTINCT(salary)
FROM employees
ORDER BY salary DESC
LIMIT 2, 1;

-- Find the 4th highest salary
-- LIMIT 3- Will skip 4 rows and brings next one record
SELECT DISTINCT(salary)
FROM employees
ORDER BY salary DESC
LIMIT 3, 1;
