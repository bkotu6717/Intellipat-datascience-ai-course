--error handling 
--locking(lock block and deadlock)



--*************************************************************
select firstname from person.Person
where firstname not  like '%a'
--******************************************
select firstname fom person.Person
--Msg 102, Level 15, State 1, Line 18
--Incorrect syntax near 'person'.

Select * from Sys.messages where message_id =8134


select 1/0

Exception handling 


Begin Try 
	--SQL statements
	select 1/0
End Try 
Begin Catch 
--Error codes 
 print 'Inncorrect code=' + error_message()
End catch 





Begin Try 
	--SQL statements
	select 1/1
End Try 
Begin Catch 
--Error codes 
	Select 
	ERROR_MESSAGE() as ErrorMessage , 
	ERROR_LINE() as ERRORLINE,
	ERROR_NUMBER() as ERRORNUMBER,
	ERROR_SEVERITY() as ERRORSEVERITY,
	ERROR_STATE() as ERRORSTATE
End catch 




BEGIN TRY
    SELECT 1/0
END TRY

BEGIN CATCH
    PRINT 'error message = ' + error_message()
END CATCH





Begin Try 
	--SQL statements
		delete from person.person where BusinessEntityID=1
End Try 
Begin Catch 
--Error codes 
	Select 
	ERROR_MESSAGE() as ErrorMessage , 
	ERROR_LINE() as ERRORLINE,
	ERROR_NUMBER() as ERRORNUMBER,
	ERROR_SEVERITY() as ERRORSEVERITY,
	ERROR_STATE() as ERRORSTATE
End catch 




Begin Try 
	--SQL statements
		Insert into Person.Person(BusinessEntityID) values 
		(101919)
End Try 
Begin Catch 
--Error codes 
	Select 
	ERROR_MESSAGE() as ErrorMessage , 
	ERROR_LINE() as ERRORLINE,
	ERROR_NUMBER() as ERRORNUMBER,
	ERROR_SEVERITY() as ERRORSEVERITY,
	ERROR_STATE() as ERRORSTATE
End catch 



Begin Try 
	--SQL statements
		Insert into Person.Person(BusinessEntityID) values 
		(101919)
End Try 
Begin Catch 
--Error codes 
	 RaisError('Cannot insert null values.',16,1)
End catch 



BEGIN TRY
--outer try 

	BEGIN TRY
	--inner 
		SELECT 1/0
			end try 
	begin catch 
		 PRINT 'inner message = ' + error_message()
	END CATCH


END TRY

BEGIN CATCH
    PRINT 'outer message = ' + error_message()
END CATCH

if(2=2)
	raiserror ('hello world',16,1)


--***************************************
	begin try 
		declare @n1 int 
		set @n1=0 
		select 1/@n1
	END try 
	begin catch 
		 PRINT 'inner message = ' + error_message()
			Begin try 
				declare @n2 int 
				set @n2=1 
				select 1/@n2
			END try
			BEGIN CATCH
				PRINT 'TEST message = ' + error_message()
			END CATCH

	END CATCH

--***********************************************
--TCL (transaction control language )

--Commit =Save the data 
--rollback =don't save the data


--SQl server is commiting data every 60 seconds 

create table t1TCL
(id int , age int , name varchar(100))



Insert into t1TCL values 
(101,21,'John')
go 1000




---**************

Begin Transaction 

	---SQl statements
	DElete from employee with (rowlock) where id =3
	Select * from employee 

Rollback or  Commit

--**************************************************
--With Rowlock , nolock



--Deadlock 

-- Create a sample table
CREATE TABLE SampleTable (
    ID INT PRIMARY KEY,
    Value VARCHAR(50)
);

-- Insert sample data
INSERT INTO SampleTable (ID, Value)
VALUES 
(1, 'Value1'), 
(2, 'Value2');

select * from SampleTable

-- Transaction T1 (Session 1)
BEGIN TRANSACTION;

UPDATE SampleTable
SET Value = 'NewqValue1'
WHERE ID = 1;

