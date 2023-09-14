CREATE TABLE EMPLOYEE (  
	 emp_id int identity,  
	 fullname varchar(65),  
	 occupation varchar(45),  
	 gender varchar(30),  
	 salary int,  
	 country varchar(55)  
	);
	GO

INSERT INTO EMPLOYEE(fullname, occupation, gender, salary, country)  
VALUES ('John Doe', 'Writer', 'Male', 62000, 'USA'),  
('Mary Greenspan', 'Freelancer', 'Female', 55000, 'India'),  
('Grace Smith', 'Scientist', 'Male', 85000, 'USA'),  
('Mike Johnson', 'Manager', 'Male', 250000, 'India'),  
('Todd Astel', 'Business Analyst', 'Male', 42000, 'India'),  
('Sara Jackson', 'Engineer', 'Female', 65000, 'UK'),  
('Nancy Jackson', 'Writer', 'Female', 55000, 'UK'),  
('Rose Dell', 'Engineer', 'Female', 58000, 'USA'),  
('Elizabeth Smith', 'HR', 'Female', 55000, 'UK'),  
('Peter Bush', 'Engineer', 'Male', 42000, 'USA');  


-- Displays with grand total 
SELECT 
    COALESCE(occupation, 'GRAND TOTAL') AS [occupation],
    SUM(salary)  as [Dept SUM]
FROM EMPLOYEE
GROUP BY ROLLUP(occupation)

-- Displays only each occupation total
SELECT 
    COALESCE(occupation, 'GRAND TOTAL') AS [occupation],
    SUM(salary)  as [Dept SUM]
FROM EMPLOYEE
GROUP BY (occupation)

-- Display salary by occupation and gender using rollup
SELECT 
    COALESCE(occupation, 'ALL OCCUPATION') AS [occupation],
    COALESCE(GENDER, 'ALL GENDER') AS [GENDER],
    SUM(salary)  as [Dept SUM]
FROM EMPLOYEE
GROUP BY ROLLUP(occupation, gender)
ORDER BY occupation

-- Display salary by occupation, gender and country using rollup

SELECT 
    COALESCE(occupation, 'ALL OCCUPATION') AS [occupation],
    COALESCE(GENDER, 'ALL GENDER') AS [GENDER],
    COALESCE(country, 'ALL COUNTRIES') AS [country],
    SUM(salary)  as [Dept SUM]
FROM EMPLOYEE
GROUP BY ROLLUP(occupation, gender,country)

-- (c1, c2)
-- (c1)
--()

SELECT gender, country, SUM(salary) AS "Total Salary",  
GROUPING(gender),    
GROUPING(country)  
FROM EMPLOYEE  
GROUP BY   
ROLLUP (gender, country);
-- CUBE(c1, c2, c3)

-- c1, c2, c3
-- c1, c2
-- c1, c3
-- c2, c3
-- c1
-- c2
-- c3
-- ()

SELECT 
    occupation,
    SUM(salary)
FROM EMPLOYEE
GROUP BY CUBE(occupation)
ORDER by occupation

SELECT 
    COALESCE(occupation, 'GRAND TOTAL') AS [occupation],
    SUM(salary)  as [Dept SUM]
FROM EMPLOYEE
GROUP BY ROLLUP(occupation)

SELECT 
   COALESCE(occupation, 'ALL OCCUPATION') AS [occupation],
    COALESCE(GENDER, 'ALL GENDER') AS [GENDER],
    COALESCE(country, 'ALL COUNTRIES') AS [country],
    SUM(salary)  as [SUM OF salaries]

FROM EMPLOYEE
GROUP BY CUBE(occupation, gender, country)

EXCEPT

SELECT 
   COALESCE(occupation, 'ALL OCCUPATION') AS [occupation],
    COALESCE(GENDER, 'ALL GENDER') AS [GENDER],
    COALESCE(country, 'ALL COUNTRIES') AS [country],
    SUM(salary)  as [SUM OF salaries]

FROM EMPLOYEE
GROUP BY ROLLUP(occupation, gender,country)

-- Rollup is a subset of cube

-- PIVOT

CREATE TABLE Grades(
  [Student] VARCHAR(50),
  [Subject] VARCHAR(50),
  [Marks]   INT
)
GO
 
INSERT INTO Grades VALUES 
('Jacob','Mathematics',100),
('Jacob','Science',95),
('Jacob','Geography',90),
('Amilee','Mathematics',90),
('Amilee','Science',90),
('Amilee','Geography',100)
GO

