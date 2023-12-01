#1. Get number of orders by its status

#2. Get the customer names who have placed an order after 31 Dec 2004

#3. Get the country with the highest number of orders and its order count

#4. Get the list of all customerNumber, customer names who have not placed an order

#5. Get the number of orders by customer category (credit limit category)

#6. Get total revenue by customerNumber & customerName
	#6.1 Get the customer name of the customer with second highest revenue

#7. Get total revenue by country

SELECT * FROM customers;
SELECT * FROM orders;

SELECT country, count(OrderNumber) as count_orders
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY country
ORDER BY count(OrderNumber) DESC
LIMIT 1;




SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM orderdetails;


SELECT country, SUM(quantityOrdered*priceEach) AS revenue
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY country
HAVING revenue>1000000
ORDER BY revenue DESC







































#1. Get number of orders that has shipped by status of shipping
SELECT status, count(*) FROM orders
GROUP BY status;

#2. Get the customer names who have placed at least one order after 31st Dec 2004
SELECT * FROM customers c
JOIN orders o on c.customernumber = o.customernumber
WHERE orderDate>"2004-12-31"
ORDER BY 1;

#3. Get the country with the highest number of orders and its order count
SELECT country, count(*) as order_count FROM customers c
JOIN orders o on c.customernumber = o.customernumber
GROUP BY 1
ORDER BY 2 DESC;


#4. Get the list of all customer names who have not placed an order
SELECT * FROM customers c
LEFT JOIN orders o on c.customernumber = o.customernumber
WHERE orderNumber is NULL;

#5. Get number of orders by customer_type (credit limit category)
SELECT 
case when creditlimit>100000 THEN "High"
when creditlimit>=25000 AND creditLimit<=100000 THEN "Medium"
else "Low" end as customer_type
, count(*) FROM customers c
 JOIN orders o on c.customernumber = o.customernumber
GROUP BY 1
ORDER BY 2 desc;


#6. Get total revenue by customer
SELECT c.customernumber, customerName, sum(quantityOrdered*priceEach) as sales FROM customers c
LEFT JOIN orders o on c.customernumber = o.customernumber
LEFT JOIN orderdetails od on o.ordernumber = od.ordernumber
GROUP BY 1,2
ORDER BY 3 desc;

#7. Get total revenue by country
SELECT country, sum(quantityOrdered*priceEach) as sales FROM customers c
LEFT JOIN orders o on c.customernumber = o.customernumber
LEFT JOIN orderdetails od on o.ordernumber = od.ordernumber
GROUP BY 1
ORDER BY 2 desc;



