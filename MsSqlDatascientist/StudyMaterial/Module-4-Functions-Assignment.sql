-- 1. What is the cost of the costliest software development in Basic?
    SELECT TITLE FROM SOFTWARE WHERE DEVELOPIN = 'BASIC' AND DCOST = (SELECT MAX(DCOST) FROM SOFTWARE WHERE DEVELOPIN = 'BASIC')

-- 2. Display details of Packages whose sales crossed the 2000 Mark.
    SELECT *, SCOST*SOLD AS SALE_VALUE FROM SOFTWARE WHERE SCOST*SOLD > 2000 ORDER BY SALE_VALUE DESC

-- 3. Who are the Programmers who celebrate their Birthdays during the Current Month?
    SELECT PNAME FROM PROGRAMMER WHERE MONTH(DOB) = MONTH(GETDATE());

-- 4. Display the Cost of Package Developed By each Programmer.
    SELECT P.PNAME, S.TITLE, S.DCOST FROM PROGRAMMER P 
    LEFT JOIN SOFTWARE S ON S.PNAME = P.PNAME
    WHERE S.DEVELOPIN IN (P.PROF1, P.PROF2)

-- 5. Display the sales values of the Packages Developed by each Programmer.
    SELECT P.PNAME, SUM((SCOST*SOLD)) AS SALES_VALUE FROM PROGRAMMER P 
    LEFT JOIN SOFTWARE S ON S.PNAME = P.PNAME
    WHERE S.DEVELOPIN IN (P.PROF1, P.PROF2)
    GROUP BY P.PNAME

-- 6. Display the Number of Packages sold by Each Programmer.
    SELECT P.PNAME, SUM(SOLD) AS PACKAGES_SOLD FROM PROGRAMMER P 
    LEFT JOIN SOFTWARE S ON S.PNAME = P.PNAME
    WHERE S.DEVELOPIN IN (P.PROF1, P.PROF2)
    GROUP BY P.PNAME
    ORDER BY PACKAGES_SOLD

-- 7. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
    
    -- PENDING
    SELECT P.PNAME, MIN(DCOST) AS CHEPEST_PKG, MAX(DCOST) AS COSTLIEST_PKG FROM PROGRAMMER P 
    LEFT JOIN SOFTWARE S ON S.PNAME = P.PNAME
    WHERE S.DEVELOPIN IN (P.PROF1, P.PROF2)
    GROUP BY P.PNAME

-- 8. Display each institute name with the number of Courses, Average Cost per Course.
    SELECT INSTITUTE, 
    COUNT(*) AS NO_OF_COURSES, 
    AVG(COURSE_FEE) AS AVG_COURSE_FEE FROM studies
    GROUP BY INSTITUTE

-- 9. Display each institute Name with Number of Students.
    SELECT INSTITUTE, 
    COUNT(*) AS NO_OF_STUDENTS FROM studies
    GROUP BY INSTITUTE

-- 10. List the programmers (form the software table) and the institutes they studied.
    SELECT DISTINCT S.PNAME AS PGMR, ST.INSTITUTE AS INSTITUTE FROM SOFTWARE S 
    LEFT JOIN studies ST ON S.PNAME = ST.PNAME

-- 11. How many packages were developed by students, who studied in institute that charge the lowest course fee?
    SELECT COUNT(*) AS PKGS_DEVELOPED FROM SOFTWARE S
    INNER JOIN studies ST ON ST.PNAME = S.PNAME
    WHERE ST.COURSE = S.DEVELOPIN
    AND ST.INSTITUTE = (SELECT MIN(COURSE_FEE) FROM studies)

-- 12. What is the AVG salary for those whose software sales is more than 50,000/-.
    SELECT AVG(P.SALARY) AS AVG_SALARY FROM PROGRAMMER P
    INNER JOIN SOFTWARE S ON S.PNAME = P.PNAME
    WHERE S.DEVELOPIN IN (P.PROF1, P.PROF2)
    AND (S.SCOST*S.SOLD) > 50000

-- 13. Which language listed in prof1, prof2 has not been used to develop any package.

    WITH P_LANGUAGE AS
    (SELECT PROF1 AS PROF FROM PROGRAMMER
    UNION
    SELECT PROF2 AS PROF FROM PROGRAMMER)
    SELECT P_LANGUAGE.PROF AS NOT_USED_LANGUAGE FROM P_LANGUAGE 
    LEFT JOIN SOFTWARE S ON S.DEVELOPIN = P_LANGUAGE.PROF
    WHERE S.TITLE IS NULL

-- 14. Display the total sales value of the software, institute wise.
    SELECT ST.INSTITUTE, COALESCE(SUM(S.SCOST*S.SOLD), 0) AS SALES_VALUE FROM studies ST
    LEFT JOIN SOFTWARE S ON S.DEVELOPIN = ST.COURSE
    GROUP BY ST.INSTITUTE

