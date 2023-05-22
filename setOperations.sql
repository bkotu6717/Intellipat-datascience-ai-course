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
