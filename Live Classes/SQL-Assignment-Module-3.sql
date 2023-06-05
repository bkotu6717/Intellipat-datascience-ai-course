

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
    COALESCE(SUM((S.SCOST*S.SOLD)-S.DCOST)/COUNT(DISTINCT(S.TITLE)), 0) as PROFIT
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
