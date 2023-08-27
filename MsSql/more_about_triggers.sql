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


select getdate()


--Trigger
--automatic executed based on a event on my database 

--Virtual table which are part of trigger

	--inserted  when a records is insered or updated a trigger 
	--deleted when a records is deleted  a trigger


	select * from inserted

--DML (Inserted update and delete)

Create database Demo


use DEmo 

Create table Employee
(
	eid  int , 
	fname  varchar(50),
	age int ,
	salary int
)

--LOg Table to capture the events related to the employee.
Create table emplog 
(
	id int identity (1,1),
	eid int ,
	oldsalary  int ,
	newsalary int ,
	DML varchar(100),
	changedate datetime
)


--Update Trigger 
create  trigger salcheck 
on employee
for  Update
as 

 insert into emplog (eid, oldsalary, newsalary ,dml, changedate)
 select d.eid ,d.salary ,i.salary ,'Update',getdate()

 from deleted d join inserted  i 
  on d.eid=i.eid 
  where d.salary<>i.salary




insert into employee values 
(11,'Alpha',21,2345),
(12,'beta',23,34555)


select * from employee

 update Employee 
 set salary =67800
 where eid =12


 select * from emplog

 --*****************************************************
 --Insert trigger 
	Create  trigger salcheckINsert 
	on employee
	for   insert
	as 

	 insert into emplog (eid, oldsalary, newsalary,DML , changedate)
	 select i.eid ,NUll ,i.salary ,'Inserted',getdate() from inserted i



--After trigger 

	 --Create trigger trigger name 
	 --on tablename 
	 --after (insert, update delete)
	 -- as 

	 -- begin 
		--insert into log table 

	 -- end 

--Instead of (before)

	 --Create trigger trigger name 
	 --on tablename 
	 --instead of  (insert, update delete)
	 -- as 

	 -- begin 
		--insert into log table 

	 -- end 
  --*****************************************************
--DDL Trigger 
--Table level (Insert, update , delete)


--DDL trigger 
--Database level trigger (Create_Table , alter_Table, drop_Table)
Create Table DDLLOG
(
	id int identity(1,1),
	eventdate datetime,
	eventytype nvarchar(100),
	objectname nvarchar(100),
	SQLtext nvarchar(max),
	sqlcomonly XMl
)

--DDL Trigger
Create trigger MontiorDB
on Database
FOr Create_Table , alter_Table, drop_Table
as 

 Declare @event xml 
 set @event=EVENTDATA()

  insert into DDLlog  (eventdate ,	eventytype ,objectname,	SQLtext,sqlcomonly )
  values (getdate(),@event.value('(/EVENT_INSTANCE/EventType)[1]','nvarchar(100)'),
  @event.value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(100)'),
  @event.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(100)'),
  @event)


Select * from DDLLOG


Create table test11211 
(
	id int identity (1,1),
	eid int ,
	oldsalary  int ,
	newsalary int ,
	DML varchar(100),
	changedate datetime
)

--*************************************************
Create table Customer 
(

cid  int,
cname varchar(100)
)


create table orders (
oid int ,
cid int ,
odate datetime,
amount int
)

Insert into Customer values 
(1,'david'),
(2,'john')

--- View 
Create view tempview 
as
select c.cid,c.cname,o.oid  ,o.odate,o.amount
from  Customer c join orders o
on c.cid=o.cid


select * from tempview
-- Instead of 
Create trigger splitdata 
on tempview
Instead   of insert
 as 
 Begin 

 --insert records into customer 
	 insert into customer(cid , CNAME)
	 select I.cid,i.cname  from inserted  i
--insert records into order
	 insert into orders (oid ,cid ,odate,amount)
	 select i.oid ,i.cid ,i.odate,i.amount from inserted  i


 end 


--tempview
insert into tempview(cid,cname,oid,odate,amount) values 
(101,'tested','222','2023-08-27',23456)

select * from tempview



select * from customer 

select * from orders
--***************************************************************

XML 


<Name>

Balgeet
</name>


create table xmldata 
(id int , 
book xml 

)

insert into xmldata values 
(1,
'<book>
	<title> game of thrones </title>
	<author> james </author> 
	<genre> fantasy </genre>
	<publish> 2000</publish>
</book>'
)

insert into xmldata values 
(2,
'<book>
	<title> game of thrones </title>
	<authorlist > 
		<authorfname >  jim </authorfname >
	</authorlist> 
	<authorlist > 
		<authorfname >  caryy </authorfname >
	</authorlist> 

	<genre> fantasy </genre>
	<publish> 2000</publish>
</book>'
)
\


select id ,
book.value ('(book/authorlist/authorfname)[1]','nvarchar(100)') as author,
book.value ('(book/authorlist/authorfname)[2]','nvarchar(100)') as author
from xmldata



select * from xmldata

select id ,
book.value ('(book/author)[1]','nvarchar(100)') as author

from xmldata

--**************************************************************
--Programing Constructs in SQl server 
--if

	IF condition
		-- Statements to execute if the condition is true
	ELSE
		-- Statements to execute if the condition is false


If 10=10

	print 'true'
 else 
	print 'false'

