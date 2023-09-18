


CREATE TABLE CUSTOMERS (
  customer_id INTEGER, 
  first_name VARCHAR(100), 
  email VARCHAR(100), 
  last_name VARCHAR(100), 
  [address] VARCHAR(100), 
  city VARCHAR(100),
  [state] VARCHAR(100),
  zip VARCHAR(6)
)

-- Insert 5 records
TRUNCATE table CUSTOMERS
INSERT INTO CUSTOMERS VALUES
(1, 'Bhaskar', 'bkotu6717@gmail.com', 'k', '16/B', 'San jose', 'TN', '600097'),
(1, 'Aravindan  ', 'aravindan@gmail.com', 'G', '16/A', 'Bangalore', 'KA', '600098'),
(1, 'Devesh', 'devesh@f22labs.com', 'Jordan', '16/C', 'San jose', 'MH', '600099'),
(1, 'Sriram', 'sriram@f22labs.com', 'Jordan', '16/D', 'Chennai', 'TN', '500097'),
(1, 'Taha', 'tata@f22labs.com', 'MD', '16/E', 'San jose', 'TS', '10001')

-- Tasks To Be Performed:
-- 1. Create a view named ‘customer_san_jose’ which comprises of only those customers who are from San Jose
    CREATE VIEW customer_san_jose
    AS
    SELECT * FROM customers WHERE CITY = 'SAN JOSE'

-- 2. Inside a transaction, update the first name of the customer to Francis where the last name is Jordan:
    BEGIN TRANSACTION
        UPDATE CUSTOMERS SET FIRST_NAME = 'Francis' WHERE LAST_NAME = 'Jordan'
    COMMIT

-- a. Rollback the transaction
   DECLARE @TransactionName VARCHAR(20) = 'Transaction1';  
  
    BEGIN TRAN @TransactionName  
        UPDATE CUSTOMERS SET FIRST_NAME = 'Francis' WHERE LAST_NAME = 'Jordan'
    ROLLBACK TRAN @TransactionName; 

-- b. Set the first name of customer to Alex, where the last name is Jordan
    BEGIN TRANSACTION
        UPDATE CUSTOMERS SET FIRST_NAME = 'Alex' WHERE LAST_NAME = 'Jordan'
    COMMIT

-- 3. Inside a TRY... CATCH block, divide 100 with 0, print the default error message

    BEGIN TRY
    SELECT 100/0
    END TRY
    BEGIN CATCH
      SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_STATE() AS ErrorState,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
