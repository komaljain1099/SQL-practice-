#get number of orders by its status 
select * from orders;
select ordernumber , status as status_ from orders;
select status , count(*) as order_count
from orders 
group by status;

#get the customer names and customer numbers who have placed an order after 31st dec 2004
 select * from customers;
 
SELECT CustomerName, c.CustomerNumber
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
where orderdate>"2004-12-31";

select * from orders;
select * from customers;
#get the country with the highest number of orders and its order count 
SELECT c.Country, COUNT(c.customernumber) AS OrderCount
FROM Customers c
JOIN Orders o ON c.Customernumber= O.Customernumber
GROUP BY Country
ORDER BY OrderCount DESC
LIMIT 1;

#get the list of all customernumbers ,customer names who have not placed an order
select c.customernumber , customername 
from customers c left join orders o on c.customerNumber = o.customerNumber
where orderdate is null;


select * from customers;
select * from orders;
select * from orderdetails;

#get total revenue by customernumber and customner revenue

SELECT
    c.CustomerNumber,
    c.CustomerName,
    SUM(priceeach * quantityOrdered) AS Total_Revenue
FROM
    customers c
LEFT JOIN
    Orders o ON c.CustomerNumber = o.customerNumber
JOIN
    orderdetails on o.orderNumber = orderdetails.orderNumber
GROUP BY
    c.CustomerNumber, c.CustomerName
having total_revenue>100000
order by 3 desc ;


select * from employees;
 
 select 
 e1.employeeNumber, e1.lastname, e1.firstName , e1.reportsTo,
e2.lastname as manager_last_name ,e2.firstname as manager_first_name
 from employees e1 left join employees e2 on e1.reportsTo = e2.employeeNumber;



