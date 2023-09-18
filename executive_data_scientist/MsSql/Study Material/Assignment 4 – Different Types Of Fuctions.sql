

CREATE TABLE CUSTOMERS(
    CUSTOMER_ID INTEGER PRIMARY KEY IDENTITY(1,1),
    FIRST_NAME VARCHAR(100),
    LAST_NAME VARCHAR(100)
)
INSERT INTO CUSTOMERS VALUES('BHASKAR', 'K')
INSERT INTO CUSTOMERS VALUES('PRIYA', 'M')
INSERT INTO CUSTOMERS VALUES('LASYA', 'K')
INSERT INTO CUSTOMERS VALUES('DEVANSH', 'K')

CREATE TABLE ORDERS (
    ORDER_ID INTEGER PRIMARY KEY IDENTITY(1,1),
    ORDER_DATE DATETIME,
    AMOUNT DECIMAL(10,2),
    CUSTOMER_ID INTEGER FOREIGN KEY REFERENCES CUSTOMERS(CUSTOMER_ID) 
)

INSERT INTO ORDERS VALUES ('2023-06-01', 1000, 1)
INSERT INTO ORDERS VALUES ('2023-06-01', 1500, 2)
INSERT INTO ORDERS VALUES ('2023-06-02', 1600, 3)
INSERT INTO ORDERS VALUES ('2023-06-03', 1700, 2)
INSERT INTO ORDERS VALUES ('2023-06-04', 1800, 2)
    
-- Tasks To Be Performed:
-- 1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders table
    SELECT MIN(AMOUNT) as MIN_AMOUNT, MAX(AMOUNT) AS MAX_AMOUNT, AVG(AMOUNT) AS AVG_AMOUNT FROM ORDERS;

-- 2. Create a user-defined function which will multiply the given number with 10
    CREATE FUNCTION multiply(@var INT)
    RETURNS INT
    AS
    BEGIN
        RETURN(@var * 10)
    END

    SELECT dbo.multiply(20);

-- 3. Use the case statement to check if 100 is less than 200, greater than 200, or equal to 200 and print the corresponding value
    SELECT 
    CASE
    WHEN 100 < 200 THEN '100 < 200'
    WHEN 100 > 200 THEN '100 > 200'
    ELSE 'They are equal'
    END
    AS [100 VS 200]
-- 4. Using a case statement, find the status of the amount. Set the status of theamount as high amount, low amount or medium amount based up on the condition.
    SELECT (
        case
            when amount <= 1000 then 'low amount'
            when amount BETWEEN 1001 and 1500 then 'medium amount'
            when amount >= 1500 then 'high amount'
        end
        ) as [amount status] 
    FROM ORDERS

-- 5. Create a user-defined function, to fetch the amount greater than then given input
    CREATE FUNCTION fetch_amount_greater_than_given(@var INT)
    RETURNS TABLE
    AS
    RETURN(
        select AMOUNT from ORDERS where AMOUNT > @var
    )

    select top 1 AMOUNT from fetch_amount_greater_than_given(1000)

