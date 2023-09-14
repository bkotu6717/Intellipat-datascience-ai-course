CREATE database SOFTWARE_STUDIES_PROGRAMMER;
USE SOFTWARE_STUDIES_PROGRAMMER
GO
-- Studies Table
CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO Studies values
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA ',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000);
-- View
select * from Studies

-- Software Table
CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

-- Insertion
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);


 -- View
 select * from Software

 -- Programmer Table
 CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
 -- Insert
INSERT INTO Programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

-- View
select * from Programmer
select * from Studies
 select * from Software


-- Problem Statement:
-- Consider yourself to be Sam and you have been given the below tasks to
-- complete using the Table – STUDIES, SOFTWARE and PROGRAMMER
-- Tasks To Be Performed:
-- 1. Find out the selling cost average for packages developed in Pascal.
    SELECT
        SUM(SCOST*SOLD)/SUM(SOLD) AS [AVG SALES COST] FROM
    Software WHERE DEVELOPIN = 'PASCAL';

-- 2. Display the names and ages of all programmers.
    select * from Programmer
    SELECT 
        PNAME,
        DATEDIFF(YEAR, DOJ, GETDATE()) AS [AGE IN YEARS]
    FROM Programmer;
        
-- 3. Display the names of those who have done the DAP Course.
    SELECT PNAME FROM STUDIES WHERE COURSE = 'DAP'

-- 4. Display the names and date of birth of all programmers born in January.
    SELECT PNAME, DOB FROM Programmer WHERE MONTH(DOB) = 1

-- 5. What is the highest number of copies sold by a package?
    SELECT TOP 1
        TITLE,
        MAX(SOLD) [MAX_PACKAGES_SOLD]
    FROM Software
    GROUP BY TITLE
    ORDER BY MAX(SOLD) DESC
-- 6. Display lowest course fee.
    select MIN(COURSE_FEE) AS [LOWEST FEE] from Studies

-- 7. How many programmers have done the PGDCA Course?
    select 
        COUNT(*) AS [PGDCA_PROGRAMMERS] 
    from Studies
    WHERE COURSE = 'PGDCA'

-- 8. How much revenue has been earned through sales of packages developed in C?
    SELECT 
        SUM((SCOST*SOLD)-DCOST) AS [C Packages revenue]
    FROM Software 
    WHERE DEVELOPIN = 'C'

-- 9. Display the details of the software developed by Ramesh.
    SELECT 
        * 
    FROM Software 
    WHERE PNAME = 'RAMESH'

-- 10. How many programmers studied at Sabhari?
    SELECT 
        COUNT(*) AS [TOTAL programmers] 
    FROM Studies 
    WHERE INSTITUTE = 'SABHARI'
-- 11. Display details of packages whose sales crossed the 2000 mark.
    SELECT 
        TITLE, 
        SUM((SCOST*SOLD)) as [sales Value]
    FROM Software 
    GROUP BY TITLE
    HAVING SUM((SCOST*SOLD)) > 2000

-- 12. Display the details of packages for which development costs have been recovered.
    SELECT 
        TITLE,
        SUM((SCOST*SOLD)) as [sales Value],
        SUM(DCOST) as [DCOST]
    FROM Software 
    GROUP BY TITLE
    HAVING SUM((SCOST*SOLD)) > SUM(DCOST)

-- 13. What is the cost of the costliest software development in Basic?
    SELECT 
        MAX(DCOST) [MAX_COST] 
    FROM Software 
    WHERE DEVELOPIN = 'BASIC'

-- 14. How many packages have been developed in dBase?
    SELECT 
        COUNT(*) [DBASE Packages COUNT] 
    FROM Software 
    WHERE DEVELOPIN = 'DBASE'
-- 15. How many programmers studied in Pragathi?
    SELECT 
        COUNT(*) AS [PRAGATHI INSTITUTE STUDENTS COUNT] 
    FROM Studies 
    WHERE INSTITUTE = 'PRAGATHI'

-- 16. How many programmers paid 5000 to 10000 for their course?
    SELECT 
        COUNT(*) AS [programmers paid 5000 to 10000 for their course] 
    FROM Programmer P
    INNER JOIN Studies S ON P.PNAME = S.PNAME
    WHERE S.COURSE_FEE BETWEEN 5000 AND 10000

-- 17. What is the average course fee?
    SELECT 
        AVG(COURSE_FEE) AS [AVG_COURSE_FEE]
    FROM Studies
-- 18. Display the details of the programmers knowing C.
    SELECT
        *
    FROM Programmer
    WHERE PROF1 = 'C' OR PROF2 = 'C';
