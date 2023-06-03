
Create database SQL_Optimization_And_Performance
use SQL_Optimization_And_Performance

create table studies
(
PNAME VARCHAR(30) NOT NULL PRIMARY KEY,
INSTITUTE VARCHAR(20),
COURSE VARCHAR(20),
COURSE_FEE INT
)
INSERT INTO studies VALUES
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000)
SELECT * FROM studies

create table SOFTWARE
(
PNAME VARCHAR(30),
TITLE VARCHAR(30),
DEVELOPIN VARCHAR(20),
SCOST DECIMAL(8,2),
DCOST DECIMAL(8,2),
SOLD INT
)

INSERT INTO SOFTWARE VALUES
('MARY','README','CPP',300.00,1200.00,84),
('ANAND','PARACHUTES','BASIC',399.95,6000.00,43),
('ANAND','VIDEO TITLING ','PASCAL',7500.00,16000.00,9),
('JULIANA','INVENTORY','COBOL',3000.00,3500.00,0),
('KAMALA','PAYROLL PKG','DBASE',9000.00,20000.00,7),
('MARY','FINANCIAL ACCT','ORACLE',18000.00,85000.00,4),
('MARY','CODE GENERATOR ','C',4500.00,20000.00,23),
('PATTRICK','README','CPP',300.00,1200.00,84),
('MARY','README','CPP',300.00,1200.00,84),
('PATTRICK','README','CPP',300.00,1200.00,84),
('QADIR','BOMBS AWAY ','ASSEMBLY',750.00,3000.00,11),
('QADIR','VACCINES','C',1900.00,3100.00,21),
('RAMESH','HOTEL MGMT ','DBASE',13000.00,35000.00,4),
('RAMESH','DEAD LEE','PASCAL',599.95,4500.00,73),
('REMITHA','PC UTILITIES','C',725.00,5000.00,51),
('REMITHA','TSR HELP PKG','ASSEMBLY',2500.00,6000.00,7),
('REVATHI','HOSPITAL MGMT','PASCAL',1100.00,75000.00,2),
('VIJAYA','TSR EDITOR','C',900.00,700.00,6)

create table PROGRAMMER
(
PNAME VARCHAR(30),
DOB DATE,
DOJ DATE,
GENDER VARCHAR(6),
PROF1 VARCHAR(20),
PROF2 VARCHAR(20),
SALARY DECIMAL(7,2)
)

INSERT INTO PROGRAMMER VALUES
('ANAND','2-Apr-66 ','21-Apr-92','M','PASCAL','BASIC',3200.00),
('ALTAF','02-Jul-64 ','13-Nov-90 ','M','CLIPPER','COBOL',2800.00),
('JULIANA','31-Jan-60 ','21-Apr-90 ','F','COBOL','DBASE',3000.00),
('KAMALA','30-Oct-68','02-Jan-92  ','F','C','DBASE',2900.00),
('MARY','24-Jun-70  ','01-Feb-91 ','F','CPP','ORACLE',4500.00),
('NELSON','11-Sep-85 ','11-Oct-89 ','M','COBOL','DBASE',2500.00),
('PATTRICK','10-Nov-65 ','21-Apr-90','M','PASCAL','CLIPPER',2800.00),
('QADIR','31-Aug-65',' 21-Apr-91 ','M','ASSEMBLY','C',3000.00),
('RAMESH','03-May-67 ','28-Feb-91 ','M','PASCAL','DBASE',3200.00),
('REBECCA','01-Jan-67  ','01-Dec-90 ','F','BASIC','COBOL',2500.00),
('REMITHA','19-Apr-70 ','20-Apr-93 ','F','C','ASSEMBLY',3600.00),
('REVATHI','02-Dec-69 ','02-Jan-92 ','F','PASCAL','BASIC',3700.00),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500.00)

-- 1. How many Programmers Don’t know PASCAL and C
    SELECT COUNT(*) as PASCAL_AND_C_NOT_KNOWN_PROGRAMMERS FROM PROGRAMMER WHERE PROF1 NOT IN ('PASCAL', 'C') AND PROF2 NOT IN ('PASCAL', 'C')

