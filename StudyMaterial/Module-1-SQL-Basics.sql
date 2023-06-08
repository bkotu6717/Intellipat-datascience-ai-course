
-- Problem Statement: Consider yourself to be Sam and you have been given the below tasks to
-- complete using the Table – STUDIES, SOFTWARE & PROGRAMMER.

-- 1. Find out the AVG selling cost for packages developed in Pascal
    SELECT * FROM SOFTWARE WHERE DEVELOPIN = 'PASCAL'
    SELECT SUM(SCOST*SOLD)/SUM(SOLD) AS AVG_SEL_COST FROM SOFTWARE WHERE DEVELOPIN = 'PASCAL'

-- 2. Display Names, Ages of all Programmers.
    SELECT PNAME, DOB, CONCAT(CAST (DATEDIFF(year, DOB, GETDATE()) AS varchar), ' Years') as age FROM PROGRAMMER

-- 3. Display the Names of those who have done the DAP Course.
    SELECT PNAME, COURSE from studies where COURSE = 'DAP';

-- 4. Display the Names and Date of Births of all Programmers Born in January.
    SELECT PNAME, DOB FROM PROGRAMMER WHERE MONTH(DOB) = 1;

-- 5. Display the Details of the Software Developed by Ramesh.
    SELECT * FROM SOFTWARE WHERE PNAME = 'RAMESH';

-- 6. Display the Details of Packages for which Development Cost have been recovered.
    SELECT *, (SCOST*SOLD) AS TOTAL_SALE FROM SOFTWARE WHERE (SCOST*SOLD) > DCOST;

-- 7. Display the details of the Programmers Knowing C.
    SELECT * FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C';

-- 8. What are the Languages studied by Male Programmers?
    SELECT studies.PNAME, GENDER, COURSE FROM studies 
    INNER JOIN PROGRAMMER ON PROGRAMMER.PNAME = studies.PNAME
    WHERE PROGRAMMER.GENDER = 'M'

-- 9. Display the details of the Programmers who joined before 1990.
    SELECT * FROM PROGRAMMER WHERE YEAR(DOJ) < 1990;

-- 10. Who are the authors of the Packages, which have recovered more than double the Development cost?
    SELECT PNAME, TITLE, DEVELOPIN, DCOST, (SCOST*SOLD) AS [RECOVERED COST] FROM SOFTWARE 
    WHERE (SCOST*SOLD) > (2*DCOST);
