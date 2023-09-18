
CREATE DATABASE May27Session
use May27Session

CREATE TABLE LOCATION(
    id INTEGER PRIMARY KEY,
    city VARCHAR(30)
)

insert into [LOCATION] VALUES
(122, 'NewYork'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston')

SELECT * from [LOCATION];


CREATE TABLE department(
    id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    location_id INTEGER REFERENCES LOCATION(id)
)


INSERT INTO department VALUES
(10, 'Accounting', 122),
(20, 'Sales', 123),
(30, 'Research', 124),
(40, 'Operations', 167)

select * from department;

CREATE TABLE job(
    id INTEGER PRIMARY KEY,
    designation VARCHAR(100)
)

insert into job VALUES
(667,'Clerk'),
(668,'Staff'),
(669,'Analyst'),
(670,'SalesPerson'),
(671,'Manager'),
(672,'Specialist');

SELECT * FROM job;

drop table employee;
CREATE TABLE EMPLOYEE(
    EMPLOYEE_ID INT, LAST_NAME VARCHAR(50), 
    FIRST_NAME VARCHAR(50), 
    MIDDLE_NAME VARCHAR(50),
    EMPJOB_ID INT FOREIGN KEY REFERENCES JOB(id), 
    MANAGER_ID INT, 
    HIRE_DATE DATE, 
    SALARY INT, 
    COMM INT,
    EMP_DEPARTMENT_ID INT FOREIGN KEY REFERENCES DEPARTMENT(id)
)

INSERT INTO EMPLOYEE VALUES
(7369, 'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499, 'ALLEN','KEVIN','J',670,7698,'20-FEB-85',1600,300,30),
(7505, 'DOYLE','JEAN','K',671,7839,'4-APR-85',2850,NULL,30),
(7506, 'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507, 'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521, 'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30);

update EMPLOYEE set FIRST_NAME = LAST_NAME, LAST_NAME = FIRST_NAME

-- Simple queries

-- Q1: list all the employee details
    SELECT * from EMPLOYEE;

-- Q2: list all the jobs details
    SELECT * from job;

-- Q3: List allt he departments
    SELECT * from department;

-- Q4: List all the locations
    SELECT * from [LOCATION];

-- Q5: List out the first name, last name, salary, commission for all the employees
    SELECT FIRST_NAME, LAST_NAME, SALARY, COMM FROM EMPLOYEE;

-- Q6: List out employee first name, last name, department id for all employees and alias the employee department id
    SELECT EMPLOYEE_id as [ID of employee] from EMPLOYEE;

-- Q7: List all the employees names with anual salary
    SELECT first_name, last_name, salary*12 as [Anual salary] from EMPLOYEE;

-- Q8: List all the employees names with anual salary order by salary
    SELECT first_name, last_name, salary*12 as [Anual salary] from EMPLOYEE order by  SALARY desc;

-- Where condition queries
-- Q1: List the details about smith
    SELECT * from EMPLOYEE where FIRST_NAME = 'smith' or LAST_NAME = 'smith'  or MIDDLE_NAME = 'smith';
    SELECT * from EMPLOYEE WHERE 'smith' IN (FIRST_NAME, LAST_NAME, MIDDLE_NAME);

-- Q2: List out the employees who are working in department 20
    SELECT * from EMPLOYEE WHERE EMP_DEPARTMENT_ID = 20

-- Q3: List out the employees who are earning between 2500 and 5000
    SELECT * from EMPLOYEE where SALARY BETWEEN 2500 and 5000;

-- Q4: List out the employees who are working in department 10 or 20
    SELECT * FROM EMPLOYEE WHERE EMP_DEPARTMENT_ID IN (10,20)

-- Q5: List out the empployees who are not working in department 10 or 20
    SELECT * FROM EMPLOYEE WHERE EMP_DEPARTMENT_ID NOT IN (10,20)

-- Q6: LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.
    SELECT * FROM EMPLOYEE where FIRST_NAME LIKE 's%' OR LAST_NAME like 's%' OR MIDDLE_NAME like '%s';

-- Q7: LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'.
    SELECT * FROM EMPLOYEE where FIRST_NAME LIKE 'j%n'

-- Q8: LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'.
    SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'j%' and LEN(FIRST_NAME)=4

-- Q9: LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE SALARIES MORE THAN 3500.
    SELECT * FROM  EMPLOYEE WHERE EMP_DEPARTMENT_ID = 10 and SALARY > 2000;

-- Q10: LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.
    SELECT * FROM  EMPLOYEE WHERE COMM IS NULL;

    SELECT * FROM  EMPLOYEE WHERE COMM IN (NULL, 0);

-- Order by clause
-- 1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.
    SELECT EMPLOYEE_ID, LAST_NAME from EMPLOYEE ORDER by EMPLOYEE_ID;

-- 2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.
    SELECT EMPLOYEE_ID, LAST_NAME from EMPLOYEE ORDER by LAST_NAME desc, SALARY DESC;

-- 3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER
    SELECT * from EMPLOYEE ORDER by LAST_NAME;

-- 4. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND THEN ON DEPARTMENT_ID IN DESCENDING ORDER.
    SELECT * FROM EMPLOYEE ORDER BY LAST_NAME ASC, EMP_DEPARTMENT_ID DESC;


-- GROUP BY & HAVING CLAUSE
-- 1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.
    SELECT EMP_DEPARTMENT_ID, COUNT(*) as "Total employees" FROM EMPLOYEE GROUP BY EMP_DEPARTMENT_ID;
    
-- 2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF THE EMPLOYEES.
    SELECT EMP_DEPARTMENT_ID, MAX(SALARY) as MAX_SALARY, MIN(SALARY) as MIN_SALARY, AVG(SALARY) as AVG_SALARY FROM EMPLOYEE GROUP BY EMP_DEPARTMENT_ID;


-- 3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE EMPLOYEES.
    SELECT EMPJOB_ID, MAX(SALARY) as MAX_SALARY, MIN(SALARY) as MIN_SALARY, AVG(SALARY) as AVG_SALARY FROM EMPLOYEE GROUP BY EMPJOB_ID;


-- 4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER.
    SELECT MONTH(HIRE_DATE) as JOINING_MONTH, COUNT(*) as [TOTAL EMPLOYEES] FROM EMPLOYEE GROUP BY MONTH(HIRE_DATE) ORDER BY COUNT(*);

-- 5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING ORDER BASED ON THE YEAR, MONTH.
    SELECT FORMAT(HIRE_DATE, 'MMMM, yyyy') , COUNT(*) AS TOTAL_EMPLOYEES FROM  EMPLOYEE GROUP BY FORMAT(HIRE_DATE, 'MMMM, yyyy') ORDER BY COUNT(*);

-- 6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.
    SELECT EMP_DEPARTMENT_ID, COUNT(*) FROM EMPLOYEE GROUP BY EMP_DEPARTMENT_ID HAVING COUNT(EMP_DEPARTMENT_ID) >= 4;

-- 7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH.
    SELECT COUNT(*) as [TOTAL EMPLOYESS] FROM EMPLOYEE WHERE MONTH(HIRE_DATE) = 1

-- 8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.
    SELECT COUNT(*) as [TOTAL EMPLOYESS] FROM EMPLOYEE WHERE MONTH(HIRE_DATE) IN (1,9)

-- 9. HOW MANY EMPLOYEES WERE JOINED IN 1985?
    SELECT COUNT(*) as [TOTAL EMPLOYESS] FROM EMPLOYEE WHERE YEAR(HIRE_DATE) IN (1985) 
-- 10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.
    SELECT MONTH(HIRE_DATE) as HIRE_MONTH, COUNT(*) as [TOTAL EMPLOYESS] FROM EMPLOYEE WHERE YEAR(HIRE_DATE) IN (1985) GROUP BY MONTH(HIRE_DATE);

-- 11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?
    SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM  EMPLOYEE where MONTH(HIRE_DATE) = 3 AND YEAR(HIRE_DATE) = 1985;


-- 12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN APRIL 1985?
    SELECT EMP_DEPARTMENT_ID, COUNT(*) FROM EMPLOYEE WHERE MONTH(HIRE_DATE) = 4 AND YEAR(HIRE_DATE) = 1985 GROUP BY EMP_DEPARTMENT_ID HAVING COUNT(EMP_DEPARTMENT_ID) >= 3

-- JOINS
-- 1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES.
    SELECT E.FIRST_NAME as EMP_NAME, DEP.NAME AS DEP_NAME FROM EMPLOYEE E INNER JOIN department DEP ON E.EMP_DEPARTMENT_ID = DEP.id

-- 2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.
    SELECT E.FIRST_NAME as EMP_NAME, J.DESIGNATION AS DESIGNATION FROM EMPLOYEE E INNER JOIN job J ON E.EMPJOB_ID = J.id

-- 3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS.
    SELECT E.FIRST_NAME as EMP_NAME, J.DESIGNATION AS DESIGNATION, L.city as [Reginal Group] FROM EMPLOYEE E 
    INNER JOIN job J ON E.EMPJOB_ID = J.id
    INNER JOIN [LOCATION] L on E.EMP_LOCATION_ID = L.id

-- 4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT NAMES.
    SELECT DEP.NAME AS DEP_NAME, COUNT(*) as EMP_COUNT FROM EMPLOYEE E INNER JOIN department DEP ON E.EMP_DEPARTMENT_ID = DEP.id
    GROUP BY E.EMP_DEPARTMENT_ID, DEP.name;

-- 5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
    SELECT DEP.NAME AS DEP_NAME, COUNT(*) as EMP_COUNT FROM EMPLOYEE E
    INNER JOIN department DEP ON E.EMP_DEPARTMENT_ID = DEP.id
    WHERE E.EMP_DEPARTMENT_ID = 20
    GROUP BY E.EMP_DEPARTMENT_ID, DEP.name;

-- 6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5 EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.
    SELECT DEP.NAME AS DEP_NAME, COUNT(*) as EMP_COUNT FROM EMPLOYEE E
    INNER JOIN department DEP ON E.EMP_DEPARTMENT_ID = DEP.id
    GROUP BY E.EMP_DEPARTMENT_ID, DEP.name
    HAVING COUNT(*) > 1
    ORDER BY COUNT(*) ASC;
-- 7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
    SELECT COUNT(*) as [HAVING DESIGNATION] FROM EMPLOYEE E
    INNER JOIN job J ON E.EMPJOB_ID = J.id 
    WHERE J.designation IS NOT NULL;

-- 8. HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK".
    SELECT COUNT(*) [NEW YORK EMPLOYEES] FROM EMPLOYEE E 
    INNER JOIN department D on E.EMP_DEPARTMENT_ID = D.id
    INNER JOIN [LOCATION] L ON D.location_id = L.id
    WHERE L.id = 122


-- 9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.
    SELECT 
      *, 
      Grade = CASE
          WHEN (SALARY <= 1000) THEN 'C'
          WHEN (SALARY BETWEEN 1001 AND 2000) THEN 'B'
          ELSE 'A'
      END
    FROM EMPLOYEE
    ORDER BY SALARY DESC;

-- 10. LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.
    SELECT GRADE, COUNT(*) [NUMBER OF EMPLOYEES] FROM
      (
        SELECT 
            *,
            (CASE
                WHEN (SALARY <= 1000) THEN 'C'
                WHEN (SALARY BETWEEN 1001 AND 2000) THEN 'B'
                ELSE 'A'
            END) AS GRADE
        FROM EMPLOYEE
      ) TEMP
    GROUP BY GRADE;


-- 11. DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 RANGE OF SALARY.
    SELECT SALARY, GRADE, COUNT(*) [NUMBER OF EMPLOYEES] FROM
      (
      SELECT 
          *,
          (CASE
              WHEN (SALARY <= 1000) THEN 'D'
              WHEN (SALARY BETWEEN 1001 AND 2000) THEN 'C'
              WHEN (SALARY BETWEEN 2001 AND 2500) THEN 'B'
              ELSE 'A'
          END) AS GRADE
      FROM EMPLOYEE
      ) TEMP
    WHERE TEMP.SALARY BETWEEN 2000 AND 5000
    GROUP BY SALARY, GRADE;
    
-- 12. DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
    SELECT M.FIRST_NAME AS [MANAGER], E.FIRST_NAME AS [SUBORIDNATE] FROM EMPLOYEE E 
    INNER JOIN EMPLOYEE M ON E.MANAGER_ID = M.EMPLOYEE_ID;

-- 13. DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.
    SELECT M.FIRST_NAME AS [MANAGER], M.SALARY AS [M_SALARY], E.FIRST_NAME AS [SUBORIDNATE], E.SALARY AS [SUBORIDNATE_SALARY] FROM EMPLOYEE E 
    INNER JOIN EMPLOYEE M ON E.MANAGER_ID = M.EMPLOYEE_ID
    WHERE E.SALARY > M.SALARY;
-- 14. SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER.

    SELECT E.MANAGER_ID, COUNT(*) AS [TOTAL_REPORTING_EMPS] FROM EMPLOYEE E
    WHERE MANAGER_ID IS NOT NULL
    GROUP BY E.MANAGER_ID

-- 15. DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
    SELECT M.FIRST_NAME AS [MANAGER], E.FIRST_NAME AS [SUBORIDNATE] FROM EMPLOYEE E 
    INNER JOIN EMPLOYEE M ON E.MANAGER_ID = M.EMPLOYEE_ID;
 
-- 16. DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.
    SELECT E.FIRST_NAME [EMP_NAME], D.NAME [DEPT] FROM EMPLOYEE E
    INNER JOIN department D ON E.EMP_DEPARTMENT_ID = D.id
    WHERE D.name IN ('Sales', 'Operations')

-- SET OPERATORS
-- 1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
    
    -- Find Uniq to department Sales, Find Uniq to accounting and then apply union
    (SELECT J.designation FROM EMPLOYEE E
    INNER JOIN department D on E.EMP_DEPARTMENT_ID = D.id
    INNER JOIN job J on J.id = E.EMPJOB_ID
    WHERE EMP_DEPARTMENT_ID = 20
    EXCEPT
    SELECT J.designation FROM EMPLOYEE E
    INNER JOIN department D on E.EMP_DEPARTMENT_ID = D.id
    INNER JOIN job J on J.id = E.EMPJOB_ID
    WHERE EMP_DEPARTMENT_ID = 10)
    UNION
    (SELECT J.designation FROM EMPLOYEE E
    INNER JOIN department D on E.EMP_DEPARTMENT_ID = D.id
    INNER JOIN job J on J.id = E.EMPJOB_ID
    WHERE EMP_DEPARTMENT_ID = 10
    EXCEPT
    SELECT J.designation FROM EMPLOYEE E
    INNER JOIN department D on E.EMP_DEPARTMENT_ID = D.id
    INNER JOIN job J on J.id = E.EMPJOB_ID
    WHERE EMP_DEPARTMENT_ID = 20)

-- 2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
    SELECT J.designation FROM EMPLOYEE E
    INNER JOIN department D on E.EMP_DEPARTMENT_ID = D.id
    INNER JOIN job J on J.id = E.EMPJOB_ID
    WHERE EMP_DEPARTMENT_ID = 20
    UNION ALL
    SELECT J.designation FROM EMPLOYEE E
    INNER JOIN department D on E.EMP_DEPARTMENT_ID = D.id
    INNER JOIN job J on J.id = E.EMPJOB_ID
    WHERE EMP_DEPARTMENT_ID = 10;
-- 3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN ASCENDING ORDER.
    SELECT J.designation FROM EMPLOYEE E
    INNER JOIN department D on E.EMP_DEPARTMENT_ID = D.id
    INNER JOIN job J on J.id = E.EMPJOB_ID
    WHERE EMP_DEPARTMENT_ID = 30
    INTERSECT
    SELECT J.designation FROM EMPLOYEE E
    INNER JOIN department D on E.EMP_DEPARTMENT_ID = D.id
    INNER JOIN job J on J.id = E.EMPJOB_ID
    WHERE EMP_DEPARTMENT_ID = 10
    ORDER BY J.designation ASC;
-- SUB QUERIES
-- 1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY.
    SELECT salary, FIRST_NAME AS EMP_NAME FROM EMPLOYEE WHERE salary = ( SELECT MAX(salary) FROM EMPLOYEE);
-- 2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
    SELECT * FROM EMPLOYEE WHERE EMP_DEPARTMENT_ID = (
        SELECT ID FROM department WHERE department.id = 20
    )
-- 3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.
    SELECT * FROM EMPLOYEE WHERE EMPJOB_ID = (SELECT ID FROM job WHERE id = 667)
-- 4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK".
    SELECT * FROM EMPLOYEE WHERE EMPJOB_ID = (
        SELECT E.EMPJOB_ID FROM EMPLOYEE E
        INNER JOIN job J ON J.id = E.EMPJOB_ID
        INNER JOIN department D ON E.EMP_DEPARTMENT_ID = D.id
        INNER JOIN [LOCATION] ON [LOCATION].id = D.location_id
        WHERE [LOCATION].city = 'DALLAS'
    )
-- 5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.
    SELECT COUNT(*) AS [SALES EMPLOYEES] FROM EMPLOYEE WHERE EMP_DEPARTMENT_ID = (
        SELECT ID FROM department WHERE department.id = 20
    )
-- 6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.
    UPDATE EMPLOYEE SET SALARY = ((SALARY) + (SALARY * 0.1)) WHERE EMPJOB_ID = (
        SELECT E.EMPJOB_ID FROM EMPLOYEE E WHERE E.EMPJOB_ID = 667
    )
-- 7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
    DELETE FROM EMPLOYEE WHERE EMP_DEPARTMENT_ID = (
        SELECT E.EMP_DEPARTMENT_ID FROM EMPLOYEE E WHERE E.EMP_DEPARTMENT_ID = 10
    )

-- 8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
    WITH EMP_SAL_RANK AS (SELECT *, RANK() OVER (ORDER BY SALARY DESC) AS SAL_RANK FROM EMPLOYEE)
    SELECT * FROM EMP_SAL_RANK WHERE EMP_SAL_RANK.SAL_RANK= 2

-- 9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
    WITH EMP_SAL_RANK AS (SELECT *, RANK() OVER (ORDER BY SALARY DESC) AS SAL_RANK FROM EMPLOYEE)
    SELECT * FROM EMP_SAL_RANK WHERE EMP_SAL_RANK.SAL_RANK= 4

-- 10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
    SELECT * FROM EMPLOYEE WHERE SALARY > (
        SELECT MAX(SALARY) FROM EMPLOYEE E WHERE E.EMP_DEPARTMENT_ID = 30
    )

-- 11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
   SELECT * FROM EMPLOYEE WHERE SALARY > (
        SELECT MIN(SALARY) FROM EMPLOYEE E WHERE E.EMP_DEPARTMENT_ID = 30
    )

-- 12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
    SELECT * FROM department D WHERE D.id NOT IN (SELECT E.EMP_DEPARTMENT_ID FROM EMPLOYEE E)

-- 13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
    SELECT * FROM department D WHERE D.id NOT IN (SELECT E.EMP_DEPARTMENT_ID FROM EMPLOYEE E)

-- 14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT.
    
    -- METHOD #1
        SELECT E.FIRST_NAME, E.SALARY, E.EMP_DEPARTMENT_ID FROM EMPLOYEE E WHERE E.SALARY > (
            SELECT AVG(E2.SALARY) FROM EMPLOYEE E2 WHERE E.EMP_DEPARTMENT_ID = E2.EMP_DEPARTMENT_ID
        )
    -- METHOD #2
        SELECT 
            E.FIRST_NAME, 
            E.SALARY, 
            E.EMP_DEPARTMENT_ID,
            TEMP.AVG_SALARY AS DEPT_AVG_SALARY
        FROM
            (
                SELECT 
                    EMP_DEPARTMENT_ID, 
                    AVG(SALARY) AS AVG_SALARY 
                FROM EMPLOYEE 
                GROUP BY EMP_DEPARTMENT_ID
            ) TEMP
        INNER JOIN EMPLOYEE E ON E.EMP_DEPARTMENT_ID = TEMP.EMP_DEPARTMENT_ID
        WHERE E.SALARY > TEMP.AVG_SALARY

