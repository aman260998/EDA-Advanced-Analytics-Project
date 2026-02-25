--Exploring oldest and latest order date--
SELECT MAX(order_date) AS [Latest Order Date], 
	   MIN(order_date) As [Oldest Order Date] 
	   FROM gold.fact_sales

--Exploring the no. of years of orders--
SELECT DATEDIFF(year,MIN(order_date),MAX(order_date)) AS [No. of years of Sales]
	   FROM gold.fact_sales

--Exploring oldest and latest order date--
SELECT DATEDIFF(YEAR,MAX(birthdate),GETDATE()) AS [Youngest Customer], 
	   DATEDIFF(YEAR,MIN(birthdate),GETDATE()) AS [Oldest Customer]
	   FROM gold.dim_customers

--Average no of days between Order and Shipping Date--
SELECT AVG(DATEDIFF(day,order_date,shipping_date)) AS [Average Shipping Days]
FROM gold.fact_sales


