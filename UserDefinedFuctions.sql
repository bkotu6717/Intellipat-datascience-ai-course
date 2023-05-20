-- 1. use inbuilt functons and find min and max from orders table
SELECT MIN(amount) as [MIN ORDER], MAX(amount) AS [MAX ORDER] FROM orders;

-- 2. Create a user defined function which will multiply given number with 10
-- Specify DBO to call user defined FUNCTIONs
CREATE FUNCTION multiply10(@var INT)
RETURNS INT
as
BEGIN
    RETURN(@var * 10)
END

select dbo.multiply10(20);

CREATE FUNCTION multiply(@var INT, @var2 INT)
RETURNS INT
as
BEGIN
    RETURN(@var * @var2)
END

select dbo.multiply(20, 11);


-- Use case statement to check if a given value is greater than 100 or less than 100

select
case 
when 100 > 200 then '100 is greater than 200' 
when 100 < 200 then '100 is less than 200' 
else '100 is equal to 200' 
END
