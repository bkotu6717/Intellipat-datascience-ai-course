drop TABLE programmers;
CREATE TABLE programmers(id INTEGER, prof1 varchar(100), prof2 varchar(100));

insert into programmers VALUES(1, 'PASCAL', 'BASIC'),
(2, 'CLIPPER', 'COBOLT'),
(3,'COBOLT', 'DBASE'),
(4,'C', 'DBASE'),
(5, 'CPP','ORACLE'),
(6,'COBOLT', 'DBASE'),
(7, 'PASCAL', 'CLIPPER')


SELECT prof1 from programmers
UNION
SELECT prof2 from programmers

SELECT prof1 from programmers
UNION ALL
SELECT prof2 from programmers

SELECT prof1 FROM programmers
INTERSECT
SELECT prof2 FROM programmers


SELECT prof1 FROM programmers
EXCEPT
SELECT prof2 FROM programmers
