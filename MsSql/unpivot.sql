

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


SELECT Region, [2010], [2011], [2012] 

INTO pivoted_tavle FROM 
(
    select Region, [YEAR], Sales from pivot_demo2
) as t1
PIVOT
(
    SUM(sales) for [YEAR] IN ([2010], [2011], [2012])
) t2

SELECT * FROM pivoted_tavle;

select Region, Year, sales FROM 
(
    select * FROM pivoted_tavle
) as x
UNPIVOT
(
    sales for YEAR in ([2010], [2011], [2012])
) as y


Create Table ProductSales
(
       AgentName VARCHAR(50),
       India int,
       US int,
       UK int
)
Go

INSERT INTO ProductSales VALUES ('Smith', 9160, 5220, 3360)
INSERT INTO ProductSales VALUES ('David', 9770, 5440, 8800)
INSERT INTO ProductSales VALUES ('James', 9870, 5480, 8900)
Go

select * from ProductSales

SELECT AgentName, Country, Sale FROM
(
    select AgentName, India, US, UK FROM ProductSales
) x
UNPIVOT
(
    Sale for Country IN ([India], [US], [UK])
) y



SELECT * from geeksforgeeks;

-- Spread the CourseName column
SELECT CourseCategory, [C], [JAVA], [Python], [Placement 100] FROM
(
    select CourseCategory, CourseName, Price FROM geeksforgeeks
) x

PIVOT
(
    SUM(Price) FOR COurseName IN ([C], [JAVA], [Python], [Placement 100])
) y

-- Spread the course category column
SELECT CourseName, [Programming], [InterviewPreparation] from 
(
    SELECT COurseName, CourseCategory, Price from geeksforgeeks
)x
PIVOT
(
    SUM(Price) FOR CourseCategory IN ([Programming], [InterviewPreparation])
) y

-- Insert the pivot data into a new table

SELECT * from geeksforgeeks

SELECT CourseCategory, [C], [JAVA], [PYTHON], [Placement 100] INTO pivoted_table FROM
(
    select CourseName, CourseCategory, Price FROM geeksforgeeks
) x
PIVOT
(
    SUM(Price) FOR COurseName IN ([C], [JAVA], [PYTHON], [Placement 100])
) y

select * from pivoted_table

SELECT CourseCategory, PLanguage, Price FROM
(
    select * FROM pivoted_table 
) x
UNPIVOT
(
    Price FOR PLanguage IN ([C], [JAVA], [PYTHON], [Placement 100])
) Y


GO
CREATE TABLE #BookSalesV2
(BookType VARCHAR(20), BookSubtype VARCHAR(20), 
  SalesYear INT, BookSales MONEY, Verified BIT);
GO
 
INSERT INTO #BookSalesV2 VALUES('Fiction', 'Adults', 2014, 11201, 1);
INSERT INTO #BookSalesV2 VALUES('Fiction', 'Children', 2014, 12939, 0);
INSERT INTO #BookSalesV2 VALUES('Fiction', 'Adults', 2013, 10436, 1);
INSERT INTO #BookSalesV2 VALUES('Fiction', 'Children', 2013, 9346, 0);
INSERT INTO #BookSalesV2 VALUES('Nonfiction', 'Adults', 2014, 7214, 0);
INSERT INTO #BookSalesV2 VALUES('Nonfiction', 'Children', 2014, 5800, 1);
INSERT INTO #BookSalesV2 VALUES('Nonfiction', 'Adults', 2013, 8922, 1);
INSERT INTO #BookSalesV2 VALUES('Nonfiction', 'Children', 2013, 7462, 0);
INSERT INTO #BookSalesV2 VALUES('Fiction', 'Adults', 2014, 14209, 0);
INSERT INTO #BookSalesV2 VALUES('Fiction', 'Children', 2014, 11489, 0);
INSERT INTO #BookSalesV2 VALUES('Fiction', 'Adults', 2013, 9909, 1);
INSERT INTO #BookSalesV2 VALUES('Fiction', 'Children', 2013, 8726, 0);
INSERT INTO #BookSalesV2 VALUES('Nonfiction', 'Adults', 2014, 4399, 1);
INSERT INTO #BookSalesV2 VALUES('Nonfiction', 'Children', 2014, 5248, 0);
INSERT INTO #BookSalesV2 VALUES('Nonfiction', 'Adults', 2013, 7740, 0);
INSERT INTO #BookSalesV2 VALUES('Nonfiction', 'Children', 2013, 8267, 1);
INSERT INTO #BookSalesV2 VALUES('Fiction', 'YA', 2014, 9854, 0);
INSERT INTO #BookSalesV2 VALUES('Fiction', 'YA', 2013, 8756, 1);

SELECT * FROM #BooKSalesV2

select BookType, BookSubtype, [2013], [2014] FROM
(
    select BookType, BookSubtype, SalesYear, [BookSales] as sales FROM #BookSalesV2
) x
PIVOT
(
    SUM(sales) FOR SalesYear IN ([2013], [2014])
)y


select BookType, BookSubtype, [2013], [2014] into pivoted_book_sales FROM
(
    select BookType, BookSubtype, SalesYear, [BookSales] as sales FROM #BookSalesV2
) x
PIVOT
(
    SUM(sales) FOR SalesYear IN ([2013], [2014])
)y

select * from pivoted_book_sales

SELECT BookType, BookSubType, Price, [SaleYear] FROM (
    select BookType, BookSubType, [2013], [2014] from pivoted_book_sales
) x
UNPIVOT
(
    Price FOR SaleYear IN ([2013], [2014])
) y