-- 2. Display the details of those who don’t know Clipper, COBOL or PASCAL.
    SELECT * FROM PROGRAMMER WHERE PROF1 NOT IN ('Clipper', 'COBOL', 'PASCAL') AND PROF2 NOT IN ('Clipper', 'COBOL', 'PASCAL')

-- 3. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
    
    SELECT DEVELOPIN, 
    AVG(DCOST) AS AVG_DEV_COST, 
    SUM(SCOST*SOLD)/SUM(SOLD) AS AVG_SELLING_COST, 
    AVG(SCOST) AS AVG_PRICE_PER_COPY 
    FROM SOFTWARE 
    WHERE SOLD > 0
    GROUP BY DEVELOPIN;

-- 4. List the programmer names (from the programmer table) and No. Of Packages each has developed.
    SELECT P.PNAME AS PGMR, COUNT(S.TITLE) AS PACKAGES_DEVELOPED FROM PROGRAMMER P
    INNER JOIN SOFTWARE S ON P.PNAME = S.PNAME
    GROUP BY P.PNAME
    ORDER BY COUNT(S.TITLE) DESC;

-- 5. List each PROFIT with the number of Programmers having that PROF and the number of the packages in that PROF.
    -- C, NO_OF_PPOGRAMMERS, NO_PACKAGES_DEVELOPED, PROFIT
    
    -- Wrong answer

    WITH PRG_PRF AS
    (SELECT P.PNAME AS PGMR, P.PROF1 AS PRF FROM PROGRAMMER P
    UNION ALL
    SELECT P.PNAME AS PGMR, P.PROF2 AS PRF FROM PROGRAMMER P)
    SELECT COALESCE(DEVELOPIN, '---') AS PROFICIENCY, 
    COUNT(DISTINCT(PRG_PRF.PGMR)) as PROFICIENT_PGMRS,
    COUNT(DISTINCT(S.TITLE)) as NO_OF_PKGS_DEVELOPED,
    COALESCE(SUM((S.SCOST*S.SOLD)-S.DCOST)/4, 0) as PROFIT
    FROM PRG_PRF LEFT JOIN SOFTWARE S ON S.DEVELOPIN = PRG_PRF.PRF
    GROUP BY S.DEVELOPIN
    ORDER BY PROFIT DESC


-- 6. How many packages are developed by the most experienced programmer form BDPS.
    SELECT COUNT(*) AS TOTAL_PACKAGES_DEVELOPED FROM SOFTWARE S
    INNER JOIN PROGRAMMER P ON S.PNAME = P.PNAME
    INNER JOIN studies ST ON S.PNAME = P.PNAME
    WHERE P.DOJ = (SELECT MIN(DOJ) FROM PROGRAMMER) AND ST.INSTITUTE = 'BDPS'
    GROUP BY S.TITLE;

-- 7. How many packages were developed by the female programmers earning more than the highest paid male programmer?
    SELECT COUNT(*) AS PACKAGES_DEVELOPED FROM SOFTWARE S
    INNER JOIN PROGRAMMER P ON S.PNAME = P.PNAME
    WHERE P.GENDER = 'F' AND P.SALARY > (SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER = 'M')

-- 8. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
    SELECT P.PNAME, P.SALARY, ST.COURSE, S.TITLE FROM PROGRAMMER P
    INNER JOIN SOFTWARE S ON P.PNAME = S.PNAME
    INNER JOIN studies ST ON P.PNAME = ST.PNAME
    WHERE S.SCOST = (SELECT MAX(SCOST) FROM SOFTWARE)

-- 9. In which institute did the person who developed the costliest package study?
    SELECT st.INSTITUTE FROM PROGRAMMER P
    INNER JOIN SOFTWARE S ON P.PNAME = S.PNAME
    INNER JOIN studies ST ON P.PNAME = ST.PNAME
    WHERE S.SCOST = (SELECT MAX(SCOST) FROM SOFTWARE)

-- 10. Display the names of the programmers who have not developed any packages.
    SELECT P.PNAME FROM PROGRAMMER P
    LEFT JOIN SOFTWARE S ON P.PNAME = S.PNAME
    WHERE TITLE IS NULL;