--If else If

	--IF condition1
		-- Statements to execute if condition1 is true
	--ELSE IF condition2
		-- Statements to execute if condition2 is true
	--ELSE IF condition3
		-- Statements to execute if condition3 is true
	--ELSE IF condition4
		-- Statements to execute if condition4 is true
	--ELSE
		-- Statements to execute if none of the conditions are true

 

If 10=110
	print 'true1'
else if 130=10
	print 'true2' 
else if 1230=10
	print 'true3'  
else
	print 'false '  --- find true exit loop

---
Create procedure  createtable (@id int )
as
begin 

	if @id =1
		Begin 
			
			Create table Customer	(
			cid  int,
			cname varchar(100)
			)
		end 
	else if @id =2
		Begin 
			
			create table orders (
			oid int ,
			cid int ,
			odate datetime,
			amount int			)
		End 
else 
print 'value is not in list which is higher than 2'

end 


exec createtable 1
exec createtable 2

exec createtable 3



if object_id('Customer','u') is not null
	begin 
		drop table Customer 
	end 
else 
	begin 
			Create table Customer	(
			cid  int,
			cname varchar(100)
			)
	end
--************************************************************
--Go 
--we call  batch operator 

	select * from customer
	go 10

	insert into customer values 
	(1,'alpha')
	go 100


Create database test
go
use test
go
Create table Customer	(id  int,cname varchar(100)	)
go
insert into customer values (1,'alpha')
go
select * from customer




sql statement 
go-- this is my 1 batch
sql statement 
go-- this is my 2 batch
sql statement 
go-- this is my 3 batch 


--************************************************************
--While 
	--WHILE condition
	--BEGIN
		-- Statements to be repeated
	--END;

While 1=1
	begin  

		 print 'true'
		 break
		  print 'this line is not executed'
	end
--Break 
--continue 
DEclare @counter int 
set @counter =1

While @counter <=10
	begin  

		 print 'true '+ Cast (@counter as varchar)
		 set @counter =@counter+ 1

	End 

--While using continue and break 

DEclare @count int 
set @count =1

While @count <=10
	Begin 
		--break 
			if @count=5
				begin
					break 
				end

		--Continue
			if @count %2=0
				begin					
					Print 'i am in counter'
					Continue
				end

		--
		PRINT 'Counter ' +Cast(@count as varchar)
		set @count  =@count +1

	end 

print 'counter ' +cast(1 as varchar)


--*****************************************************
--iif
--	iif(expression, True ,False)
	select eid,ename,gender,department,salary,
	iif(salary >=6300,'High salary', 'low salary')  as Comment 
	from employee order by salary asc


select iif(1=1,'True','false')  as Comment 


--Case	

	--CASE expression
	--	WHEN value1 THEN result1
	--	WHEN value2 THEN result2
	--	-- ...
	--	ELSE default_result
	--END;
	-- expression
	--	WHEN value1 THEN result1
	--	WHEN value2 THEN result2
	--	-- ...
	--	ELSE default_result
	--END;

	select eid,ename,gender,department,salary,
	Case
		when salary<5500 then 'Low salary '
		when salary between 5500 and 6500 then 'medium salary'
		when salary between 65 and 7500 then 'medium 2 salary'
		when salary>7500 then 'high salary'
		else 'salary not an integer'
	end as Comments 

	from employee order by salary asc



insert into employee(salary) values 
(null)



--Update using the case  and change the data using the 
update employee 
set salary =
Case
		when salary<5500 then salary * 3
		when salary between 5500 and 6500 then  salary * 2
		when salary between 65 and 7500 then  salary * 1.5
		when salary>7500 then  salary * .5
	end 


	select * from employee


--*************************************************************
--error handling 

--Self join 
--locking(lock block and deadlock)

--repeat topics 
	--Indexes (execution plan)


	select * from employee e1 join employee e2
	on e1.eid=e2.eid


	---employee manger table 
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ManagerID INT
);

INSERT INTO Employees1 (EmployeeID, FirstName, LastName, ManagerID)
VALUES (1, 'John', 'Doe', NULL),
       (2, 'Jane', 'Smith', 1),
       (3, 'Michael', 'Johnson', 1),
       (4, 'Emily', 'Williams', 2),
       (5, 'David', 'Brown', 3);

select * from employees1 


select
e1.FirstName as eFname,
e1.LastName	as eLname,
e2.FirstName as MFname,
e2.LastName	as MLname
 from employees1 e1 left join Employees1 e2
 on e1.ManagerID=e2.EmployeeID

 select
e1.FirstName as eFname,
e1.LastName	as eLname,
e2.FirstName as MFname,
e2.LastName	as MLname
 from employees1 e1  join Employees1 e2
 on e1.ManagerID=e2.EmployeeID





 select * from employee


 update employee set salary = 6000 where eid >10






 
 select salary ,count(salary) from employee
 group by salary 
 having count (salary)>1
 order by salary asc

 with ctes as 
 (
 select * ,
 row_number() over(partition by salary order by salary desc) as counts 
 from employee

 ) select  * from ctes where salary = 6000
