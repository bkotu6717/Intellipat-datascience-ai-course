CREATE TABLE orders(order_id INTEGER, order_date Date, amount DECIMAL(8,2), customer_id INTEGER);
INSERT into orders VALUES(1, '2022-07-19', 2000, 1);
INSERT into orders VALUES(1, '2022-02-19', 7000, 1);
INSERT into orders VALUES(1, '2022-01-19', 11000, 1);

INSERT into orders VALUES(2, '2022-08-31', 2000, 2);
INSERT into orders VALUES(3, '2022-09-20', 3000, 3);
INSERT into orders VALUES(4, '2022-10-31', 4000, 4);
INSERT into orders VALUES(5, '2022-08-31', 5000, 5);
INSERT into orders VALUES(6, '2022-08-31', 5000, 8);
INSERT into orders VALUES(7, '2022-08-31', 5000, 9);


SELECT * from customers inner JOIN orders on orders.customer_id = customers.customer_id; 
SELECT * from customers LEFT JOIN orders on orders.customer_id = customers.customer_id;
SELECT * from customers RIGHT JOIN orders on orders.customer_id = customers.customer_id;
SELECT * from customers FULL JOIN orders on orders.customer_id = customers.customer_id;

# CROSS join dont require condition
SELECT * from customers CROSS JOIN orders;
