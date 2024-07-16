CREATE DATABASE Pizza_DB ;

USE pizza_db;

SELECT * FROM pizza_sales ;

DESCRIBE pizza_sales ;

SELECT 
	SUM(total_price) AS Total_Revenue
FROM
	pizza_sales;
    
SELECT  
	SUM(total_price)/ COUNT(DISTINCT(order_id)) AS Avg_Order_Value
FROM
	pizza_sales;
    
SELECT 
	SUM(quantity) AS Total_Pizza_Sold
FROM
	pizza_sales;
    
    
SELECT 
	COUNT(DISTINCT(order_id)) AS Total_Orders
FROM
	pizza_sales;
    
select month(order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
where month(order_date) in(1,2,03,04)
GROUP BY month( order_date);

	
SELECT 
	CAST(SUM(quantity)AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT(order_id))AS DECIMAL(10,2)) AS Avg_Pizza_Per_Order
FROM
	pizza_sales;

SELECT 
	DATENAME(DW, order_date) as Order_Day , COUNT(DISTINCT(order_id)) AS Total_Day_Order
FROM
	pizza_sales
GROUP BY DATENAME(DW, order_date) ;


SELECT 
	pizza_category , SUM(total_price)*100/(SELECT SUM(total_price) from pizza_sales) AS  PCT
FROM
	pizza_sales
GROUP BY pizza_category;

SELECT 
	pizza_size ,CAST(SUM(total_price)AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price)*100/(SELECT SUM(total_price) from pizza_sales)AS DECIMAL(10,2)) AS  PCT_size
FROM
	pizza_sales
GROUP BY pizza_size;

SELECT 
	 pizza_name , SUM(total_price) AS Top_5_pizza_by_revenue
FROM
	pizza_sales 
GROUP BY pizza_name
ORDER BY Top_5_pizza_by_revenue desc
limit 5;

SELECT 
	 pizza_name , SUM(quantity) AS Top_5_pizza_by_qty
FROM
	pizza_sales 
GROUP BY pizza_name
ORDER BY Top_5_pizza_by_qty desc
limit 5;

