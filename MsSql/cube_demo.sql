CREATE TABLE [dbo].[employee] (
    [id]         INT          NOT NULL,
    [name]       VARCHAR (50) NOT NULL,
    [gender]     VARCHAR (50) NOT NULL,
    [salary]     INT          NOT NULL,
    [department] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

-- 1	David	Male	5000	Sales
-- 2	Jim	Female	6000	HR
-- 3	Kate	Female	7500	IT
-- 4	Will	Male	6500	Marketing
-- 5	Shane	Female	5500	Finance
-- 6	Shed	Male	8000	Sales
-- 7	Vik	Male	7200	HR
-- 8	Vince	Female	6600	IT
-- 9	Jane	Female	5400	Marketing
-- 10	Laura	Female	6300	Finance
-- 11	Mac	Male	5700	Sales
-- 12	Pat	Male	7000	HR
-- 13	Julie	Female	7100	IT
-- 14	Elice	Female	6800	Marketing
-- 15	Wayne	Male	6800	Finance

SELECT * FROM employee;
-- With 2 columns
-- C1 -> C2
-- C1, C2
-- C1
-- C2
-- ()

-- With 3 Columns
-- C1 -> C2 -> C3
-- C1, C2, C3
-- C1, C3, C2
-- C1, C2,
-- C1, C3,
-- C2, C3
-- C3, C2
-- C1,
-- C2,
-- C3
-- ()
-- With single column Simple Group by, ROLLUP, CUBE behaves same except GROUP by cant give total sum

SELECT department, SUM(salary)
FROM employee
GROUP BY department;


SELECT department, SUM(salary)
FROM employee
GROUP BY CUBE(department);

-- With 2 columns in select
SELECT department,gender, SUM(salary)
FROM employee
GROUP BY department, gender;


SELECT department, gender, SUM(salary)
FROM employee
WHERE department = 'IT'
GROUP BY CUBE(department, gender);

-- With 3 columns
SELECT * FROM employee;

SELECT department,name, gender, SUM(salary)
FROM employee
GROUP BY department, name, gender;


SELECT department, name,gender, SUM(salary)
FROM employee
WHERE department = 'IT'
GROUP BY CUBE(department, name, gender);