-- 19. How many programmers know either COBOL or Pascal?
    SELECT 
        * 
    FROM Programmer
    WHERE PROF1 IN ('COBOL', 'PASCAL') OR PROF2 IN  ('COBOL', 'PASCAL')
-- 20. How many programmers don’t know Pascal and C?
    SELECT 
        * 
    FROM Programmer
    WHERE PROF1 NOT IN ('C', 'PASCAL') AND PROF2 NOT IN  ('C', 'PASCAL')
-- 21. How old is the oldest male programmer?
    SELECT DATEDIFF(YEAR, MIN(DOB), GETDATE()) AS [AGE IN YEARS] FROM Programmer
-- 22. What is the average age of female programmers?
    SELECT 
        AVG(DATEDIFF(YEAR, DOB, GETDATE())) AS [AGE IN YEARS] 
    FROM Programmer
    WHERE GENDER = 'F'

-- 23. Calculate the experience in years for each programmer and display with their names in descending order.
    SELECT 
        PNAME,
        DATEDIFF(YEAR, DOJ, GETDATE()) AS [EXPERIENCE IN YEARS] 
    FROM Programmer
    ORDER BY [EXPERIENCE IN YEARS]  DESC
-- 24. Who are the programmers who celebrate their birthdays during the current month?
    SELECT 
        *
    FROM Programmer
    WHERE MONTH(DOB) = MONTH(GETDATE())
-- 25. How many female programmers are there?
    SELECT 
        COUNT(*) AS [FEMALE PROGRAMMERS]
    FROM Programmer
    WHERE GENDER = 'F'
-- 26. What are the languages studied by male programmers?
    SELECT 
        DISTINCT S.COURSE
    FROM Studies S
    INNER JOIN Programmer P ON S.PNAME = P.PNAME
    WHERE P.GENDER = 'M'
-- 27. What is the average salary?
    SELECT 
        AVG(SALARY) 
    FROM Programmer
-- 28. How many people draw a salary between 2000 to 4000?
    SELECT 
        COUNT(*) AS [BETWEEN 2000 AND 4000 SALARY PROGRAMMERS]
    FROM Programmer
    WHERE SALARY BETWEEN 2000 AND 4000
-- 29. Display the details of those who don’t know Clipper, COBOL or Pascal.
    SELECT 
        * 
    FROM Programmer
    WHERE PROF1 NOT IN ('CLIPPER', 'COBAL', 'PASCAL') AND PROF2 NOT IN  ('CLIPPER', 'COBAL', 'PASCAL')
-- 30. Display the cost of packages developed by each programmer.
    SELECT 
        PNAME, 
        TITLE, 
        SUM(DCOST) AS [TOTAL_DEV_COST]
    FROM Software
    GROUP BY PNAME, TITLE


-- 31. Display the sales value of the packages developed by each programmer.
    SELECT 
        P.PNAME,
        S.TITLE,
        SUM(SCOST*SOLD) AS [SALES]
    FROM Software S
    RIGHT JOIN Programmer P ON P.PNAME = S.PNAME
    GROUP BY P.PNAME, S.TITLE
    ORDER BY S.TITLE
-- 32. Display the number of packages sold by each programmer.
    SELECT 
        P.PNAME,
        S.TITLE,
        SUM(SOLD) AS [PACKAGES_SOLD]
    FROM Software S
    RIGHT JOIN Programmer P ON P.PNAME = S.PNAME
    GROUP BY P.PNAME, S.TITLE
    ORDER BY S.TITLE

-- 33. Display the sales cost of the packages developed by each programmer language wise.
    SELECT 
        P.PNAME,
        S.DEVELOPIN,
        SUM(SCOST*SOLD) AS [PACKAGES_SOLD]
    FROM Software S
    RIGHT JOIN Programmer P ON P.PNAME = S.PNAME
    GROUP BY P.PNAME, S.DEVELOPIN
    ORDER BY S.DEVELOPIN
-- 34. Display each language name with the average development cost, average selling cost and average price per copy.
    SELECT 
        S.DEVELOPIN,
        AVG(DCOST) AS [AVG_DCOST],
        SUM(SCOST*SOLD)/(
            case SUM(SOLD)
            when 0 then 1
            else SUM(sold)
            end
        ) AS [AVG_SCOST],
        AVG(SCOST) AS [AVG_PRICE_PER_COPY]
    FROM Software S
    GROUP BY S.DEVELOPIN