-- Transaction T1 (Session 1) continues
UPDATE SampleTable
SET Value = 'NewqValue1'
WHERE ID = 2;

rollback


----RIn this on another session id


-- Transaction T2 (Session 2)
BEGIN TRANSACTION;

UPDATE SampleTable
SET Value = 'NewQValue2'
WHERE ID = 2;


UPDATE SampleTable
SET Value = 'NewQValue2'
WHERE ID = 1;

rollback


--repeat topics 
	--Indexes (execution plan)
	--Self join 
	--Ct IR uR 
	--Seal flour 
	--Group having 

--*****************************************************************
--Subquery in SQl server 

Select * from sales.Customer


109846381.399888



Select * ,
(
	Select sum(LineTotal) from sales.SalesOrderDetail sod  
	where sod.SalesOrderID in (
			Select SalesOrderID from sales.SalesOrderHeader soh
			where soh.customerid=c.customerid)
)as totalsales
from sales.Customer c






---Self join 


CREATE TABLE Emp (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID INT
);

-- Insert sample data
INSERT INTO Emp (EmployeeID, EmployeeName, ManagerID)
VALUES
    (1, 'John Doe', NULL),    -- CEO (no manager)
    (2, 'Alice Smith', 1),    -- Manager 1
    (3, 'Bob Johnson', 1),    -- Manager 2
    (4, 'Eve Brown', 2),      -- Employee 1
    (5, 'Charlie Davis', 2),  -- Employee 2
    (6, 'Grace Wilson', 3);   -- Employee 3



select a.EmployeeName as EmployeeName, b.EmployeeName as managername 
from 
emp a left join emp b 
on a.ManagerID=b.EmployeeID

--Indexes 

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

INSERT INTO Product (ProductID, ProductName, Category, Price, StockQuantity)
VALUES
    (1, 'Laptop', 'Electronics', 999.99, 20),
    (4, 'Desk Lamp', 'Home Decor', 39.99, 30),
    (2, 'Tablet', 'Electronics', 299.99, 15),
    (3, 'Desk Chair', 'Furniture', 149.99, 10),
    (5, 'Coffee Table', 'Furniture', 199.99, 5);



select StockQuantity from product
where StockQuantity >15

create nonclustered index temp  on  product(StockQuantity)


SELECT 
    OBJECT_NAME(s.[object_id]) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    s.user_seeks,
    s.user_scans,
    s.user_lookups,
    s.user_updates
FROM sys.dm_db_index_usage_stats AS s
INNER JOIN sys.indexes AS i 
    ON s.[object_id] = i.[object_id] 
    AND s.index_id = i.index_id
WHERE OBJECT_NAME(s.[object_id]) = 'product'


select suffix from person.person
where suffix is not null


CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
ON [Person].[Person] ([Suffix])

select FirstName,lastname,MiddleName from person.person
where firstname ='qqq' and lastname  ='aaa'



---fuNCTION 
FLOOR(expression )

select FLOOR(5.99)

select rate , convert(int,rate ) as ints
from [HumanResources].[EmployeePayHistory]

select ceiling(5.99)


--*******************************************************



CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);




CREATE TABLE ##Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);



INSERT INTO ##Product (ProductID, ProductName, Category, Price, StockQuantity)
VALUES
    (21, 'Laptop', 'Electronics', 999.99, 20),
    (24, 'Desk Lamp', 'Home Decor', 39.99, 30),
    (22, 'Tablet', 'Electronics', 299.99, 15),
    (23, 'Desk Chair', 'Furniture', 149.99, 10),
    (25, 'Coffee Table', 'Furniture', 199.99, 5);


	select * from ##Product
	select * from Product

--Copy the records from a table to another table 
	insert into Product -- Table created
	select pt.* from ##Product  pt left join  Product pp
	 on pt.ProductID=pp.ProductID
	 where pp.ProductID	  is null

--Copy a table using the select command  Copyprod 
	select *  into  copyprod from Product


create clustered columnstore index tempt1 on	product

create columnstore index tempt on	product(price)

create columnstore index tempt11 on	product(category)
	select price from Product
	where price =39.99

--bcp client utility 
