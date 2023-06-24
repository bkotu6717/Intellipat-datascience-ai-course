
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
    SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'j___'
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
    
    SELECT * from EMPLOYEE;
