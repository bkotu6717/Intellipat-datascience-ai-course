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
-- 1. Arrange the ‘Orders’ dataset in decreasing order of amount
    SELECT * FROM ORDERS ORDER BY AMOUNT DESC;

-- 2. Create a table with the name ‘Employee_details1’ consisting of thesecolumns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. 

    CREATE TABLE Employee_details1(
        EMP_ID INTEGER,
        EMP_NAME VARCHAR(100),
        EMP_SALARY DECIMAL(10,2)
    )
    INSERT INTO Employee_details1 VALUES (1, 'BHASKAR', 1000)
    INSERT INTO Employee_details1 VALUES (2, 'ARAVINDAN', 2000)
    INSERT INTO Employee_details1 VALUES (3, 'BINJU', 3000)
    INSERT INTO Employee_details1 VALUES (4, 'DEVESH', 4000)
    INSERT INTO Employee_details1 VALUES (5, 'VIGNESH', 5000)

     -- Create another table withthe name ‘Employee_details2’ consisting of the same columns as the firsttable.

    SELECT * INTO Employee_details2  FROM  Employee_details1 

-- 3. Apply the UNION operator on these two tables
    SELECT * FROM Employee_details1
    UNION
    SELECT * FROM Employee_details2

    SELECT * FROM Employee_details1
    UNION ALL
    SELECT * FROM Employee_details2

-- 4. Apply the INTERSECT operator on these two tables
    SELECT * FROM Employee_details1
    INTERSECT
    SELECT * FROM Employee_details2

-- 5. Apply the EXCEPT operator on 
    SELECT * FROM Employee_details1
    EXCEPT
    SELECT * FROM Employee_details2
