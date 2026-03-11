/*Create DB*/
CREATE DATABASE EcommerceDB;
SHOW DATABASES;
Use EcommerceDB;

/*creating table*/

CREATE TABLE Customers(
customer_id INT Primary Key,
name VARCHAR(100),
email VARCHAR(100),
City VARCHAR(100),
signout DATE);

Select * from Customers;

INSERT INTO customers(customer_id,name, email,city, signout)
Values( 912, 'Rakesh sharma', 'rakeshsharma@gmail.com', 'usa', '2025-12-09'),
(913, 'Jenny grain', 'jennygrain@gmail.com', 'canada', '2026-2-03'),
(914, 'Iggy boy', 'iggyboy@gmail.com', 'london', '2026-12-02'),
(915, 'laura gazy', 'l@gmail.com', 'finland', '2026-1-15'),
(916, 'Julie kizzy', 'juliekizzy@gmail.com', 'boston', '2025-12-14'),
(917, 'Braddy john', 'braddyjohn@gmail.com', 'greec', '2026-12-01');

Select * from Customers;

CREATE TABLE Products(
product_id INT Primary Key,
product_name VARCHAR(100),
category VARCHAR(100),
price DECIMAL,
stock_quantity INT);

INSERT INTO Products(product_id,product_name, category,price, stock_quantity)
Values( 112, 'Laptop', 'Electronics', 56000, 1),
(113, 'Headset', 'Accessories', '20000', 2),
(114, 'Laptop', 'Electronics', '70000', 1),
(115, 'Mobile', 'Electronics', '45000', 3),
(116, 'Fan', 'Electronics', '35000', 2),
(117, 'Laptop', 'Electronics', '65000', 1);

CREATE TABLE Orders(
order_id int primary key,
customer_id int,
order_date date,
total_amount int,
Foreign key(customer_id) References customers(customer_id));

/*modify column name*/

alter table Orders
change total_amout total_amount int;

select * from orders;

insert into Orders( order_id, customer_id,order_date, total_amount)
values(8172, 914, '2026-12-5', 56000),
(2337, 912, '2026-01-01', 23000),
(3546, 916, '2025-12-09', 73630),
(4542, 913, '2025-02-13', 67000),
(2349, 914, '2026-03-11', 55000),
(2573, 915, '2025-02-23', 43520);

CREATE TABLE Order_Items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
item_price DECIMAL(10,2),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT into Order_Items(order_item_id,order_id,product_id,quantity,item_price)
values (1, 3546, 113, 2, 20000),
(2, 2349, 117, 1, 70000),
(3, 2573, 112, 2, 120000),
(4,4542, 114,1, 70000),
(5, 8172, 115, 1, 13000),
(6, 2337, 116, 1, 35000);

Update customers set  name = "iggy biggy"  where customer_id = 914;
select *from customers; 

/*basic function of sql to create the table and database*/

/* DDL - CREATE, ALTER, DROP, RENAME, TRUNCATE
/* DML - CHANGE, UPDATE, DELETE
/* DQL - SELECT
/*--------------------------------------------------------------*/


/*total number of question*/
Select count(customer_id) from customers;

/*find all the customer who live in usa*/
select * from customers where city = 'usa';

/*find the number of order placed*/
select count(order_id) from orders;

/*Calculate the total revenue generated from all orders*/
select*from orders;
select sum(total_amount) from orders;

/*Display the top 5 most expensive products from the Products table.*/

select * from products;
select product_name from products 
order by price desc
LIMIT 5;

/*Find how many orders each customer placed*/

select * from order_items;

select customer_id, count(order_id) as total_order from orders
group by customer_id;

/*Find the product that was sold the most based on quantity*/

select product_id, sum(stock_quantity) as most_based
from products
group by product_id
order by stock_quantity desc
limit 1;

/*Find total sales revenue for each product category.*/

select p.category, sum(p.price * o.quantity) as total_revenue
from products p
INNER JOIN order_items o
on p.product_id = o.product_id
group by p.category;


/*Find customers who have placed more than one order.*/

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;


