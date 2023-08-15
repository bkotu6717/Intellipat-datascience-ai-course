

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
