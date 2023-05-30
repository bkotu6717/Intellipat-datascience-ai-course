
CREATE DATABASE May28Session
use May28Session

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
    EMP_LOCATION_ID INTEGER FOREIGN KEY REFERENCES LOCATION(id),
    EMP_DEPARTMENT_ID INT FOREIGN KEY REFERENCES DEPARTMENT(id)
)

INSERT INTO EMPLOYEE VALUES
(7369, 'SMITH','JOHN','Q',667,NULL,'17-DEC-84',800,NULL,122,20),
(7499, 'ALLEN','KEVIN','J',670,7369,'20-FEB-85',1600,300,123,30),
(7505, 'DOYLE','JEAN','K',671,7499,'4-APR-85',2850,NULL,124,30),
(7506, 'DENNIS','LYNN','S',671,7505,'15-MAY-85',2750,NULL,167,30),
(7507, 'BAKER','LESLIE','D',671,7507,'10-JUN-85',2200,NULL,122,40),
(7521, 'WARK','CYNTHIA','D',670,7369,'22-FEB-85',1250,500,123,30);

-- SET OPERATORS
-- 1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
    SELECT * FROM job;
    SELECT * FROM department;
    SELECT * FROM EMPLOYEE;
    
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
