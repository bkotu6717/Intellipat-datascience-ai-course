

CREATE TABLE Grades(
  [Student] VARCHAR(50),
  [Subject] VARCHAR(50),
  [Marks]   INT
)
GO
 
INSERT INTO Grades VALUES 
('Jacob','Mathematics',100),
('Jacob','Science',95),
('Jacob','Geography',90),
('Amilee','Mathematics',90),
('Amilee','Science',90),
('Amilee','Geography',100)

SELECT * FROM Grades;

SELECT Subject, [Jacob], [Amilee]  FROM
(
    select Student, Subject, Marks from Grades
) as Src
PIVOT
(
    SUM(Marks) FOR Student IN ([Jacob], [Amilee])
) as PVt

SELECT * FROM Grades;

SELECT Student, [Mathematics], [Science], [Geography]  FROM
(
    select Student, Subject, Marks from Grades
) as Src
PIVOT
(
    SUM(Marks) FOR Subject IN ([Mathematics], [Science], [Geography])
) as PVt

SELECT * FROM
(
    SELECT region, [year], Sales from pivot_demo
) as Src

PIVOT
(
    sum(sales) FOR region IN ([North], [South])
) as Pvt


SELECT * FROM
(
    SELECT region, [year], Sales from pivot_demo
) as Src

PIVOT
(
    sum(sales) FOR [year] IN ([2010], [2011], [2012])
) as Pvt


SELECT Student, [Mathematics], [Science], [Geography] from
(
    select Student, Subject, Marks from Grades
) as Src
PIVOT
(
    SUM(Marks) FOR Subject IN ([Mathematics], [Science], [Geography])
) as Pvt

SELECT Subject, [Jacob], [Amilee] from
(
    select Student, Subject, Marks from Grades
) as Src
PIVOT
(
    SUM(Marks) FOR Student IN ([Jacob], [Amilee])
) as Pvt


CREATE TABLE yt 
(
  [Store] int, 
  [Week] int, 
  [xCount] int
);
    
INSERT INTO yt
(
  [Store], 
  [Week], [xCount]
)
VALUES
    (102, 1, 96),
    (101, 1, 138),
    (105, 1, 37),
    (109, 1, 59),
    (101, 2, 282),
    (102, 2, 212),
    (105, 2, 78),
    (109, 2, 97),
    (105, 3, 60),
    (102, 3, 123),
    (101, 3, 220),
    (109, 3, 87);

SELECT * from yt;


SELECT Store, [1], [2], [3] FROM
(
    SELECT [Store], [Week], [xCount] from yt
) src
PIVOT
(
    SUM([xCount]) FOR Week IN ([1], [2], [3])
) pvt

Create Table geeksforgeeks 
( 
CourseName nvarchar(50), 
CourseCategory nvarchar(50),
Price int  
) 

Insert into geeksforgeeks  values('C', 'PROGRAMMING', 5000) 
Insert into geeksforgeeks  values('JAVA', 'PROGRAMMING', 6000) 
Insert into geeksforgeeks  values('PYTHON', 'PROGRAMMING', 8000) 
Insert into geeksforgeeks  values('PLACEMENT 100', 'INTERVIEWPREPARATION', 5000) 

SELECT * FROM geeksforgeeks

SELECT CourseCategory, [C], [JAVA], [PYTHON], [PLACEMENT 100] from 
(
    select CourseName, CourseCategory, Price from geeksforgeeks
) src
PIVOT
(
    SUM(Price) FOR CourseName IN ([C], [JAVA], [PYTHON], [PLACEMENT 100])
) as pvt

CREATE TABLE pivot_demo2    
(    
   Region varchar(45),    
   Year int,    
   Sales int    
) 

INSERT INTO pivot_demo2 
VALUES ('North', 2010, 72500),  
('South', 2010, 60500),  
('South', 2010, 52000),  
('North', 2011, 45000),  
('South', 2011, 82500),    
('North', 2011, 35600),  
('South', 2012, 32500),   
('North', 2010, 20500);  

select * from pivot_demo2;

SELECT [Year], [North], [South] FROM
(
    select Region, [Year], Sales FROM pivot_demo2
) as Src
PIVOT
(
    SUM(Sales) FOR Region IN ([North], [South])
) pvt