SELECT * FROM (
  SELECT
    [Student],
    [Subject],
    [Marks]
  FROM Grades
) StudentResults
PIVOT (
  SUM([Marks])
  FOR [Subject]
  IN (
    [Mathematics],
    [Science],
    [Geography]
  )
) AS PivotTable

-- SELECT PIVOT COLUMNS FROM
-- (
--     select columns from table
-- ) alias name
-- PIVOT
-- (
-- aggegate(column)
-- FOR (Spread the aggegate value on column)
-- IN (What are the columns to be displayed)
-- ) as alias name


SELECT Student, [Mathematics], [Science], [Geography] FROM(
    SELECT 
        Student, 
        [Subject], 
        Marks 
    from Grades
) x
PIVOT
(
    SUM(Marks)
    FOR [Subject]
    IN ([Mathematics], [Science], [Geography])
) y


CREATE TABLE pivot_demo    
(    
   Region varchar(45),    
   Year int,    
   Sales int    
)    
GO
INSERT INTO pivot_demo  
VALUES ('North', 2010, 72500),  
('South', 2010, 60500),  
('South', 2010, 52000),  
('North', 2011, 45000),  
('South', 2011, 82500),    
('North', 2011, 35600),  
('South', 2012, 32500),   
('North', 2010, 20500);

SELECT * FROM pivot_demo

-- Create the table and insert values as portrayed in the previous example.  
CREATE TABLE pvt (VendorID INT, Emp1 INT, Emp2 INT,  
    Emp3 INT, Emp4 INT, Emp5 INT);  
GO  
INSERT INTO pvt VALUES (1,4,3,5,4,4);  
INSERT INTO pvt VALUES (2,4,1,5,5,5);  
INSERT INTO pvt VALUES (3,4,3,5,4,4);  
INSERT INTO pvt VALUES (4,4,2,5,5,4);  
INSERT INTO pvt VALUES (5,5,1,5,5,5);  
GO  
-- Unpivot the table.  
SELECT VendorID, Employee, Orders  
FROM   
   (SELECT VendorID, Emp1, Emp2, Emp3, Emp4, Emp5  
   FROM pvt) p  
UNPIVOT  
   (Orders FOR Employee IN   
      (Emp1, Emp2, Emp3, Emp4, Emp5)  
)AS unpvt;  
GO 
-- RANK
	SELECT 
        *,
        RANK() OVER(ORDER by salary DESC) as [rank]
    FROM EMPLOYEE

    SELECT * from (
        SELECT 
            *,
            RANK() OVER(ORDER by salary DESC) as [rank]
        FROM EMPLOYEE
    ) y
    WHERE y.rank = 1
-- DENSE RANK
    SELECT * from (
        SELECT 
            *,
            DENSE_RANK() OVER(ORDER by salary DESC) as [rank]
        FROM EMPLOYEE
    ) y
    WHERE y.rank = 1
-- ROW NUMBER
     SELECT * from (
        SELECT 
            *,
            ROW_NUMBER() OVER(ORDER by salary desc, gender DESC) as [ROW_NUMBER]
        FROM EMPLOYEE
    ) y
-- OVER PARTITION
    SELECT * from (
        SELECT 
            *,
            RANK() OVER(Partition by occupation order by salary desc) as [rank]
        FROM EMPLOYEE
    ) y WHERE [rank] = 1
-- LEAD
    SELECT
        *,
        LEAD(salary) OVER(order by emp_id)
    FROM EMPLOYEE
-- LAG
SELECT
    *,
    LAG(salary) OVER(order by emp_id)
FROM EMPLOYEE

-- LEAD and LAG
SELECT
    *,
    LEAD(salary) OVER(order by emp_id) as [LEAD_SAL],
    LAG(salary) OVER(order by emp_id) as [LAG_SAL]
FROM EMPLOYEE

-- FIND EACH EMPLOYEE SALARY DIFFERENCE COMPARED TO PREVIOUS EMPLOYEE

SELECT 
    salary, 
    LEAD_SAL, 
    (salary - LEAD_SAL)  [SALARY DIFF], 
    ROUND(((salary - LEAD_SAL)/CAST(SALARY AS float))*100, 2) AS [PERCENTAGE_DIFF]
FROM (
    SELECT
        *,
        LEAD(salary) OVER(order by emp_id) as [LEAD_SAL]
    FROM EMPLOYEE
) X


