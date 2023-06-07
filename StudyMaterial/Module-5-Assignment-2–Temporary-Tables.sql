-- Tasks To Be Performed:
-- 1. Display the details of the software developed in dBase by male programmers who belong to the institute with the most number of programmers.
    SELECT S.* FROM SOFTWARE S
    INNER JOIN STUDIES ST ON S.PNAME = ST.PNAME
    INNER JOIN PROGRAMMER P ON P.PNAME = ST.PNAME
    WHERE S.DEVELOPIN = 'DBASE' 
    AND P.GENDER = 'M'
    AND ST.INSTITUTE = (
        SELECT TOP 1 INSTITUTE FROM STUDIES ST
        INNER JOIN PROGRAMMER P ON ST.PNAME = P.PNAME
        GROUP BY INSTITUTE
        ORDER BY COUNT(*) DESC
    )
        
-- 2. In which language are most of the programmer’s proficient?
    WITH CTE AS
    (SELECT PNAME, PROF1 AS PROF FROM PROGRAMMER
    UNION ALL
    SELECT PNAME, PROF1 AS PROF FROM PROGRAMMER)
    SELECT TOP 1 PROF FROM CTE GROUP BY PROF ORDER BY COUNT(*) DESC;

-- 3. In which month did the most number of programmers join?
    SELECT  TOP 1 MONTH(DOJ) AS MOST_PGROMMERS_JOINED_MONTH FROM PROGRAMMER GROUP BY MONTH(DOJ) ORDER BY COUNT(*) DESC;

-- 4. In which year the most number of programmers were born?
    SELECT  TOP 1 YEAR(DOB) AS MOST_PGROMMERS_BORN_IN_YEAR FROM PROGRAMMER GROUP BY YEAR(DOB) ORDER BY COUNT(*) DESC;

-- 5. Which programmer has developed the highest number of packages?
    SELECT TOP 1 S.PNAME FROM SOFTWARE S GROUP BY S.PNAME ORDER BY COUNT(*) DESC

-- 6. Which language was used to develop the most number of packages?
    SELECT TOP 1 S.DEVELOPIN FROM SOFTWARE S GROUP BY S.DEVELOPIN ORDER BY COUNT(*) DESC

-- 7. Which course has below average number of students?
    WITH CTE AS
    (SELECT COURSE, COUNT(*) AS NO_OF_STUDENTS FROM STUDIES 
    GROUP BY COURSE)
    SELECT COURSE, NO_OF_STUDENTS FROM CTE
    WHERE NO_OF_STUDENTS < (
        SELECT AVG(NO_OF_STUDENTS) FROM CTE
    );

-- 8. Which course has been done by the most of the students?
    SELECT TOP 1 ST.COURSE FROM STUDIES ST GROUP BY ST.COURSE ORDER BY COUNT(*) DESC

-- 9. Which institute has the most number of students?
    SELECT TOP 1 ST.INSTITUTE FROM STUDIES ST GROUP BY ST.INSTITUTE ORDER BY COUNT(*) DESC

-- 10. Who is the above programmer referred to in 50 ?
    SELECT P.PNAME, (DATEDIFF(day, DOB, GETDATE())/365) as AGE FROM PROGRAMMER P WHERE (DATEDIFF(day, DOB, GETDATE())/365) BETWEEN 50 and 59

-- 11. Display the names of the highest paid programmers for each language.
   
   SELECT P.PNAME, TEMP2.MAX_SALARY, TEMP2.PROF FROM
   (
       SELECT PROF, MAX(SALARY) AS MAX_SALARY FROM
        (
            SELECT PROF1 AS PROF, SALARY FROM PROGRAMMER
            UNION ALL
            SELECT PROF2 AS PROF, SALARY FROM PROGRAMMER
        ) 
       TEMP GROUP BY PROF
    ) TEMP2, PROGRAMMER P
    WHERE TEMP2.PROF IN (P.PROF1, P.PROF2) AND TEMP2.MAX_SALARY = P.SALARY
