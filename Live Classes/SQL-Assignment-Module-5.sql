
-- 1. Display the names of the highest paid programmers for each Language.

    WITH CTE AS (
    SELECT PNAME, SALARY, PROF1 PROF FROM programmer
    UNION 
    SELECT PNAME, SALARY, PROF2 PROF FROM programmer
    )
    SELECT P1.PNAME, P1.PROF, P1.SALARY
    FROM CTE P1
    LEFT JOIN CTE P2
    ON P1.PROF = P2.PROF AND P1.SALARY < P2.SALARY
    WHERE P2.PNAME IS NULL;

-- 2. Display the details of those who are drawing the same salary.
    SELECT STRING_AGG(P.PNAME, ', ') AS PROGRAMMERS, P.SALARY AS SAME_SALARY FROM PROGRAMMER P
    WHERE P.SALARY IN (
        SELECT SALARY FROM PROGRAMMER GROUP BY SALARY HAVING COUNT(*) > 1
    )
    GROUP BY SALARY

    SELECT PNAME,SALARY FROM PROGRAMMER 
    WHERE SALARY = ANY(
        SELECT SALARY FROM PROGRAMMER 
        GROUP BY SALARY
        HAVING COUNT(*) >1
    )


-- 3. Who are the programmers who joined on the same day?
    SELECT STRING_AGG(P.PNAME, ', ') AS PROGRAMMERS, P.DOJ FROM PROGRAMMER P
    WHERE P.DOJ IN (SELECT DISTINCT DOJ FROM PROGRAMMER)
    GROUP BY P.DOJ

-- 4. Who are the programmers who have the same Prof2?
    SELECT PNAME FROM PROGRAMMER WHERE PROF1 = PROF2

-- 5. How many packages were developed by the person who developed the cheapest package, where did he/she study?
    WITH CTE AS
    (
        SELECT S.PNAME, COUNT(*) AS CHEAPEST_PACKAGES_DEVELOPED FROM SOFTWARE S
        WHERE S.DCOST = (SELECT MIN(DCOST) FROM SOFTWARE)
        GROUP BY S.PNAME
    )
    SELECT CTE.PNAME, ST.INSTITUTE, CTE.CHEAPEST_PACKAGES_DEVELOPED FROM CTE
    INNER JOIN studies ST ON ST.PNAME = CTE.PNAME;