-- 35. Display each programmer’s name and the costliest and cheapest packages developed by him or her.
    with cte as
        (
            SELECT
                PNAME, MIN(DCOST) as CHEPEST_PKG, MAX(DCOST) as COSTLIEST_PKG
            FROM Software
            GROUP BY PNAME
        )
    SELECT 
        s.PNAME, 
        S.TITLE, 
        S.DCOST FROM cte INNER JOIN Software s on s.PNAME = cte.Pname
    where s.DCOST IN(cte.CHEPEST_PKG, cte.COSTLIEST_PKG)

-- 36. Display each institute’s name with the number of courses and the average cost per course.
    SELECT 
        INSTITUTE, 
        COUNT(*) as Number_of_courses,
        AVG(COURSE_FEE) as [AVG course fee]
    From Studies GROUP by INSTITUTE;
-- 37. Display each institute’s name with the number of students.
    SELECT
        INSTITUTE, 
        COUNT(*) AS [NUMBER OF students] 
    FROM Studies
    GROUP BY INSTITUTE
-- 38. Display names of male and female programmers along with their gender.
    SELECT 
        Pname, 
        gender
    from Programmer
-- 39. Display the name of programmers and their packages.
    SELECT 
        P.PNAME,
        STRING_AGG(s.TITLE, ', ') as [packages developed]
    FROM Programmer p
    LEFT JOIN Software s on P.PNAME = s.PNAME
    GROUP BY P.PNAME
-- 40. Display the number of packages in each language except C and C++.
    SELECT
        DEVELOPIN,
        COUNT(*) as [Packages developed] 
    FROM Software 
    WHERE DEVELOPIN NOT IN ('C', 'CPP')
    GROUP BY DEVELOPIN
-- 41. Display the number of packages in each language for which development cost is less than 1000.
    SELECT
        DEVELOPIN,
        COUNT(*) as [Packages developed] 
    FROM Software 
    WHERE DCOST < 1000
    GROUP BY DEVELOPIN
-- 42. Display the average difference between SCOST and DCOST for each package.
    SELECT
        TITLE,
        ABS(AVG(SCOST-DCOST)) as [average difference between SCOST and DCOST]
    FROM Software 
    GROUP BY TITLE
-- 43. Display the total SCOST, DCOST and the amount to be recovered for each programmer whose cost has not yet been recovered.
    SELECT
        P.PNAME,
        SUM(SCOST*SOLD) AS [TOTAL_SCOST],
        SUM(DCOST) AS [TOTAL_DEV_COST],
        SUM(SCOST*SOLD)- SUM(DCOST) AS [COST TO BE RECOVERED]
    FROM Programmer P
    LEFT JOIN Software S ON P.PNAME = S.PNAME
    GROUP BY P.PNAME
    HAVING SUM(SCOST*SOLD)- SUM(DCOST) <= 0

-- 44. Display the highest, lowest and average salaries for those earning more than 2000.
    SELECT
        MAX(P.SALARY) AS [MAX_SALARY],
        MIN(P.SALARY) AS [MIN_SALARY],
        AVG(P.SALARY) AS [AVG_SALARY]
    FROM Programmer P
    WHERE P.SALARY > 2000

-- 45. Who is the highest paid C programmer?
    SELECT
        PNAME, SALARY
    FROM Programmer
    WHERE (PROF1 = 'C' OR PROF2 = 'C' ) AND SALARY = (
        SELECT 
            MAX(SALARY) 
        FROM Programmer
        WHERE PROF1 = 'C' OR PROF2 = 'C' 
    )
-- 46. Who is the highest paid female COBOL programmer?
    SELECT
        PNAME, SALARY
    FROM Programmer
    WHERE (PROF1 = 'COBAL' OR PROF2 = 'COBAL' ) AND GENDER = 'F'AND SALARY = (
        SELECT 
            MAX(SALARY) 
        FROM Programmer
        WHERE (PROF1 = 'COBAL' OR PROF2 = 'COBAL') AND GENDER = 'F'
    )

-- 47. Display the names of the highest paid programmers for each language.
    drop table #temp_table2
    WITH CTE AS
        (
            SELECT
                PNAME, PROF1 AS LANG, SALARY
            FROM Programmer
            UNION ALL
            SELECT
                PNAME, PROF2 AS LANG, SALARY
            FROM Programmer
        )
    SELECT 
        CTE.LANG, 
        MAX(CTE.SALARY) AS MAX_SALARY 
    INTO #temp_table2
    FROM CTE GROUP BY CTE.LANG

    SELECT 
        P.PNAME, 
        #temp_table2.LANG, 
        #temp_table2.MAX_SALARY
    FROM Programmer P, #temp_table2
    WHERE P.SALARY = #temp_table2.MAX_SALARY AND P.PROF1 = #temp_table2.LANG OR P.PROF2 = #temp_table2.LANG
    GO
    WITH cte AS (
      SELECT PNAME, SALARY, PROF1 PROF FROM programmer
      UNION ALL
      SELECT PNAME, SALARY, PROF2  FROM programmer
    )
    SELECT p1.PNAME, p1.PROF, p1.SALARY
    FROM cte p1
    LEFT JOIN cte p2
      ON (p1.PROF = p2.PROF AND p1.SALARY < p2.SALARY)
    WHERE p2.PNAME IS NULL
    ORDER BY p1.PROF

    -- Inserts blank record in p2 side if p2 salary is lesser
    SELECT * FROM Programmer p1 
    LEFT JOIN Programmer p2 ON (p1.PROF1 = p2.PROF1) AND (p1.SALARY < p2.SALARY)