-- DISPLAY CUMULATIVE SALARIES
SELECT *
FROM (
    SELECT
        *,
        SUM(salary) OVER(order by emp_id) as [CUM_SALARY]
    FROM EMPLOYEE
) X

-- DISPLAY AVG SALARY AND EACH EMPLOYEE SALARY DIFFERENCE WITH AVG SALARY


SELECT
    *,
    AVG(salary) OVER(ORDER BY emp_id) AS [AVG_SALARY]
FROM
EMPLOYEE

SELECT salary, AVG_SALARY, (salary-AVG_SALARY) AS [DIFF_WITH_AVG_SALARY] FROM(
    SELECT
        *,
        AVG(salary) OVER() AS [AVG_SALARY]
    FROM
    EMPLOYEE
) X

-- TRANSACTION
    BEGIN TRANSACTION
        SELECT * FROM EMPLOYEE WHERE emp_id = 1
        UPDATE EMPLOYEE SET salary = 162000 WHERE emp_id = 1
        SELECT * FROM EMPLOYEE WHERE emp_id = 1
    ROLLBACK
    COMMIT

-- TRY CATCH
    BEGIN TRY
        SELECT 1/0
    END TRY  
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
    END CATCH 

-- Remove duplicate records

INSERT into EMPLOYEE values('John Doe', 'Writer', 'Male', 155000,'USA')
INSERT into EMPLOYEE values('Mary Greenspan',	'Freelancer',	'Female',	55000,	'India')
INSERT into EMPLOYEE values('Grace Smith',	'Scientist',	'Male',	85000,	'USA')


with cte as
(
    SELECT 
        *,
        ROW_NUMBER() OVER(partition by fullname,occupation, gender, salary, country order by fullname desc) as row_num
    FROM EMPLOYEE
) delete from cte where row_num > 1

select * from sales.staffs;
-- Find the employee name repsective manager name

SELECT 
    e.staff_id,
    e.first_name as [emp], 
    (COALESCE(m.first_name, 'TOP LEVEL MANAGER')) as [manager]
FROM sales.staffs e
LEFT JOIN sales.staffs m ON e.manager_id = m.staff_id
WHERE m.staff_id = 1

-- Find managers who are having at least 2 reporting employees
select * FROM sales.staffs WHERE staff_id IN
(
    SELECT 
    m.staff_id

FROM sales.staffs e
LEFT JOIN sales.staffs m ON e.manager_id = m.staff_id
GROUP BY m.staff_id
having COUNT(*) > 1
)


-- Find the employee hierarchy
-- Recursive CTE will not initialze the base condition multiple times even it is called again and again
-- It just works like a STATIC key word in C language

WITH subordinate AS (
    SELECT  staff_id,
            first_name,
            last_name,
            manager_id,
            0 AS level
    FROM sales.staffs
    WHERE staff_id = 1
 
    UNION ALL
 
    SELECT  e.staff_id,
            e.first_name,
            e.last_name,
            e.manager_id,
            level + 1
    FROM sales.staffs e
JOIN subordinate s
ON e.manager_id = s.staff_id
) 
SELECT 
s.staff_id,
    s.first_name AS subordinate_first_name,
    s.last_name AS subordinate_last_name,
    m.staff_id AS direct_superior_id,
    m.first_name AS direct_superior_first_name,
    m.last_name AS direct_superior_last_name,
    s.level
FROM subordinate s
JOIN sales.staffs m
ON s.manager_id = m.staff_id
ORDER BY level;

SELECT * from sales.staffs

-- Recursive CTE will not initialze the base condition multiple times even it is called again and again
-- It just works like a STATIC key word in C language
with num_counter AS
(
SELECT
    1 as n
UNION ALL
SELECT n + 1
from num_counter
WHERE n < 10
)
select * from num_counter

with factorial as
(
    SELECT 0 as n, 1 as fact
    UNION ALL
    SELECT n + 1, fact*(n+1)
    FROM factorial
    WHERE n < 4
)

select * from factorial


with recursive_sum as
(
    select 0 as n, 0 as sum
    UNION ALL
    SELECT n+1, (n+1)+sum as [sum] FROM recursive_sum
    where n < 10
)
select * FROM recursive_sum

with fibonacci_series as
(
    select 0 as x, 1 as y
    UNION ALL
    SELECT y, (x+y) FROM fibonacci_series
    where (x+y) < 100
)
select * FROM fibonacci_series

with recursive_division as
(
    select 26 as n
    UNION ALL
    SELECT n/2 FROM recursive_division
    where (n/2) != 0 
)
select * from recursive_division

