-- QUESTION AND ANSWERS

-- 1)What is the total number of orders in the system?
SELECT count(ORDER_ID) FROM orders;

-- 2)How many different pizza types are available?
SELECT COUNT(pizza_type_ID) FROM pizza_types;

-- 3) What is the average price of all pizzas?
SELECT avg(PRICE) FROM pizzas;

-- 4) Retrieve all orders placed on a specific date (e.g., '2022-01-01').
select oRDER_DATE , order_id from orders where order_date = '2015-01-01';

-- 5)Get a list of all chicken pizzas (assuming 'CATEGORY' in PIZZA_TYPES table indicates this).
select category, pizza_type_id from pizza_types where category ='chicken';

-- 6)Find the most expensive pizza in the system.
select pizza_id from pizzas order by price desc limit 1;

-- 7)Retrieve the number of orders placed for each pizza size (e.g., small, medium, large).
select  p.size, count(od.order_id) as total_orders from pizzas as p
join order_details as od on p.pizza_id =od.PIZZA_ID
group by p.size
limit 0, 1000;

-- ADVANCE QUESTIONS

-- 1)What is the total quantity sold for each pizza type?
 SELECT pt.CATEGORY, SUM(od.QUANTITY) AS total_quantity
FROM ORDER_DETAILS od
JOIN PIZZAS p ON od.PIZZA_ID = p.PIZZA_ID
JOIN PIZZA_TYPES pt ON p.PIZZA_TYPE_ID = pt.PIZZA_TYPE_ID
GROUP BY pt.CATEGORY;

-- 2)Which pizza type has the highest total quantity sold?
SELECT pt.CATEGORY, max(od.QUANTITY) AS total_quantity
FROM ORDER_DETAILS as od
JOIN PIZZAS as p ON od.PIZZA_ID = p.PIZZA_ID
JOIN PIZZA_TYPES as pt ON p.PIZZA_TYPE_ID = pt.PIZZA_TYPE_ID
GROUP BY pt.CATEGORY limit 1;

-- 3)Find the top 3 pizza types that generate the most revenue.
SELECT distinct(P.pizza_type_ID), OD.ORDER_ID FROM PIZZAS AS P JOIN order_details AS OD ON P.PIZZA_ID =OD.PIZZA_ID ORDER BY PIZZA_TYPE_ID DESC LIMIT 3;

-- 4)Identify the most popular pizza type:
SELECT PIZZA_TYPES.NAME, COUNT(*) AS total_orders
FROM ORDER_DETAILS
INNER JOIN PIZZAS ON ORDER_DETAILS.PIZZA_ID = PIZZAS.PIZZA_ID
INNER JOIN PIZZA_TYPES ON PIZZAS.PIZZA_TYPE_ID = PIZZA_TYPES.PIZZA_TYPE_ID 
GROUP BY PIZZA_TYPES.NAME
ORDER BY total_orders DESC
LIMIT 1;


Select * from orders;
select * from PIZZA_TYPES;
select * from pizzas;
SELECT * FROM order_details;