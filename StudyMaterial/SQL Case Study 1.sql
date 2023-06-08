
-- Problem Statement:
-- You are a database administrator. You want to use the data to answer a few
-- questions about your customers, especially about the sales and profit coming
-- from different states, money spent in marketing and various other factors such as
-- COGS, budget profit etc. You plan on using these insights to help find out which
-- items are being sold the most. Additionally you need help to generate some basic
-- datasets so your team can easily inspect the data without needing to use SQL.
-- You have been provided with the sample of the overall customer data due to
-- privacy issues. But you hope that these samples are enough for you to write fully
-- functioning SQL queries to help answer the questions.
-- Dataset:
-- The 3 key datasets for this case study:
-- a. FactTable: The FactTable has 13 columns mentioned below and 4200
-- rows. Profit, Margin, Sales, COGS, Total Expenses, Marketing, Inventory,
-- Budget, Profit, Budget COGS, Budget Margin, Budget Sales, Area Code,
-- and ProductID
-- Note: COGS stands for Cost of Goods Sold
-- b. ProductTable: The ProductTable has four columns named Product Type,
-- Product, ProductID, and Type. It has 13 rows which can be broken down
-- into further details to retrieve the information mentioned in the FactTable.
-- c. LocationTable: Finally, the LocationTable has 156 rows and follows a
-- similar approach to ProductTable. It has four columns named Area Code,
-- State, Market, and Market Size.

-- 1. Display the number of states present in the LocationTable.
    SELECT COUNT(DISTINCT STATE) AS NUMBER_OF_STATES FROM Locations;

-- 2. How many products are of regular type?
    SELECT COUNT(*) AS REGULAR_TYPE_PRODUCTCS_COUNT FROM Products WHERE TYPE= 'REGULAR';

-- 3. How much spending has been done on marketing of product ID 1?
    SELECT SUM(Marketing) AS PRODUCT_1_MARKETING_EXPENSE FROM FACTS
    WHERE ProductID = 1;

-- 4. What is the minimum sales of a product?
    -- PER PRODCT WITH MIN SALE
    SELECT FACTS.PRODUCTID, MIN(SALES) AS MIN_SALE FROM PRODUCTS
    INNER JOIN FACTS ON PRODUCTS.PRODUCTID = FACTS.PRODUCTID
    GROUP BY FACTS.PRODUCTID

    -- TOP 1 PRODUCT WITH MIN SALE
    SELECT TOP 1 FACTS.PRODUCTID, MIN(SALES) AS MIN_SALE FROM PRODUCTS
    INNER JOIN FACTS ON PRODUCTS.PRODUCTID = FACTS.PRODUCTID
    GROUP BY FACTS.PRODUCTID

-- 5. Display the max Cost of Good Sold (COGS).
    SELECT MAX(COGS) AS [max Cost of Good Sold] FROM FACTS;

-- 6. Display the details of the product ID where product type is coffee.
    SELECT * FROM PRODUCTS WHERE PRODUCT_TYPE = 'COFFEE';

-- 7. Display the details where total expenses are greater than 40.
    SELECT * FROM FACTS WHERE TOTAL_EXPENSES > 40;

-- 8. What is the average sales in area code 719?
    SELECT AVG(SALES) [average sales in area code 719] FROM FACTS WHERE AREA_CODE = 719;

-- 9. Find out the total profit generated by Colorado state.
    SELECT 
        SUM(F.PROFIT) [total profit generated by Colorado state] 
    FROM FACTS F
    INNER JOIN LOCATIONS L ON F.AREA_CODE = L.AREA_CODE
    WHERE L.STATE = 'Colorado';

-- 10. Display the average inventory for each product ID.
    SELECT PRODUCTID, AVG(Inventory) [average inventory] FROM FACTS
    GROUP BY PRODUCTID;

-- 11. Display state in a sequential order in a LocationTable.
    SELECT * FROM LOCATIONS ORDER BY STATE;

-- 12. Display the average budget margin where the average budget margin should be greater than 100.
    
    -- JUST BUDGET MARGINS WHERE BUDGET MARGINS IS MORE THAN THE AVG BUDGET MARGIN
    SELECT BUDGET_MARGIN FROM FACTS WHERE BUDGET_MARGIN > (SELECT AVG(BUDGET_MARGIN) FROM FACTS);

    -- BUDGET_MARGIN AVG ABOVE 100 PER PRODUCT
    SELECT PRODUCTID, AVG(BUDGET_MARGIN) AVG_BUDGET_MARGIN_PER_PRODUCT FROM FACTS 
    GROUP BY PRODUCTID
    HAVING AVG(BUDGET_MARGIN) > 100

-- 13. What is the total sales done on date 2010-01-01?
    SELECT SUM(SALES) AS [total sales done on date 2010-01-01] FROM FACTS 
    WHERE [DATE] = '2010-01-01';

-- 14. Display the average total expense of each product ID on an individual date.
    SELECT PRODUCTID, [DATE], AVG(TOTAL_EXPENSES) AS [average total expense]  FROM FACTS
    GROUP BY PRODUCTID, [DATE];

-- 15. Display the table with the following attributes such as date, product ID, product_type, product, sales, profit, state, area_code.
    SELECT 
        [Date] AS [DATE],
        P.PRODUCTID,
        P.PRODUCT_TYPE,
        P.PRODUCT,
        F.SALES,
        F.PROFIT,
        L.STATE,
        L.AREA_CODE
    FROM FACTS F 
    INNER JOIN PRODUCTS P ON P.PRODUCTID = F.PRODUCTID
    INNER JOIN LOCATIONS L ON F.AREA_CODE = L.AREA_CODE

