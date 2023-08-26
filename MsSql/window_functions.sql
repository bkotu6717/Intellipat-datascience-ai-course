

SELECT * FROM employee
-- Rank function - assigns rank each row, if 2 or more having same value then it will assign same rank but the next rank will not be serial
-- Dense rank function assigns rank each row, if 2 or more having same value then it will assign same rank and the next rank will be serial
-- Row number function - assigns row numebr based on given column. ignores duplicates and serially assigns row nuubers
SELECT 
    *,
    RANK() OVER(order by salary DESC) as Ranks,
    DENSE_RANK() OVER(order by salary DESC) as Dense_Ranks,
    ROW_NUMBER() OVER(ORDER by salary DESC) as [ROW_NUMBER]
FROM employee

-- Partition by (Breaks the set into multiple group by and assigns rank grouped by department)
SELECT 
    *,
    RANK() OVER(Partition BY department order by salary desc) as Ranks
FROM employee

-- Find highest salary with other details in each department
WITH EACHDEPARTMENTHIGHESTSALARY AS
(
    SELECT 
        *,
        RANK() OVER(Partition BY department order by salary desc) as Ranks
    FROM employee
)
SELECT * FROM EACHDEPARTMENTHIGHESTSALARY WHERE Ranks = 1

-- Find and max salaries in single query
SELECT MAX(salary), MIN(salary) FROM employee

-- Multiple CTEs
WITH maxi_salary as(
    SELECT MAX(salary) as [max_sal] FROM employee
),
mini_salary as(
    SELECT MIN(salary) as [min_sal] FROM employee
)
SELECT [min_sal], [max_sal] FROM mini_salary, maxi_salary

-- TOP limits number of records to be displayed
SELECT TOP 1 * FROM employee
SELECT TOP 2 * FROM employee order by salary

-- With clause creates CTE(Common table expression)

WITH NthSal as -- Creates CTE with name NthSal
(
    SELECT 
        *,
        RANK() OVER (order by salary desc) as Ranks
    from employee
)
SELECT * from NthSal WHERE Ranks = 2 -- Now we can perform select operations on NthSal CTE

-- Remove duplicate rows with ROW_NUMBER function

SELECT * from employee
INSERT into employee(id,name, gender, salary, department) VALUES(1, 'David', 'Male', 5000, 'Sales')
INSERT into employee(id,name, gender, salary, department) VALUES(2, 'Jim', 'Female', 6000, 'HR')
INSERT into employee(id,name, gender, salary, department) VALUES(1, 'Kate', 'Female', 7500, 'IT')

WITH dupicate_records_cte as
(
    SELECT 
        *, 
        ROW_NUMBER() OVER( partition by id order by id asc) as row_numbers
    FROM employee
)
delete from dupicate_records_cte WHERE row_numbers > 1

-- Delete duplicate records using rank and dense rank
INSERT into employee(id,name, gender, salary, department) VALUES(1, 'David', 'Male', 5000, 'Sales')
INSERT into employee(id,name, gender, salary, department) VALUES(2, 'Jim', 'Female', 6000, 'HR')
INSERT into employee(id,name, gender, salary, department) VALUES(1, 'Kate', 'Female', 7500, 'IT')

-- NOT possible to delete using RANK() AND DENSE_RANK() SINCE THEY GENERATE DUPLICATE RANK VALUES
select * from employee
WITH dupicate_records_cte as
(
    SELECT 
        *, 
        DENSE_RANK() OVER( partition by id order by id asc) as row_numbers
    FROM employee
)
delete from dupicate_records_cte WHERE row_numbers > 1
-- Lead and Lag functions

SELECT 
    *,
    LEAD(salary) OVER( order by id desc) lead_salary
FROM employee

SELECT 
    *,
    LAG(salary) OVER( order by id desc) lead_salary
FROM employee

SELECT 
    *,
    LEAD(salary) OVER( order by id desc) lead_salary,
    LAG(salary) OVER( order by id desc) lag_salary
FROM employee

-- Accumulative Sum

With AccumulativeSum  as
(
    SELECT 
        *, 
        SUM(salary) OVER(order by id asc) AccSum
    FROM employee
)
select * FROM AccumulativeSum

-- Get averge salary in each department

SELECT 
    department, 
    AVG(salary) as avg_salary
FROM employee
GROUP BY department;

SELECT
    *,
    AVG(salary) OVER(Partition by department ORDER by id asc) avg_salary
FROM employee

-- 

WITH cte AS
(
    SELECT 
        *,
        LEAD(salary) OVER (order by id asc) as pre_emp_salary
    FROM employee
)
SELECT *, (pre_emp_salary-salary) as diff  from cte

