

-- Tasks To Be Performed:
-- 1. What is the highest number of copies sold by a package?
   SELECT TOP 1 SW.TITLE, SUM(SW.SOLD) FROM SOFTWARE SW GROUP BY SW.TITLE ORDER BY SUM(SW.SOLD) DESC;

-- 2. Display lowest course fee.
   SELECT MIN(COURSE_FEE) FROM studies
   SELECT TOP 1 * FROM studies WHERE COURSE_FEE =  (SELECT MIN(COURSE_FEE) FROM studies)

-- 3. How old is the oldest male programmer?
    SELECT CONCAT( CAST( MIN(DATEDIFF(YEAR, DOB, GETDATE())) AS varchar), ' Years' ) AS OLDEST_MALE_PROGRAMMER FROM PROGRAMMER WHERE GENDER = 'M'

-- 4. What is the average age of female programmers?
    SELECT CONCAT( CAST( AVG(DATEDIFF(DAY, DOB, GETDATE())/365) AS varchar), ' Years' ) AS FEMALE_PROG_AVG_AGE FROM PROGRAMMER WHERE GENDER = 'F'

-- 5. Calculate the experience in years for each programmer and display with their names in descending order.
    SELECT PNAME, DOJ, CONCAT( CAST( (DATEDIFF(YEAR, DOJ, GETDATE())) AS varchar), ' Years' ) as EXPERIENCE FROM PROGRAMMER ORDER BY PNAME DESC;

-- 6. How many programmers have done the PGDCA course?
    SELECT COUNT(DISTINCT(PROGRAMMER.PNAME)) as NO_OF_PGDCA_STUDIED_PROGRAMMERS  FROM PROGRAMMER 
    INNER JOIN studies ON PROGRAMMER.PNAME = studies.PNAME
    WHERE studies.COURSE = 'PGDCA'

-- 7. How much revenue has been earned through sales of packages developed in C?
    SELECT SUM(SCOST*SOLD) AS C_PACKAGES_REVENUE FROM SOFTWARE WHERE DEVELOPIN = 'C';

-- 8. How many programmers have studied at Sabhari?
    SELECT COUNT(*) AS STUDIED_AT_SABHARI FROM studies WHERE INSTITUTE = 'SABHARI'

-- 9. How many packages have been developed in dBase?
    SELECT COUNT(*) AS DEVELOPED_IN_DBASE FROM SOFTWARE WHERE DEVELOPIN = 'DBASE';

-- 10. How many programmers have studied in Pragathi?
    SELECT COUNT(DISTINCT(PROGRAMMER.PNAME)) as NO_OF_STUDIED_PRGATHI  FROM PROGRAMMER 
    INNER JOIN studies ON PROGRAMMER.PNAME = studies.PNAME
    WHERE studies.INSTITUTE = 'PRAGATHI'

-- 11. How many programmers paid 5000 to 10000 for their course?
    SELECT COUNT(*) as NO_OF_STUDENTS_PAID_BETWEEN_5000_to_10000  FROM PROGRAMMER 
    INNER JOIN studies ON PROGRAMMER.PNAME = studies.PNAME
    WHERE studies.COURSE_FEE BETWEEN 5000 AND 10000

-- 12. How many programmers know either COBOL or Pascal?
    SELECT COUNT(*) as NO_OF_COBOL_OR_PASCAL_PROGRAMMERS FROM PROGRAMMER WHERE PROF1 IN ('COBOL', 'PASCAL') OR PROF2 IN ('COBOL', 'PASCAL')
    SELECT * FROM PROGRAMMER
-- 13. How many female programmers are there?
    SELECT COUNT(*) as NO_OF_FEMALE_PROGRAMMERS FROM PROGRAMMER WHERE GENDER = 'F'

-- 14. What is the average salary?
    SELECT ROUND(AVG(SALARY),2) as AVG_SALARY FROM PROGRAMMER;

-- 15. How many people draw a salary between 2000 to 4000?
    SELECT COUNT(*) as NO_OF_EMPLOYEES_WITH_SALARY_BETWEEN_2K_AND_4K FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000;