-- 16. Display the rank without any gap to show the sales wise rank.
    SELECT SALES, RANK() OVER (ORDER BY SALES DESC) AS sales_rank FROM Facts;

-- 17. Find the state wise profit and sales.
    SELECT L.STATE, SUM(F.SALES) AS [SALES], SUM(F.PROFIT) AS [PROFIT] FROM LOCATIONS L
    INNER JOIN FACTS F ON L.AREA_CODE = F.AREA_CODE
    GROUP BY L.STATE

 
-- 18. Find the state wise profit and sales along with the product name.
    SELECT  
        L.STATE, 
        P.PRODUCT, 
        SUM(F.SALES) AS [SALES], 
        SUM(F.PROFIT) AS [PROFIT] 
    FROM LOCATIONS L
    INNER JOIN FACTS F ON L.AREA_CODE = F.AREA_CODE
    INNER JOIN PRODUCTS P ON F.PRODUCTID = P.PRODUCTID
    GROUP BY L.STATE, P.PRODUCT
    ORDER BY L.STATE
-- 19. If there is an increase in sales of 5%, calculate the increased sales.
    SELECT SALES, SALES+(SALES*(0.05)) AS [increase in sales of 5%] FROM FACTS;

-- 20. Find the maximum profit along with the product ID and product type.
    -- FOR EVERY PRODUCT
    SELECT  
        P.PRODUCTID,
        P.PRoduct_type,
        MAX(F.PROFIT) AS [MAX PROFIT] 
    FROM FACTS F
    INNER JOIN PRODUCTS P ON F.PRODUCTID = P.PRODUCTID
    GROUP BY P.PRODUCTID, P.PRoduct_type
    ORDER BY MAX(F.PROFIT) DESC

    -- FOR THE TOP PROFIT PRODUCT
    SELECT  TOP 1
        P.PRODUCTID,
        P.PRoduct_type,
        MAX(F.PROFIT) AS [MAX PROFIT] 
    FROM FACTS F
    INNER JOIN PRODUCTS P ON F.PRODUCTID = P.PRODUCTID
    GROUP BY P.PRODUCTID, P.PRoduct_type
    ORDER BY MAX(F.PROFIT) DESC

-- 21. Create a stored procedure to fetch the result according to the product type from ProductTable.
    CREATE PROCEDURE PRODUCTS_PROC(@PRODUCT_TYPE VARCHAR(100)) AS SELECT * FROM Products WHERE Product_Type = @PRODUCT_TYPE;
    EXEC DBO.PRODUCTS_PROC @PRODUCT_TYPE = 'HERBAL TEA'

-- 22. Write a query by creating a condition in which if the total expenses is less than 60 then it is a profit or else loss.
    SELECT 
        TOTAL_EXPENSES,
        (
        CASE
            WHEN (TOTAL_EXPENSES < 60) THEN 'PROFT'
            WHEN (TOTAL_EXPENSES >= 60) THEN 'LOSS'
            ELSE 'BALANCED'
        END
        ) AS [PROFIT OR LOSS]
    FROM FACTS;

-- 23. Give the total weekly sales value with the date and product ID details. Use roll-up to pull the data in hierarchical order.
    SELECT 
        [Date], 
        [PRODUCTID], 
        SUM(WEEKLY_SALES) [SUM_OF_WEEKLY_SALES_BY_DATE_AND_PRODUCT_ID] 
    FROM
        (
            SELECT 
                [DATE], 
                PRODUCTID, SUM(SALES) AS WEEKLY_SALES 
            FROM FACTS
            GROUP BY [Date], PRODUCTID, DATENAME(WEEKDAY, [Date])
        ) 
    TEMP GROUP BY ROLLUP([Date], [PRODUCTID]);


-- 24. Apply union and intersection operator on the tables which consist of attribute area code.
    -- UNION
    SELECT L.AREA_CODE FROM LOCATIONS L
    UNION
    SELECT F.AREA_CODE FROM FACTS F

    -- UNION ALL
    SELECT L.AREA_CODE FROM LOCATIONS L
    UNION ALL
    SELECT F.AREA_CODE FROM FACTS F

    -- INTERSECT
    SELECT L.AREA_CODE FROM LOCATIONS L
    INTERSECT
    SELECT F.AREA_CODE FROM FACTS F

-- 25. Create a user-defined function for the product table to fetch a particular product type based upon the user’s preference.
    CREATE FUNCTION PRODUCTTABLE(@PRD_TYPE VARCHAR(100))
    RETURNS TABLE
    AS
    RETURN(
        SELECT * FROM Products WHERE Product_Type = @PRD_TYPE
    );

    SELECT * FROM PRODUCTTABLE ('Coffee');

-- 26. Change the product type from coffee to tea where product ID is 1 and undo it.
    BEGIN TRANSACTION
       UPDATE Products SET Product_Type = 'Tea' WHERE Product_Type = 'Coffee'
    ROLLBACK;

-- 27. Display the date, product ID and sales where total expenses are between 100 to 200.
    SELECT [Date], PRODUCTID, SALES FROM FACTS 
    WHERE TOTAL_EXPENSES BETWEEN 100 AND 200
    ORDER BY SALES
 
-- 28. Delete the records in the ProductTable for regular type.
    DELETE FROM Products WHERE Product_Type = 'REGULAR'

-- 29. Display the ASCII value of the fifth character from the column Product.
    SELECT 
        Product, 
        SUBSTRING(Product, 5, 1) AS [5TH CHARACTER], 
        ASCII(SUBSTRING(Product, 5, 1)) AS [ASCII]
    FROM Products