-- 15. Display the details of the Software Developed in C By female programmers of Pragathi.
    SELECT S.TITLE FROM SOFTWARE S
    INNER JOIN PROGRAMMER P ON P.PNAME = S.PNAME
    INNER JOIN studies ST ON ST.PNAME = P.PNAME
    WHERE P.GENDER = 'F'
    AND S.DEVELOPIN IN (P.PROF1, P.PROF2)
    AND S.DEVELOPIN = 'C'
    AND ST.INSTITUTE = 'PGRAGATHI'

-- 16. Display the details of the packages developed in Pascal by the Female Programmers.
    SELECT S.* FROM SOFTWARE S
    INNER JOIN PROGRAMMER P ON P.PNAME = S.PNAME
    WHERE P.GENDER = 'F'
    AND S.DEVELOPIN IN (P.PROF1, P.PROF2)
    AND S.DEVELOPIN = 'PASCAL'

-- 17. Which language has been stated as the proficiency by most of the Programmers?
    WITH P_LANGUAGE AS
    (SELECT PROF1 AS PROF FROM PROGRAMMER
    UNION ALL
    SELECT PROF2 AS PROF FROM PROGRAMMER)
    SELECT TOP 1 PROF, COUNT(*) AS PROFICINET_PROGRMERS FROM P_LANGUAGE
    GROUP BY PROF 
    ORDER BY PROFICINET_PROGRMERS DESC;

-- 18. Who is the Author of the Costliest Package?
    SELECT PNAME AS AUTHOR FROM SOFTWARE 
    WHERE SCOST = (SELECT MAX(S.SCOST) FROM SOFTWARE S WHERE S.SCOST > S.DCOST)

-- 19. Which package has the Highest Development cost?
    SELECT TITLE AS HIGH_DEVELOPMENT_COST_PACKAGE FROM SOFTWARE 
    WHERE DCOST = (SELECT MAX(S.DCOST) FROM SOFTWARE S)

    SELECT TOP 1 TITLE AS HIGH_DEVELOPMENT_COST_PACKAGE FROM SOFTWARE ORDER BY DCOST DESC

-- 20. Who is the Highest Paid Female COBOL Programmer?
    SELECT PNAME AS HIHGEST_PAID_FEMALE_PROGRAMMER FROM PROGRAMMER WHERE SALARY = (
        SELECT MAX(SALARY) FROM PROGRAMMER WHERE GENDER = 'F'
    )

    SELECT TOP 1 PNAME AS HIHGEST_PAID_FEMALE_PROGRAMMER FROM PROGRAMMER WHERE GENDER = 'F' ORDER BY SALARY DESC

-- 21. Display the Name of Programmers and Their Packages.
    SELECT P.PNAME, STRING_AGG(S.TITLE, ', ') AS PACKAGES_DEVELPED FROM PROGRAMMER P
    INNER JOIN SOFTWARE S ON S.PNAME = P.PNAME
    GROUP BY P.PNAME;

-- 22. Display the Number of Packages in Each Language Except C and C++.
    
    WITH P_LANG AS
    (SELECT PROF1 AS PROF FROM PROGRAMMER
    UNION
    SELECT PROF2 AS PROF FROM PROGRAMMER)
    SELECT P_LANG.PROF AS PROGRAMMING_LANGUAGE, COUNT(*) AS PACKAGES_DEVELOPED FROM P_LANG
    LEFT JOIN SOFTWARE ON DEVELOPIN = P_LANG.PROF
    WHERE DEVELOPIN NOT IN ('C', 'C++', 'CPP')
    GROUP BY P_LANG.PROF

-- 23. Display AVG Difference between SCOST, DCOST for Each Package.
    SELECT TITLE, (SUM(SCOST)-SUM(DCOST))/2 FROM SOFTWARE
    WHERE SOLD > 0
    GROUP BY TITLE
    SELECT * FROM SOFTWARE

-- 24. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
    SELECT PNAME, 
    SUM(SCOST*SOLD) AS TOTAL_SCOST,
    SUM(DCOST) AS TOTAL_DCOST,
    SUM(DCOST - (SCOST*SOLD)) AS AMOUNT_TO_BE_RECOVERED FROM SOFTWARE
    GROUP BY PNAME
    HAVING SUM(DCOST - (SCOST*SOLD)) > 0
    ORDER BY AMOUNT_TO_BE_RECOVERED

-- 25. Who is the Highest Paid C Programmers?
    SELECT PNAME AS [Highest Paid C Programmers] FROM PROGRAMMER 
    WHERE (PROF1 = 'C' OR PROF2 = 'C') 
    AND SALARY = (SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 = 'C' OR PROF2 = 'C'))

-- 26. Who is the Highest Paid Female COBOL Programmer?
    SELECT PNAME AS [Highest Paid Female COBOL Programmer] FROM PROGRAMMER 
    WHERE (PROF1 = 'COBOL' OR PROF2 = 'COBOL') 
    AND GENDER = 'F'
    AND SALARY = (SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 = 'COBOL' OR PROF2 = 'COBOL'))
 