-- 16. Display the sales cost of the packages developed by each programmer language wise.
    SELECT * FROM SOFTWARE WHERE PNAME = 'ANAND'
    
    SELECT  P.PNAME, S.TITLE,  S.DEVELOPIN, SUM(SCOST) AS TOTAL_SALES_COST FROM PROGRAMMER P
    INNER JOIN SOFTWARE S ON P.PNAME = S.PNAME
    GROUP BY P.PNAME, S.TITLE,  S.DEVELOPIN    
    
-- 17. Display the details of the software developed by the male students of Sabhari.
    SELECT st.PNAME, p.GENDER, st.INSTITUTE, s.TITLE FROM studies st 
    INNER JOIN PROGRAMMER p on st.PNAME = p.PNAME
    INNER JOIN SOFTWARE s ON st.PNAME = s.PNAME
    WHERE st.INSTITUTE = 'SABHARI' AND p.GENDER = 'M'

-- 18. Who is the oldest female programmer who joined in 1992?
    SELECT * FROM PROGRAMMER WHERE YEAR(DOJ) = 1992 AND DOB = (SELECT MIN(DOB) FROM PROGRAMMER WHERE YEAR(DOJ) = 1992);

-- 19. Who is the youngest male programmer born in 1965?
    SELECT * FROM PROGRAMMER P WHERE P.GENDER = 'M' AND DOB = (SELECT MAX(DOB) FROM PROGRAMMER P2 WHERE P2.GENDER = 'M');;

-- 20. Which package has the lowest selling cost?
    SELECT TOP 1 TITLE FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE);

-- 21. Which female programmer earning more than 3000 does not know C, C++, Oracle or dBase?
    SELECT PNAME FROM PROGRAMMER
    WHERE GENDER = 'F' 
    AND PROF1 NOT IN ('C', 'C++', 'ORACLE', 'DBASE') 
    AND PROF2 NOT IN ('C', 'C++', 'ORACLE', 'DBASE')
    AND SALARY > 3000;

-- 22. Who is the youngest programmer knowing dBase?
    SELECT PNAME FROM PROGRAMMER
    WHERE PROF1 = 'DBASE' OR PROF2 = 'DBASE'
    AND DOB = (SELECT MAX(DOB) FROM PROGRAMMER P2 WHERE P2.PROF1 = 'DBASE' OR P2.PROF2 = 'DBASE')

-- 23. Which language is known by only one programmer?

    WITH PROF_LIST AS
    (SELECT PROF1 AS PROF FROM PROGRAMMER
    UNION ALL
    SELECT PROF2 AS PROF FROM PROGRAMMER)
    SELECT PROF AS LANGUAGE_KNOWN_BY_ONLY_ONE_PROGRAMMER FROM PROF_LIST GROUP BY PROF HAVING COUNT(*) = 1

-- 24. Who is the most experienced male programmer knowing Pascal?
    SELECT PNAME FROM PROGRAMMER 
    WHERE (PROF1 = 'PASCAL' OR PROF2 = 'PASCAL')
    AND GENDER = 'M'
    AND DOJ = (
        SELECT MIN(P2.DOJ) FROM PROGRAMMER P2
        WHERE (P2.PROF1 = 'PASCAL' OR P2.PROF2 = 'PASCAL')
        AND P2.GENDER = 'M'
    );

-- 25. Who is the least experienced programmer?
    SELECT PNAME FROM PROGRAMMER WHERE DOJ = (SELECT MAX(P2.DOJ) FROM PROGRAMMER P2);

-- 26. Display the number of packages in each language for which development cost is less than 1000.
    SELECT DEVELOPIN, COUNT(*) AS LESS_THAN_1K_DEV_COST FROM SOFTWARE 
    WHERE DCOST < 1000 GROUP BY DEVELOPIN ;

-- 27. Display the highest, lowest and average salaries for those earning more than 2000.
    
    SELECT PNAME, SALARY, MAX(SALARY) AS HIGHEST_SALARY, MIN(SALARY) AS MINIMUM_SALARY, AVG(SALARY) AS AVG_SALARY  FROM PROGRAMMER 
    WHERE SALARY > 2000
    GROUP BY PNAME, SALARY