-- 11. Display the details of the software that has developed in the language which is neither the first nor the second proficiency
    SELECT S.* FROM SOFTWARE S
    LEFT JOIN PROGRAMMER P ON P.PNAME = S.PNAME
    WHERE S.DEVELOPIN NOT IN (SELECT PROF1 FROM PROGRAMMER) AND  S.DEVELOPIN NOT IN (SELECT PROF2 FROM PROGRAMMER)

-- 12. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975
    SELECT S.* FROM PROGRAMMER P
    INNER JOIN SOFTWARE S ON S.PNAME = P.PNAME
    WHERE (P.GENDER = 'M' AND YEAR(P.DOB) < 1965) AND (P.GENDER = 'F' AND YEAR(P.DOB) > 1975)

-- 13. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
    SELECT P.PNAME, ST.INSTITUTE, 
    COUNT(S.TITLE) AS NO_OF_PACKAGES_DEVELOPED, 
    SUM(S.SOLD) AS NO_OF_COPIES_SOLD,
    SUM(S.SCOST*S.SOLD) AS SALES_VALUE
    FROM PROGRAMMER P
    INNER JOIN SOFTWARE S ON P.PNAME = S.PNAME
    INNER JOIN studies ST ON P.PNAME = ST.PNAME
    GROUP BY P.PNAME, ST.INSTITUTE

-- 14. Display the details of the Software Developed by the Male Programmers Earning More than 3000/
    SELECT S.* FROM SOFTWARE S
    INNER JOIN PROGRAMMER P ON S.PNAME = P.PNAME
    WHERE P.GENDER = 'M' AND P.SALARY > 3000

-- 15. Who are the Female Programmers earning more than the Highest Paid male?
    SELECT P.PNAME FROM PROGRAMMER P
    WHERE P.SALARY > (SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER = 'M')

-- 16. Who are the male programmers earning below the AVG salary of Female Programmers?
    SELECT P.PNAME FROM PROGRAMMER P
    WHERE P.SALARY < (SELECT AVG(SALARY) FROM PROGRAMMER WHERE GENDER = 'F')

-- 17. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
    SELECT PNAME, DEVELOPIN, MAX(SOLD) AS MAX_SOLD, MIN(SOLD) AS MIN_SOLD FROM SOFTWARE GROUP BY PNAME, DEVELOPIN ORDER BY DEVELOPIN;

-- 18. Display the names of the packages, which have sold less than the AVG number of copies.
    SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);

-- 19. Which is the costliest package developed in PASCAL.
    SELECT TITLE FROM SOFTWARE WHERE DEVELOPIN = 'PASCAL' AND DCOST = (SELECT MAX(DCOST) FROM SOFTWARE WHERE DEVELOPIN = 'PASCAL')

-- 20. How many copies of the package that has the least difference between development and selling cost were sold.
   SELECT COUNT(*) AS NO_PACKAGES_WITH_LEAST_DIFF_BETWEEN_DCOST_AND_SELLING_COST FROM SOFTWARE 
   WHERE (DCOST - SCOST) =  (SELECT MIN(DCOST - SCOST) FROM SOFTWARE);

-- 21. Which language has been used to develop the package, which has the highest sales amount?
    SELECT S.TITLE FROM SOFTWARE S WHERE (S.SCOST*S.SOLD) = (SELECT MAX(SCOST*SOLD) FROM SOFTWARE)

-- 22. Who Developed the Package that has sold the least number of copies?
    SELECT S.PNAME FROM SOFTWARE S WHERE S.SOLD = (SELECT MIN(SOLD) FROM SOFTWARE)

-- 23. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
    SELECT COURSE FROM studies 
    WHERE COURSE_FEE >= (SELECT AVG(COURSE_FEE)-1000 FROM studies) 
    AND COURSE_FEE <= (SELECT AVG(COURSE_FEE)+1000 FROM studies)
    
-- 24. Display the name of the Institute and Course, which has below AVG course fee.
    SELECT INSTITUTE, COURSE FROM studies WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE) FROM studies) 

-- 25. Which Institute conducts costliest course.
    SELECT INSTITUTE FROM studies WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM studies)
    SELECT TOP 1INSTITUTE FROM studies ORDER BY COURSE_FEE DESC;

-- 26. What is the Costliest course?
    SELECT COURSE FROM studies WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM studies)
    SELECT TOP 1 COURSE FROM studies ORDER BY COURSE_FEE DESC;
