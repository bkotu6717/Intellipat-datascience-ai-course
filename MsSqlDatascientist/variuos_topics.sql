--DDL 
--DCL 
--system databases
--data types 
--Filters in SQl server 
--top offset fetch 
--constraints 
--pk fk ci nci ck

--join  merge 
--union all intersect except 

--transformation operators rollup cubes pivot unpivot 
--windows function dat and time string conversion aggregate 
--cte
--*******************************************************************
--SQL Server UDF

ntile

--Divide the resultset into parts 

with CTe as 
(
select eid,ename,gender,salary,department,
ntile (4) over( order by salary) as eempt from employee 
)
select * from cte  where eempt=4

--*******************************************
Select * from employee

DEclare @n1 Int , @n2 int , @n3 int 
set @n1=10
set @n2=5
set @n3=@n1-@n2
print @n3


---Scalar valued function in SQL server 
--create Function Functioname()
-- returns value 
-- as 
-- statement

 ---
 Create function subtract()
 returns int 
 as 
  Begin 
	DEclare @n1 Int , @n2 int , @n3 int 
	set @n1=10
	set @n2=5
	set @n3=@n1-@n2
	return  @n3
  End 


  Select dbo.Subtract()
--********************************************
  select 
  eid,ename,gender,salary,department,
  dbo.Subtract() as empt 
  from employee R


--********************************************
Create function totalsal( @dept varchar(20))
returns  int 
as
Begin 
	Declare @totalsal int
	select @totalsal=Sum(salary)  from employee
	where department=@dept

	return @totalsal

End 

  select * from employee 


  select [dbo].[totalsal]('sales '), 'it'


  select *, [dbo].[totalsal]('it') from employee



--********************************************
Create function Avgsal( @dept varchar(20))
returns  decimal(10,2) 
as
Begin 
	Declare @totalsal decimal(10,2) 
	select @totalsal=Avg(salary)  from employee
	where department=@dept

	return @totalsal
End 

select dbo.Avgsal('sales')


  select * from employee 

--********************************************
--Table valued function 
Create Function fetchs( @gender varchar(100))
returns table 
as 
return Select * from employee where gender=@gender


sclare valued function with table valued function 


Select *,  dbo.Avgsal('hr') from dbo.fetchs('Male')








--********************************************
Alter  function Fullname (@id int)
returns table 
as
 
	return
	(
		Select concat (firstname,' ', MiddleName,' ',LastName) as Names 
		from person.person
		where BusinessEntityID >=@id
	)

 Drop function dbo.Fullname





 select * from dbo.Fullname(10)

--********************************************

Select concat (firstname,' ', MiddleName,' ',LastName) as fullname 
		from person.person
		where BusinessEntityID >=1111




--Create 
--ALter 
--Drop 





--********************************************
--SQL server VIEW  (SELECT)

select eid,ename,gender,salary,department  from employee 


--Create view Viewname
--as 
--select statement
--How to create a view 
	create view viewdata
	as
	select eid,ename,department  from employee 
--How to read from a view 

select * from viewdata

--select,Insert,update,delete----->View  --> Table 
--Delete from view 
 delete from viewdata where eid >10



 ---Insert 
 insert into viewdata values
 (11,'test','it')

 select * from employee

 --Complex view 

 Create view joined 
 as 
  select customers.CustomerID,CustomerName,
OrderID,OrderDate from customers  join Orders
on  customers.customerid=orders.customerid


select * from joined 


--FOr complex view insert,update,or delete is not possible 

--Indexed view 

Create view SUmofdept 
as
select department , sum(salary) as TotalSal  from employee 
group by department 

select * from SUmofdept



--Partitioned View

create view partioned
as 
select * from employee
union all
select * from Department


select * from partioned order by eid 


--Create 
--ALter 
--Drop 

--***********************************************************

--Stored procedure In SQL server 

