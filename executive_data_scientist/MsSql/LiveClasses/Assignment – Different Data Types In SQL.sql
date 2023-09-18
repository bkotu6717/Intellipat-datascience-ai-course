#Create table

-- 1. Create a customer table which comprises of these columns: ‘customer_id’,
-- ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
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

# 2. Insert 5 new records into the table
insert into customers VALUES
(1, 'Bhaskar', 'bkotu6717@gmail.com', 'k', '16/B', 'Chennai', 'TN', '600097'),
(1, 'Aravindan  ', 'aravindan@gmail.com', 'G', '16/A', 'Bangalore', 'KA', '600098'),
(1, 'Devesh', 'devesh@f22labs.com', 'm', '16/C', 'Mumbai', 'MH', '600099'),
(1, 'Sriram', 'sriram@f22labs.com', 'K', '16/D', 'Chennai', 'TN', '500097'),
(1, 'Taha', 'tata@f22labs.com', 'MD', '16/E', 'Hyderabad', 'TS', '10001')

-- 3. Select only the ‘first_name’ and ‘last_name’ columns fromthe customer table
	Select 
		first_name, 
		last_name 
	FROM Customers
-- 4. Select those records where ‘first_name’ starts with “G” and city is ‘SanJose’. 
	Select
		*
	FROM Customers
	where first_name like 'G%' and city = 'sanjose'
-- 5. Select those records where Email has only ‘gmail’. 
	Select
		*
	FROM Customers
	where email like '%@gmail.com'
-- 6. Select those records where the ‘last_name’ doesn't end with “A”.
	Select
		*
	FROM Customers
	where last_name not like '%A'
