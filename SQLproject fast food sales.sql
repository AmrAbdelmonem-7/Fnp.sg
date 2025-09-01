-- 1. What items does Balaji Fast Food sell?
SELECT DISTINCT item_type 
FROM [Balaji Fast Food Sales];

-- 2- How have total sales changed over the years?
SELECT YEAR(date) AS sales_year, 
       SUM(transaction_amount) AS total_sales
FROM [Balaji Fast Food Sales]
GROUP BY YEAR(date)
ORDER BY sales_year;

-- 3- Which item has the highest total quantity sold?
SELECT TOP 3 item_name, 
       SUM(quantity) AS total_quantity
FROM [Balaji Fast Food Sales]
GROUP BY item_name
ORDER BY total_quantity DESC;

-- 4- Which top 3 items generated the highest total revenue?
SELECT TOP 3 item_name,SUM(transaction_amount) AS total_revenue      
FROM [Balaji Fast Food Sales]
GROUP BY item_name
ORDER BY total_revenue DESC;


-- 5. At what time of the day do customers buy the most?
SELECT TOP 1 time_of_sale, COUNT(order_id) AS total_orders
FROM [Balaji Fast Food Sales]
GROUP BY time_of_sale
ORDER BY total_orders DESC;



-- 6-Which payment method was used the most by customers?
SELECT TOP 2 transaction_type, 
       COUNT(*) AS total_orders
FROM [Balaji Fast Food Sales]
GROUP BY transaction_type
ORDER BY total_orders DESC;
--8-What is the average number of orders per day?
SELECT AVG(daily_sales) AS avg_daily_sales
FROM (
    SELECT date, SUM(transaction_amount) AS daily_sales
    FROM [Balaji Fast Food Sales]
    GROUP BY date
) AS daily_summary;



-- 8. On which day did we receive the most orders?
SELECT TOP 1 date, COUNT(order_id) AS total_orders
FROM [Balaji Fast Food Sales]
GROUP BY date
ORDER BY total_orders DESC;

-- 9. Which month had the highest sales?
SELECT TOP 1 MONTH(date) AS sales_month, SUM(transaction_amount) AS total_sales
FROM [Balaji Fast Food Sales]
GROUP BY MONTH(date)
ORDER BY total_sales DESC ;

-- 9. Which month had the LOWEST sales?
SELECT TOP 1 MONTH(date) AS sales_month, SUM(transaction_amount) AS total_sales
FROM [Balaji Fast Food Sales]
GROUP BY MONTH(date)
ORDER BY total_sales ;

-- 10. Which customer order brought the highest revenue?
SELECT TOP 3 order_id, SUM(transaction_amount) AS order_revenue
FROM [Balaji Fast Food Sales]
GROUP BY order_id
ORDER BY order_revenue DESC;

-- 1️1- "Which day of the week has the highest average sales?
SELECT DATENAME(WEEKDAY, date) AS day_of_week,  
       AVG(transaction_amount) AS avg_sales
FROM [Balaji Fast Food Sales]
GROUP BY DATENAME(WEEKDAY, date)
ORDER BY avg_sales DESC;

-- 1️2- On which date was the lowest number of orders placed?
SELECT TOP 1 date, COUNT(order_id) AS total_orders
FROM [Balaji Fast Food Sales]
GROUP BY date
ORDER BY total_orders ASC;


-- 13. Which item type generates the highest revenue overall?
SELECT TOP 1 item_type, SUM(transaction_amount) AS total_revenue
FROM [Balaji Fast Food Sales]
GROUP BY item_type
ORDER BY total_revenue DESC;



-- 1️4- At which time of sale were the fewest orders placed?
SELECT TOP 1 time_of_sale, COUNT(order_id) AS total_orders       
FROM [Balaji Fast Food Sales]
GROUP BY time_of_sale
ORDER BY total_orders ASC;
-- 15. What is the total revenue and total orders for each year? (Final Summary)
SELECT YEAR(date) AS sales_year, 
       SUM(transaction_amount) AS total_revenue, 
       COUNT(order_id) AS total_orders
FROM [Balaji Fast Food Sales]
GROUP BY YEAR(date)
ORDER BY sales_year;

