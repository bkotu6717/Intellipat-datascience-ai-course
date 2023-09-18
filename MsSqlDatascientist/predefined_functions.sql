

-- Single quote is for string literal
SELECT 'Hello World 123'
 
-- SELECT "Hello World 123" will not work but with single quote works
-- SELECT CONCAT("hello", 'Welcome') will not work

-- Double quote is for Database Identifiers like table name, column name
SELECT * from "emp"
SELECT "empid", "ename", "eage", "dob" from "emp"



SELECT COUNT('Hello World 123') as COUNT_FN
SELECT Len('Hello World 123') as LEN_FN
SELECT CONCAT('hello', 'Welcome')

SELECT LEN(NULL) -- Gives NULL

SELECT TRIM('    jksddsdksj sd sd     ') as [TRIM] -- Trims at both ends
SELECT RTRIM('   jksddsdksj sd sd     ') as [RTRIM] -- Trims Right side
SELECT LTRIM('   jksddsdksj sd sd     ') as [LTRIM] -- Trims Left side


SELECT UPPER('Bhaskar') -- Converts to upper case
SELECT Lower('Bhaskar') -- Lower case

SELECT LEFT('Bhaskar', 1) -- Get first left character from string
SELECT LEFT('Bhaskar', 2) -- Get first 2 left character from string

SELECT RIGHT('Bhaskar', 1) -- Get first left character from string
SELECT RIGHT('Bhaskar', 2) -- Get first 2 left character from string

-- Reverse fuction
SELECT REVERSE('Bhaskar');

-- replace function
-- REPLACE('Old value', 'Find word or letter', 'replace with vaue')
SELECT REPLACE('Bhaskar K', 'K', 'G')
UPDATE emp SET ename = REPLACE(ename, 'i', 'I')

-- STUFF('Search string', starting_position, number_of_characters_to_be_removed, 'replace string')
-- INSERTs at given position
SELECT STUFF('Bha  skar', 1, 3, 'ahb')
SELECT STUFF('1234',4,0, 'Hello') -- Replace letter 4 position with Hello and move letter 4 to end
SELECT STUFF('1234',4,1, 'Hello') -- Removes 4 and replaces with Helloe

SELECT 'Smith Jane', STUFF('Smith Jane', 6,0, ' JR')

SELECT TOP (1000) [FirstName], [LastName],
CONCAT([FirstName], ' JR ', [LastName])
FROM [AdventureWorks2022].[Person].[Person]

  
SELECT PARSENAME('hello.sql.class', 1) -- Gets the first word from last
SELECT PARSENAME('hello.sql.class', 2) -- Gets the 2nd word from last
SELECT PARSENAME('hello.sql.class', 3) -- Gets the 3rd word from last

SELECT PARSENAME('hello,sql,class', 1) -- Wont work for comma seperator, works for only .
-- If you have anyother delimeter other than . we need to convert to . and then apply the parse name method

SELECT PARSENAME(
    replace('hello,sql,class', ',', '.'),
    1
)

SELECT PARSENAME(
    replace('hello,sql,class', ',', '.'),
    2
)

SELECT PARSENAME(
    replace('hello,sql,class', ',', '.'),
    3
)

-- Get the index of Letter K from given string
SELECT CHARINDEX('K', 'Bhaskar')


-- Date and Time functions

-- Get currnet system date and time
SELECT SYSDATETIME(); -- Gives with milliseconds upto 7 precisions
SELECT GETDATE(); -- Gives without milliseconds upto 3 precisions
SELECT GETUTCDATE(); -- Gives UTC date and time

-- Get Year from a date
SELECT GETDATE(), YEAR(GETDATE()) AS YEAR;
SELECT GETDATE(), MONTH(GETDATE()) AS MONTH;
SELECT GETDATE(), DAY(GETDATE()) AS Days;

-- PARSE DATE OBJECT WITH DATEPART
SELECT DATEPART(YEAR, GETDATE()) AS [YEAR]
SELECT DATEPART(MONTH, GETDATE()) as [MONTH]
SELECT DATEPART(DAY, GETDATE()) as [Day]
SELECT DATEPART(HOUR, GETDATE()) as [HOUR]
SELECT DATEPART(MINUTE, GETDATE()) as [MINUTE]
SELECT DATEPART(MILLISECOND, GETDATE()) as [MILLISECOND]
SELECT DATEPART(WEEKDAY, GETDATE()) as [WEEKDAY]
SELECT DATEPART(WEEK, GETDATE()) as [WEEK]
SELECT DATEPART(DAYOFYEAR, GETDATE()) as [DAYOFYEAR]
SELECT DATEPART(QUARTER, GETDATE()) as [QUARTER]


SELECT GETDATE();
DECLARE @start_date DATETIME;
DECLARE @end_date DATETIME;
SET @start_date = '2023-08-19 07:19:30.130'
SET @end_date = '2021-06-12 03:18:50.160'
SELECT DATEDIFF(YEAR, @end_date, @start_date) AS [YEAR];
SELECT DATEDIFF(MONTH,@end_date, @start_date);
SELECT DATEDIFF(Day, @end_date, @start_date);
SELECT DATEDIFF(QUARTER, @end_date, @start_date);
SELECT DATEDIFF(HOUR, @end_date, @start_date);
SELECT DATEDIFF(MINUTE, @end_date, @start_date);


SELECT TOP (1000) [FirstName], [LastName]
  FROM [AdventureWorks2022].[Person].[Person]

-- Converstion fuctions

SELECT ASCII(1)
SELECT ASCII('a')
SELECT ASCII('B')

SELECT CAST(1 as varchar) + 'a' - Allows 1 to be VARCHAR
SELECT CAST('A' as int) -- Wont allow A to be Int type

SELECT CAST(1.34 as int)
SELECT CAST(1 as float)


SELECT CAST(GETDATE() as varchar)

select CONVERT(varchar, GETDATE(), 1)



DECLARE @Counter INT
SET @Counter=1
WHILE ( @Counter <= 130)
BEGIN TRY
    SELECT CONVERT(varchar, GETDATE(), @Counter)
    SET @Counter  = @Counter  + 1
END TRY

BEGIN CATCH
PRINT 'Date param ' + CAST(@Counter AS varchar) + ' is not there'
END CATCH

select convert(varchar, getdate(), 100)
-- Creates date object
select DATETIMEFROMPARTS(2023, 8, 23,1,2,3,0)
select DATEFROMPARTS(2023,8,23)