-- 48. Who is the least experienced programmer?
    SELECT
        P.PNAME,
        P.DOJ
    FROM Programmer P
    WHERE DOJ = (
        SELECT
            MAX(DOJ)
        FROM Programmer
    )
-- 49. Who is the most experienced male programmer knowing PASCAL?
    SELECT
        P.PNAME,
        P.DOJ
    FROM Programmer P
    WHERE DOJ = (
        SELECT
            MIN(DOJ)
        FROM Programmer P2
        WHERE P2.GENDER = 'M'
        AND (P2.PROF1 = 'PASCAL' OR P2.PROF2 = 'PASCAL')
    )
    AND P.GENDER = 'M'
    AND (P.PROF1 = 'PASCAL' OR P.PROF2 = 'PASCAL')
-- 50. Which language is known by only one programmer?
    WITH CTE AS
    (
        SELECT
            PNAME, PROF1 AS LANG, SALARY
        FROM Programmer
        UNION ALL
        SELECT
            PNAME, PROF2 AS LANG, SALARY
        FROM Programmer
    )
    SELECT 
        CTE.LANG, COUNT(*) AS [PROGRAMMERS COUNT]
    FROM CTE
    GROUP BY CTE.LANG
    HAVING COUNT(*) = 1


-- 51. Who is the above programmer referred in 50?
    WITH CTE AS
    (
        SELECT
            PNAME, PROF1 AS LANG, SALARY
        FROM Programmer
        UNION ALL
        SELECT
            PNAME, PROF2 AS LANG, SALARY
        FROM Programmer
    )
    SELECT 
        CTE.LANG, COUNT(*) AS [PROGRAMMERS COUNT]
    INTO #temp_table3
    FROM CTE
    GROUP BY CTE.LANG
    HAVING COUNT(*) = 1

    SELECT
        DISTINCT(PNAME), #temp_table3.LANG
    FROM Programmer, #temp_table3
    WHERE PROF1 IN (#temp_table3.LANG) OR PROF2 IN (#temp_table3.LANG)
-- 52. Who is the youngest programmer knowing dBase?
    SELECT 
        PNAME
    FROM Programmer
    WHERE (PROF1 = 'DBASE' OR PROF2 = 'DBASE')
    AND DOB = (
        SELECT 
            MAX(DOB)
        FROM Programmer
        WHERE (PROF1 = 'DBASE' OR PROF2 = 'DBASE')
    )

-- 53. Which female programmer earning more than 3000 does not know C,C++, Oracle or dBase?
    SELECT
        PNAME AS [female programmer earning more than 3000]
    FROM Programmer
    WHERE GENDER = 'F'
    AND SALARY > 3000
    AND (
        PROF1 NOT IN ('C', 'CPP', 'ORACLE', 'DBASE')
        OR
        PROF2 NOT IN ('C', 'CPP', 'ORACLE', 'DBASE')
    )

-- 54. Which institute has the most number of students?

    WITH cte1
    AS 
    (
    SELECT INSTITUTE, COUNT(PNAME) AS [no. of students], RANK() OVER(ORDER by count(PNAME) DESC) AS ranks FROM Studies
    GROUP BY INSTITUTE
    )
    SELECT INSTITUTE, [no. of students] FROM cte1
    WHERE ranks = 1

-- 55. What is the costliest course?
    SELECT
        COURSE
    FROM Studies
    WHERE COURSE_FEE = (
        SELECT
            MAX(COURSE_FEE)
        FROM Studies
    )
-- 56. Which course has been done by the most number of students?
    WITH cte1
    AS 
    (
    SELECT COURSE, COUNT(PNAME) AS [no. of students], RANK() OVER(ORDER by count(PNAME) DESC) AS ranks FROM Studies
    GROUP BY COURSE
    )
    SELECT cte1.COURSE, [no. of students] FROM cte1
    WHERE ranks = 1
-- 57. Which institute conducts the costliest course?
    SELECT
        COURSE
    FROM Studies
    WHERE COURSE_FEE = (
        SELECT
            MAX(COURSE_FEE)
            FROM Studies
    )
-- 58. Display the name of the institute and the course which has below average course fee.
    SELECT
        INSTITUTE,
        COURSE,
        COURSE_FEE
    FROM Studies
    WHERE COURSE_FEE < (
        SELECT
            AVG(COURSE_FEE)
        FROM Studies
    )
-- 59. Display the names of the courses whose fees are within 1000 (+ or -) of the average fee.
    SELECT
        COURSE,
        COURSE_FEE
    FROM Studies
    WHERE COURSE_FEE BETWEEN 
        (
            SELECT
                AVG(COURSE_FEE) - 1000
            FROM Studies
        )
        AND
        (
            SELECT
                AVG(COURSE_FEE) + 1000
            FROM Studies
        )
    
-- 60. Which package has the highest development cost?
    SELECT
        TITLE
    FROM Software
    WHERE DCOST = (
        SELECT 
            MAX(DCOST)
        FROM Software
    )

-- 61. Which course has below average number of students?
 
    WITH CTE AS
    (
        SELECT 
            COURSE, 
            COUNT(*) AS TOTAL_STUDENTS
        FROM Studies 
        GROUP BY COURSE
    )
    SELECT 
        COURSE, 
        TOTAL_STUDENTS 
    FROM CTE
    WHERE TOTAL_STUDENTS < (
        SELECT 
            AVG(Cast(TOTAL_STUDENTS as Float))
        FROM CTE
    )

-- 62. Which package has the lowest selling cost?
    SELECT
        TITLE
    FROM Software s
    WHERE SCOST = (
        SELECT 
            MIN(SCOST)
        FROM Software
    )
-- 63. Who developed the package that has sold the least number of copies?
    SELECT 
        PNAME
    FROM Software
    WHERE SOLD = (
        SELECT
            MIN(SOLD)
        FROM Software
    )
-- 64. Which language has been used to develop the package which has the highest sales amount?
    SELECT 
        DEVELOPIN
    FROM Software
    WHERE SOLD*SCOST = (
        SELECT
            MAX(SCOST*SOLD)
        FROM Software
    )
-- 65. How many copies of the package that has the least difference between development and selling cost were sold?
    SELECT 
        SOLD
    FROM Software
    WHERE ABS(DCOST-SCOST) = (
        SELECT
            ABS(MIN(DCOST-SCOST))
        FROM Software
    )
-- 66. Which is the costliest package developed in Pascal?
    SELECT
        TITLE
    FROM Software S
    WHERE S.DEVELOPIN = 'PASCAL'
    AND S.DCOST = (
        SELECT
            MAX(DCOST)
         FROM Software
        WHERE DEVELOPIN = 'PASCAL'
    )
-- 67. Which language was used to develop the most number of packages?
    WITH cte as
    (
        SELECT
            DEVELOPIN,
            RANK() OVER(
                ORDER BY COUNT(*) DESC
            ) AS Ranks
        FROM Software
        GROUP BY DEVELOPIN
    )
    SELECT 
        DEVELOPIN 
    FROM cte 
    WHERE Ranks = 1
-- 68. Which programmer has developed the highest number of packages?
    WITH cte as
    (
        SELECT
            PNAME,
            RANK() OVER(
                ORDER BY COUNT(*) DESC
            ) AS Ranks
        FROM Software
        GROUP BY PNAME
    )
    SELECT 
        PNAME 
    FROM cte 
    WHERE Ranks = 1
-- 69. Who is the author of the costliest package?
    SELECT
        PNAME
    FROM Software
    WHERE SCOST = (
        SELECT
            MAX(SCOST)
        FROM Software
    )
-- 70. Display the names of the packages which have sold less than the average number of copies.
    SELECT
        TITLE
    FROM Software
    WHERE SOLD < (
        SELECT
            AVG(Cast(SOLD as Float))
        FROM Software
    )
-- 71. Who are the authors of the packages which have recovered more than double the development cost?
    SELECT
        DISTINCT PNAME,
        TITLE
    FROM Software
    WHERE SCOST*SOLD > 2*DCOST

-- 72. Display the programmer names and the cheapest packages developed by them in each language.
    select s.pname, s.title as cheapest_title, s.DEVELOPIN, p.mincost
    from software s
    join (
        select pname, developin, MIN(dcost) as mincost 
        from software 
        group by pname, DEVELOPIN
        ) p on (s.pname = p.pname and s.dcost= p.mincost and s.DEVELOPIN = p.DEVELOPIN)
-- 73. Display the language used by each programmer to develop the highest selling and lowest selling package.
    select s.pname, s.title as mintitle, s.DEVELOPIN,mincost, t.maxtitle,t.DEVELOPIN, t.maxcost
    from software s
    join (select pname, MIN(dcost) as mincost from software group by pname) p  on (s.pname = p.pname and s.dcost= p.mincost)
    join
    (
        select a.pname, a.title as maxtitle,a.DEVELOPIN ,b.maxcost
        from software a
        join (select pname, MAX(dcost) as maxcost from software group by pname) b on (a.pname = b.pname and a.dcost= b.maxcost)
    ) t on s.pname = t.pname



-- 74. Who is the youngest male programmer born in 1965?
    SELECT 
        PNAME
    FROM Programmer
    WHERE DOB = (
        SELECT
            MAX(DOB)
        FROM Programmer
        WHERE YEAR(DOB) = 1965
    )
-- 75. Who is the oldest female programmer who joined in 1992?
    SELECT 
        PNAME
    FROM Programmer
    WHERE DOB = (
        SELECT
            MIN(DOB)
        FROM Programmer
        WHERE YEAR(DOJ) = 1992
    )
-- 76. In which year was the most number of programmers born?
    WITH cte as
    (
        SELECT
            YEAR(DOB) as [Birth Year],
            RANK() OVER (ORDER BY COUNT(*) DESC) AS Ranks
        FROM Programmer
        GROUP BY YEAR(DOB)
    )
    SELECT 
        [Birth Year]
    FROM cte
    WHERE Ranks = 1
-- 77. In which month did the most number of programmers join?
    WITH cte as
    (
        SELECT
            MONTH(DOJ) as [Joining Month],
            RANK() OVER (ORDER BY COUNT(*) DESC) AS Ranks
        FROM Programmer
        GROUP BY MONTH(DOJ)
    )
    SELECT 
        [Joining Month]
    FROM cte
    WHERE Ranks = 1
-- 78. In which language are most of the programmer’s proficient?
    
--     WITH x AS 
-- (
--     SELECT * FROM MyTable
-- ), 
-- y AS 
-- (
--     SELECT * FROM x
-- )
-- SELECT * FROM y

    WITH cte AS
    (
        SELECT PROF1 FROM Programmer
        UNION ALL
        SELECT PROF2 FROM Programmer
    ),
    cte2 AS
    (
        SELECT 
            PROF1,
            RANK() OVER( ORDER BY COUNT(*) DESC) as ranks
        FROM cte
        GROUP BY PROF1
    )
    SELECT 
        * 
    FROM cte2 
    WHERE ranks = 1;


-- 79. Who are the male programmers earning below the average salary of female programmers?
    SELECT
        PNAME
    FROM Programmer
    WHERE GENDER = 'M' AND SALARY < (
        SELECT
            AVG(SALARY)
        FROM Programmer
        WHERE GENDER = 'F'
    )

-- 80. Who are the female programmers earning more than the highest paid?
    SELECT
        PNAME
    FROM Programmer
    WHERE SALARY > (
        SELECT
            MAX(SALARY)
        FROM Programmer
    ) AND GENDER = 'F'
-- 81. Which language has been stated as the proficiency by most of the programmers?

    WITH cte AS
    (
        SELECT PROF1 FROM Programmer
        UNION ALL
        SELECT PROF2 FROM Programmer
    ),
    cte2 AS
    (
        SELECT 
            PROF1,
            RANK() OVER( ORDER BY COUNT(*) DESC) as ranks
        FROM cte
        GROUP BY PROF1
    )
    SELECT 
        * 
    FROM cte2 
    WHERE ranks = 1;
-- 82. Display the details of those who are drawing the same salary.
    SELECT 
        SALARY,
        STRING_AGG(P.PNAME, ', ') as [PROGRAMMERS]
    FROM Programmer p
    GROUP BY P.SALARY
    HAVING COUNT(*) > 1
-- 83. Display the details of the software developed by the male programmers earning more than 3000.
    SELECT
        S.*
    FROM Software S
    INNER JOIN Programmer P ON S.PNAME = P.PNAME
    WHERE P.GENDER = 'M' AND SALARY > 3000
-- 84. Display the details of the packages developed in Pascal by the female programmers.
    SELECT
        S.*
    FROM Software S
    INNER JOIN Programmer P ON S.PNAME = P.PNAME
    WHERE P.GENDER = 'F' AND S.DEVELOPIN = 'PASCAL'
-- 85. Display the details of the programmers who joined before 1990.
    SELECT
        *
    FROM Programmer
    WHERE YEAR(DOJ) < 1990
-- 86. Display the details of the software developed in C by the female  programmers at Pragathi.
    SELECT
        S.*
    FROM Software S
    INNER JOIN Programmer P ON P.PNAME = S.PNAME
    INNER JOIN Studies ST ON ST.PNAME = S.PNAME
    WHERE P.GENDER = 'F' AND ST.INSTITUTE = 'PRAGATHI' AND S.DEVELOPIN = 'C'
-- 87. Display the number of packages, number of copies sold and sales value of each programmer institute wise.
    SELECT
        P.PNAME,
        ST.INSTITUTE,
        COUNT(S.TITLE) AS [number of packages],
        SUM(S.SOLD) AS [number of copies sold],
        SUM(S.SOLD*S.SCOST) AS [sales value]
    FROM Software S
    INNER JOIN Programmer P ON P.PNAME = S.PNAME
    INNER JOIN Studies ST ON ST.PNAME = S.PNAME
    GROUP BY P.PNAME, ST.INSTITUTE
GO

-- 88. Display the details of the software developed in dBase by male  programmers who belong to the institute 
-- in which the most number of programmers studied.

WITH cte AS
    (
        SELECT 
            INSTITUTE,
        RANK() OVER(ORDER BY COUNT(*) DESC) AS ranks
        FROM Studies
        GROUP BY INSTITUTE
    )

SELECT
    S.TITLE
FROM Software s
INNER JOIN Programmer P ON P.PNAME = s.PNAME
INNER JOIN Studies St On St.PNAME = S.PNAME
WHERE P.Gender = 'M' AND s.DEVELOPIN = 'DBASE' AND St.INSTITUTE IN
    (
        SELECT INSTITUTE FROM cte WHERE ranks = 1

    )

-- 89. Display the details of the software developed by the male programmers
-- born before 1965 and female programmers born after 1975.
    WITH cte AS
    (
        SELECT
        P.*
        FROM Programmer P
        WHERE P.gender = 'M' AND YEAR(P.DOB) < 1965
        UNION ALL
        SELECT
        P.*
        FROM Programmer P
        WHERE P.gender = 'F' AND YEAR(P.DOB) > 1975
    )
    SELECT 
        S.* 
    FROM cte 
    INNER JOIN Software s ON cte.PNAME = s.PNAME

-- 90. Display the details of the software that has been developed in the
-- language which is neither the first nor the second proficiency of the
-- programmers.
    WITH cte AS
    (
        SELECT 
            PROF1
        FROM Programmer
        UNION
        SELECT 
            PROF2
        FROM Programmer
    )

    SELECT 
        *
    FROM Software
    WHERE DEVELOPIN NOT IN(
        SELECT
            *
        FROM cte
    )

-- 91. Display the details of the software developed by the male students at Sabhari.
    SELECT
        S.*
    FROM Software s
    INNER JOIN Programmer P ON P.PNAME = s.PNAME
    INNER JOIN Studies St On St.PNAME = S.PNAME
    WHERE P.Gender = 'M' AND St.INSTITUTE = 'SABHARI'
-- 92. Display the names of the programmers who have not developed any packages.
    SELECT
        P.*
    FROM Programmer P
    LEFT JOIN Software s ON P.PNAME = s.PNAME
    WHERE S.TITLE IS NULL

-- 93. What is the total cost of the software developed by the programmers of Apple?
    SELECT 
        SUM(S.DCOST)
    FROM Software S
    INNER JOIN Studies St ON st.PNAME = S.PNAME
    WHERE St.INSTITUTE = 'APPLE'
-- 94. Who are the programmers who joined on the same day?
    SELECT
        DATEPART(WEEKDAY, DOJ) AS [WEEKDAY],
        STRING_AGG(PNAME, ', ') as [PROGRAMMERS]
    FROM Programmer
    GROUP BY DATEPART(WEEKDAY, DOJ)
    HAVING COUNT(*) > 1

-- 95. Who are the programmers who have the same Prof2?

    SELECT
        STRING_AGG(PNAME, ', ') as [PROGRAMMERS],
        PROF2
    FROM Programmer
    GROUP BY PROF2
    HAVING COUNT(*) > 1

-- 96. Display the total sales value of the software institute wise.
    SELECT
        ST.INSTITUTE, 
        S.TITLE,
        SUM(S.SCOST*S.SOLD) AS [SALES]
    FROM Software s
    INNER JOIN Studies ST ON s.PNAME = ST.PNAME
    GROUP BY ST.INSTITUTE, S.TITLE  
-- 97. In which institute does the person who developed the costliest package study?
    SELECT
        ST.INSTITUTE
    FROM Software s
    INNER JOIN Studies ST ON s.PNAME = ST.PNAME
    WHERE S.DCOST = (
        SELECT
            MAX(DCOST)
        FROM Software
    )
-- 98. Which language listed in Prof1, Prof2 has not been used to develop any package?

     WITH cte AS
    (
        SELECT 
            PROF1
        FROM Programmer
        UNION
        SELECT 
            PROF2
        FROM Programmer
    )

    SELECT 
        *
    FROM Software
    WHERE DEVELOPIN NOT IN(
        SELECT
            *
        FROM cte
    )
-- 99. How much does the person who developed the highest selling package
-- earn and what course did he/she undergo?
SELECT
    P.PNAME,
    P.SALARY,
    ST.COURSE
FROM Software s
INNER JOIN Programmer P On P.PNAME = s.PNAME
INNER JOIN Studies St ON St.PNAME = s.PNAME
WHERE s.SOLD IN (
    SELECT
        MAX(SOLD)
    FROM Software
)
-- 100. What is the average salary for those whose software sales is more than 50,000?
SELECT
    AVG(P.SALARY) AS [AVG SALARY]
FROM Software s
INNER JOIN Programmer P On P.PNAME = s.PNAME
WHERE (S.SCOST*S.SOLD) > 50000

-- 101. How many packages were developed by students who studied in
-- institutes that charge the lowest course fee?
SELECT
    COUNT(DISTINCT(S.TITLE)) AS [PACKAGES_DEVELOPED]
FROM Software S
INNER JOIN Studies ST ON ST.PNAME = S.PNAME
WHERE ST.COURSE_FEE = (
    SELECT
        MIN(COURSE_FEE)
    FROM Studies
)
-- 102. How many packages were developed by the person who developed the cheapest package? Where did he/she study?

    SELECT
        S.PNAME,
        ST.INSTITUTE,
        COUNT(S.TITLE) AS [packages Developed]
    FROM Software S
    INNER JOIN Studies ST ON ST.PNAME = S.PNAME
    GROUP BY S.PNAME, ST.INSTITUTE
    HAVING S.PNAME IN
    (
        SELECT
            PNAME
        FROM Software
        WHERE SCOST = (
            SELECT
                MIN(SCOST)
            FROM Software
        )
    )


SELECT
    COUNT(*)

-- 103. How many packages were developed by female programmers earning
-- more than the highest paid male programmer?
SELECT
    COUNT(DISTINCT(S.TITLE)) AS [PACKAGES_DEVELOPED]
FROM Software S
INNER JOIN Programmer P ON P.PNAME = S.PNAME
WHERE P.GENDER = 'F' AND P.SALARY > (
    SELECT 
        MAX(SALARY)
    FROM Programmer
    WHERE GENDER = 'M'
)

-- 104. How many packages are developed by the most experienced
-- programmers from BDPS?
SELECT
    COUNT(DISTINCT(S.TITLE)) AS [PACKAGES_DEVELOPED]
FROM Software S
INNER JOIN Studies ST ON ST.PNAME = S.PNAME
INNER JOIN Programmer P ON P.PNAME = S.PNAME
WHERE ST.INSTITUTE = 'BDPS' AND P.DOJ = (
    SELECT 
        MIN(DOJ)
    FROM Programmer
)

-- 105. List the programmers (from the software table) and the institutes they studied at.
SELECT
    S.PNAME,
    ST.INSTITUTE
FROM Software S
INNER JOIN Studies ST ON ST.PNAME = S.PNAME
-- 106. List each PROF with the number of programmers having that PROF and the number of the packages in that PROF.

WITH cte
  AS
  (
  SELECT prof1 FROM Programmer
  UNION ALL
  SELECT prof2 FROM Programmer
  )
  SELECT prof1, COUNT(*) AS [no. OF programmers]
  INTO prof_table
  FROM cte 
  GROUP BY PROF1

  SELECT PROF1, COUNT(*) AS [No. OF packages] INTO soft_table FROM prof_table p
  JOIN Software s ON  p.PROF1 = s.DEVELOPIN
  GROUP BY prof1 

  SELECT p.PROF1, p.[no. OF programmers] ,s.[No. OF packages] FROM prof_table p
  JOIN soft_table s on p.PROF1 =s.PROF1
  
-- 107. List the programmer names (from the programmer table) and the number of packages each has developed
    SELECT
        P.PNAME,
        COUNT(*) as [NUMBER Packages developed]
    FROM Programmer P
    INNER JOIN Software s On s.PNAME = P.PNAME
    WHERE S.DEVELOPIN IN (P.PROF1, P.PROF2)
    GROUP BY P.PNAME
