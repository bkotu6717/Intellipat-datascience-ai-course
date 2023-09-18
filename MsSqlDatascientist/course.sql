-- Find the courses known by only one programmer
drop TABLE programmers;
CREATE TABLE programmers(id INTEGER, prof1 varchar(100), prof2 varchar(100));

insert into programmers VALUES(1, 'PASCAL', 'BASIC'),
(2, 'CLIPPER', 'COBOLT'),
(3,'COBOLT', 'DBASE'),
(4,'C', 'DBASE'),
(5, 'CPP','ORACLE'),
(6,'COBOLT', 'DBASE'),
(7, 'PASCAL', 'CLIPPER')

select * from programmers;

SELECT *  FROM
(SELECT p1.prof1 FROM programmers p1
UNION ALL
SELECT p2.prof2 FROM programmers p2)
AS temp
GROUP BY prof1 having COUNT(prof1) = 1;
