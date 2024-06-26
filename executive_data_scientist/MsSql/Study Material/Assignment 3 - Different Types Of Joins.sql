

-- Tasks To Be Performed:
-- 1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’,‘order_date’, ‘amount’, ‘customer_id’

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


    SELECT * FROM CUSTOMERS
    SELECT * FROM ORDERS

-- 2. Make an inner join on ‘Customer’ and ‘Order’ tables on the ‘customer_id’ column
    SELECT * FROM CUSTOMERS C
    INNER JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID

-- 3. Make left and right joins on ‘Customer’ and ‘Order’ tables on the ‘customer_id’ column
    SELECT * FROM CUSTOMERS C
    LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID

    SELECT * FROM CUSTOMERS C
    RIGHT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID

-- 4. Update the ‘Orders’ table and set the amount to be 100 where ‘customer_id’ is 3
    UPDATE ORDERS SET AMOUNT = 100 WHERE CUSTOMER_ID = 3

-- 5. Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column.
    SELECT * FROM CUSTOMERS C
    FULL OUTER JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID

