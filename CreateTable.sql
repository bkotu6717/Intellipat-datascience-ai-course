Create table

CREATE TABLE customers (
    customer_id INTEGER, 
    first_name VARCHAR(100), 
    email VARCHAR(100), 
    last_name VARCHAR(100), 
    [address] VARCHAR(100), 
    city VARCHAR(100),
    [state] VARCHAR(100),
    zip VARCHAR(6)
)

# Insert 5 records
insert into customers VALUES
(1, 'Bhaskar', 'bkotu6717@gmail.com', 'k', '16/B', 'Chennai', 'TN', '600097'),
(1, 'Aravindan  ', 'aravindan@gmail.com', 'G', '16/A', 'Bangalore', 'KA', '600098'),
(1, 'Devesh', 'devesh@f22labs.com', 'm', '16/C', 'Mumbai', 'MH', '600099'),
(1, 'Sriram', 'sriram@f22labs.com', 'K', '16/D', 'Chennai', 'TN', '500097'),
(1, 'Taha', 'tata@f22labs.com', 'MD', '16/E', 'Hyderabad', 'TS', '10001')

# select all tje records
select * from customers;

# Select all the customers where first name starts with S and city is Chennai
SELECT * FROM customers WHERE first_name like 'S%' AND city = 'Chennai';