CREATE TABLE employee
  (
      eid INT  ,
      ename VARCHAR(50)  ,
      gender VARCHAR(50) ,
      salary INT  ,
      department VARCHAR(50)  
   )


    INSERT INTO employee
  VALUES
  (1, 'David', 'Male', 5000, 'Sales'),
  (2, 'Jim', 'Female', 6000, 'HR'),
  (3, 'Kate', 'Female', 7500, 'IT'),
  (4, 'Will', 'Male', 6500, 'Marketing'),
  (5, 'Shane', 'Female', 5500, 'Finance'),
  (6, 'Shed', 'Male', 8000, 'Sales'),
  (7, 'Vik', 'Male', 7200, 'HR'),
  (8, 'Vince', 'Female', 6600, 'IT'),
  (9, 'Jane', 'Female', 5400, 'Marketing'),
  (10, 'Laura', 'Female', 6300, 'Finance'),
  (11, 'Mac', 'Male', 5700, 'Sales'),
  (12, 'Pat', 'Male', 7000, 'HR'),
  (13, 'Julie', 'Female', 7100, 'IT'),
  (14, 'Elice', 'Female', 6800,'Marketing'),
  (15, 'Wayne', 'Male', 6800, 'Finance')


--Stored procedure 

Create procedure READDATA
as 
select * from employee

exec or execute 


exec READDATA



Create procedure avgdata  
as 
select avg(salary) from employee 

exec avgdata

Alter  procedure avgdata  
as 
select department,avg(salary) from employee 
group by department 


--Create 
--ALter 
--Drop 

--***********************************************************
Create procedure filterda @dept varchar(100)
as
select department,avg(salary) from employee 
group by department having department =@dept 


exec filterda 'IT'

exec filterda sales

exec filterda @dept =HR


Create procedure inserts @id int, @name varchar(100),@price int 
as 
insert into products values 
(@id,@name,@price)


select * from Products
exec inserts 511,tim,870
 
--***********************************************************
Alter procedure temptest 
as 
Select eid as [empployee.eid] from employee 

select  'hello'
select did as [department.did] from department 

exec temptest

--***********************************************************
--Trigger DMl (Insert update delete) 


Create trigger monitor 
on EMployee

FOr Insert,update,delete 
as 
begin 
	Print 'Actions are monitored'
ENd 

--UPdate 
	Update employee 
	set salary=0

--DElete
	DElete from employee
--INSERT
    INSERT INTO employee
  VALUES
  (1, 'David', 'Male', 5000, 'Sales'),
  (2, 'Jim', 'Female', 6000, 'HR'),
  (3, 'Kate', 'Female', 7500, 'IT'),
  (4, 'Will', 'Male', 6500, 'Marketing'),
  (5, 'Shane', 'Female', 5500, 'Finance'),
  (6, 'Shed', 'Male', 8000, 'Sales'),
  (7, 'Vik', 'Male', 7200, 'HR'),
  (8, 'Vince', 'Female', 6600, 'IT'),
  (9, 'Jane', 'Female', 5400, 'Marketing'),
  (10, 'Laura', 'Female', 6300, 'Finance'),
  (11, 'Mac', 'Male', 5700, 'Sales'),
  (12, 'Pat', 'Male', 7000, 'HR'),
  (13, 'Julie', 'Female', 7100, 'IT'),
  (14, 'Elice', 'Female', 6800,'Marketing'),
  (15, 'Wayne', 'Male', 6800, 'Finance')

--*********************************************
Create Table DMLLOGS 
(
	Logid int identity(1,1)  not null,
	empid varchar(100) not null,
	Operation varchar(100) not null,
	Updatedate datetime not null
)

Create trigger INsertmonitor
 on employee
 For insert 
 as 
 insert into dbo.DMLLOGS (empid,operation,updatedate)
 select SUSER_SNAME(),'INsert', getdate() from inserted 

 delete from employee

 select * from employee

 
 select * from DMLLOGS


 Alter trigger deletemonitor
 on employee
 For delete 
 as 
 insert into dbo.DMLLOGS (empid,operation,updatedate)
 select SUSER_SNAME(),'delete', getdate() from deleted 




 select  Eventdata()





 Create table Employees (id int identity, Name varchar(50), Password varchar(50))
create table Log (id int identity, EmployeeId int, LogDate datetime, 
    OldName varchar(50))



	Alter trigger Employees_Trigger_Update on Employees
	after  update
	as
	insert into Log (EmployeeId, LogDate, OldName) 
	select id, getdate(), name 	from deleted




insert into Employees (Name, Password) values ('Zaphoid', '6')
insert into Employees (Name, Password) values ('Beeblebox', '7')
update Employees set Name = 'Fordssss' where id = 1



select * from Employees
select * from Log




Select * from inserted

--Trigger DDL (TCL)
--Self join 
--Programing constructs (if else if ,case ,go .while )
--error handling 
--locking(lock block and deadlock)
--Indexes (execution plan)
