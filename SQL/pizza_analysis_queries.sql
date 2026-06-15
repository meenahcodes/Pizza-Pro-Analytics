-- ============================================================
-- Pizza Pro Analytics: SQL Business Analysis Queries
-- Project: Pizza sales, product, customer and location analysis
-- Author: Aminat Ajose
-- ============================================================


-- 1. Total Revenue
SELECT 
    SUM(quantity * pizza_price) AS total_revenue
FROM order_details;


-- 2. Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM order_details;


-- 3. Total Pizzas Sold
SELECT 
    SUM(quantity) AS total_pizzas_sold
FROM order_details;


-- 4. Average Order Value
SELECT 
    SUM(quantity * pizza_price) / COUNT(DISTINCT order_id) AS average_order_value
FROM order_details;


-- 5. Total Customers
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM order_details;


-- 6. Average Revenue per Customer
SELECT 
    SUM(quantity * pizza_price) / COUNT(DISTINCT customer_id) AS average_revenue_per_customer
FROM order_details;


-- 7. Top 5 Pizzas by Revenue
SELECT 
    pizza_id,
    SUM(quantity * pizza_price) AS revenue
FROM order_details
GROUP BY pizza_id
ORDER BY revenue DESC
LIMIT 5;


-- 8. Bottom 5 Pizzas by Revenue
SELECT 
    pizza_id,
    SUM(quantity * pizza_price) AS revenue
FROM order_details
GROUP BY pizza_id
ORDER BY revenue ASC
LIMIT 5;


-- 9. Top 5 Most Ordered Pizzas
SELECT 
    pizza_id,
    SUM(quantity) AS total_quantity_sold
FROM order_details
GROUP BY pizza_id
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- 10. Least Ordered Pizzas
SELECT 
    pizza_id,
    SUM(quantity) AS total_quantity_sold
FROM order_details
GROUP BY pizza_id
ORDER BY total_quantity_sold ASC
LIMIT 5;


-- 11. Monthly Revenue Trend
SELECT 
    EXTRACT(MONTH FROM date) AS month_number,
    SUM(quantity * pizza_price) AS monthly_revenue
FROM order_details
GROUP BY EXTRACT(MONTH FROM date)
ORDER BY month_number;


-- 12. Orders by Day and Hour
SELECT 
    TO_CHAR(date, 'Day') AS day_name,
    hour_of_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM order_details
GROUP BY TO_CHAR(date, 'Day'), hour_of_day
ORDER BY day_name, hour_of_day;


-- 13. Top Customers by Revenue
SELECT 
    customer_id,
    SUM(quantity * pizza_price) AS customer_revenue
FROM order_details
GROUP BY customer_id
ORDER BY customer_revenue DESC
LIMIT 10;


-- 14. Revenue by Customer
SELECT 
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity * pizza_price) AS total_revenue,
    SUM(quantity) AS total_pizzas_bought
FROM order_details
GROUP BY customer_id
ORDER BY total_revenue DESC;


-- 15. Revenue by Hour of Day
SELECT 
    hour_of_day,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity * pizza_price) AS total_revenue
FROM order_details
GROUP BY hour_of_day
ORDER BY hour_of_day;