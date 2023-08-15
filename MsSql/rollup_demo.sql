-- ROllup example
-- Rollup is extension of Group by, with one column in group by ROLLUP behaves same as group by except giving total value
-- C1->C2->C3
-- C1, C2, C3
-- C1, C2
-- C1
-- ()
CREATE TABLE [dbo].[employee] (
    [id]         INT          NOT NULL,
    [name]       VARCHAR (50) NOT NULL,
    [gender]     VARCHAR (50) NOT NULL,
    [salary]     INT          NOT NULL,
    [department] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

SELECT * FROM employee

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

SELECT * from employee;
-- Departmentwise salaries
SELECT department, SUM(salary) from employee
GROUP BY department;

-- Display department wise and also total salary of all departments
SELECT coalesce(department, 'all departments sum'), SUM(salary) as [Deptwise sum] from employee
GROUP BY ROLLUP(department);

-- Display department, gender wise total salary
SELECT department, gender, SUM(salary) from employee
GROUP BY department, gender;

-- Display department, gender wise total salary along with total salaries
SELECT department, gender, SUM(salary) from employee
GROUP BY ROLLUP(department, gender);


SELECT department, gender, SUM(salary) from employee
GROUP BY ROLLUP(department, gender)
ORDER BY department;

SELECT name, gender, department, SUM(salary) 
FROM employee
GROUP BY ROLLUP(name, gender, department);
