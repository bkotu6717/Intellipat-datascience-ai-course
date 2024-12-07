
-- Find the highest salary
-- LIMIT 0 - Will skip 0 rows and brings next one record
SELECT DISTINCT(salary)
FROM employees
ORDER BY salary DESC
LIMIT 0, 1;

-- LIMIT 0,1 -> Offest 0 and Limit 1

-- Find the second highest salary
-- LIMIT 1 - Will skip 1 rows and brings next one record
SELECT DISTINCT(salary)
FROM employees
ORDER BY salary DESC
LIMIT 1, 1;
-- LIMIT 1,1 -> Offest 1 and Limit 1


-- Find the third highest salary
-- LIMIT 2 - Will skip 2 rows and brings next one record
SELECT DISTINCT(salary)
FROM employees
ORDER BY salary DESC
LIMIT 2, 1;
-- LIMIT 2,1 -> Offest 2 and Limit 1


-- Find the 4th highest salary
-- LIMIT 3- Will skip 4 rows and brings next one record
SELECT DISTINCT(salary)
FROM employees
ORDER BY salary DESC
LIMIT 3, 1;
-- LIMIT 2,1 -> Offest 3 and Limit 1

