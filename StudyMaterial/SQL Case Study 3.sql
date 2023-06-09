

-- 1. Display the count of customers in each region who have done the transaction in the year 2020.
    SELECT
        Cnt.region_name,
        COUNT(*) as [No Of Customers] 
    FROM Customers Cst
    LEFT JOIN Continent Cnt ON Cst.region_id = Cnt.region_id
    LEFT JOIN [Transaction] T ON T.customer_id = Cst.customer_id
    WHERE YEAR(T.txn_date) = 2020
    GROUP BY Cnt.region_name
    
-- 2. Display the maximum and minimum transaction amount of each transaction type.
    SELECT 
        T.txn_type,
        MAX(T.txn_amount) AS MAX_TRANSACTION_AMOUNT,
        MIN(T.txn_amount) AS MIN_TRANSACTION_AMOUNT
    FROM [Transaction] T
    GROUP BY T.txn_type;

-- 3. Display the customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.
    SELECT 
        T.customer_id,
        Cnt.region_name,
        T.txn_amount
    FROM [Transaction] T
    INNER JOIN Customers Cst ON T.customer_id = Cst.customer_id
    INNER JOIN Continent Cnt ON Cst.region_id = Cnt.region_id
    WHERE T.txn_type = 'Deposit'
    AND T.txn_amount > 2000

-- 4. Find duplicate records in the Customer table.

    WITH CTE AS
        (   
            SELECT 
                ROW_NUMBER() OVER(PARTITION BY cst1.customer_id ORDER BY cst1.customer_id ASC) AS [ROW NUMBER], 
                cst1.customer_id
            FROM Customers cst1
        )
    SELECT [ROW NUMBER], CTE.customer_id FROM CTE WHERE [ROW NUMBER] > 1;
    
-- 5. Display the customer id, region name, transaction type and transaction amount for the minimum transaction amount in deposit.
    SELECT 
        T.customer_id,
        Cnt.region_name,
        T.txn_type,
        T.txn_amount
    FROM [Transaction] T
    INNER JOIN Customers Cst ON T.customer_id = Cst.customer_id
    INNER JOIN Continent Cnt ON Cst.region_id = Cnt.region_id
    WHERE T.txn_type = 'Deposit'
    AND T.txn_amount = (
        SELECT MIN(txn_amount)
        FROM [Transaction] WHERE [Transaction].txn_type = 'Deposit'
    )
 -- 6. Create a stored procedure to display details of customers in the Transaction table where the transaction date is greater than Jun 2020.
    CREATE PROCEDURE TRANSACTIONS_2020_LATER AS (
        SELECT * FROM [Transaction] WHERE YEAR([Transaction].txn_date) > 2020
    )
    EXEC DBO.TRANSACTIONS_2020_LATER

-- 7. Create a stored procedure to insert a record in the Continent table.
    CREATE PROCEDURE INSERT_CONTINET(@REG_ID INTEGER, @REG_NAME VARCHAR(100)) 
    AS 
    INSERT INTO Continent VALUES (@REG_ID, @REG_NAME)
    
    EXEC DBO.INSERT_CONTINET @REG_ID = 6 , @REG_NAME = 'North America'


-- 8. Create a stored procedure to display the details of transactions that happened on a specific day.
    CREATE PROCEDURE transaction_details_on(@txn_date DATE) 
    AS 
    SELECT * FROM [Transaction] WHERE [Transaction].txn_date = @txn_date

    EXEC DBO.transaction_details_on @txn_date = '2020-01-10'

-- 9. Create a user defined function to add 10% of the transaction amount in a table.
    CREATE FUNCTION fn_ten_percent_addition(@PERCENT INTEGER)
    RETURNS TABLE
    AS
    RETURN (
        UPDATE [Transaction] SET txn_amount = ( txn_amount + (txn_amount*0.1) )
        GO
        SELECT * FROM [Transaction]
    )

    DROP FUNCTION fn_ten_percent_addition
-- 10. Create a user defined function to find the total transaction amount for a given transaction type.
    CREATE FUNCTION total_transaction_amount(@TXN_TYPE VARCHAR(100))
    RETURNS TABLE
    AS
    RETURN(
        SELECT * FROM [Transaction] WHERE txn_type = @TXN_TYPE
    );
    SELECT * FROM total_transaction_amount ('DEPOSIT');

-- 11. Create a table value function which comprises the columns customer_id, region_id ,txn_date , txn_type , 
    -- txn_amount which will retrieve data from the above table.
    CREATE FUNCTION fn_txn_data()
    RETURNS TABLE
    AS
    RETURN(
        SELECT 
            Cst.customer_id, 
            Cnt.region_id, 
            T.txn_date, 
            T.txn_type, 
            T.txn_amount 
        FROM [Transaction] T
        INNER JOIN Customers Cst ON Cst.customer_id = T.customer_id
        INNER JOIN Continent Cnt ON Cnt.region_id = Cst.customer_id
    );
    SELECT * FROM fn_txn_data();

-- 12. Create a TRY...CATCH block to print a region id and region name in a single column.
        
    BEGIN TRY
        SELECT Continent.region_id FROM Continent
        UNION ALL
        SELECT Continent.region_name FROM Continent
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

-- 13. Create a TRY...CATCH block to insert a value in the Continent table.
    BEGIN TRY
        INSERT INTO Continent VALUES(1, 'Antarctica')
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

-- 14. Create a trigger to prevent deleting a table in a database.
-- 15. Create a trigger to audit the data in a table.
-- 16. Create a trigger to prevent login of the same user id in multiple pages.

-- 17. Display top n customers on the basis of transaction type.
    WITH CTE AS
    ( 
        SELECT 
            T.customer_id, 
            T.txn_type, 
            COUNT(*) as [transactions]
        FROM [Transaction] T
        GROUP BY T.customer_id, T.txn_type
    ) 
    SELECT TOP 10 * FROM CTE WHERE CTE.txn_type = 'PURCHASE' ORDER BY CTE.transactions DESC    

-- 18. Create a pivot table to display the total purchase, withdrawal and deposit for all the customers.
   SELECT * FROM
        (
            SELECT 
                T.customer_id, 
                T.txn_type, 
                T.txn_amount
            FROM [Transaction] T
        ) Customer_Transactiions
        PIVOT(
            SUM(Customer_Transactiions.txn_amount)
            FOR Customer_Transactiions.txn_type
            IN(
                [DEPOSIT],
                [WITHDRAWAL],
                [PURCHASE]
            )
        ) 
    AS PivotTable

