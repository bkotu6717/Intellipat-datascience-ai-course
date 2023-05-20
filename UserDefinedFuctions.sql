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
