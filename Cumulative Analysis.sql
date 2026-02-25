--Running Total of Sales--
SELECT [Order year],
SUM([Total Sales]) OVER(ORDER BY [Order year]) AS [Running Total]
FROM(
	SELECT COALESCE(YEAR(order_date),YEAR(shipping_date)) AS [Order year],
	SUM(sales_amount) AS [Total Sales]
	FROM gold.fact_sales
    GROUP BY COALESCE(YEAR(order_date),YEAR(shipping_date))
	)t

--Moving Average of Sales--
SELECT [Order Date],
AVG([Monthly Sales]) OVER(ORDER BY [Order Date]) AS [Moving Average]
FROM(
	SELECT COALESCE(DATETRUNC(month,order_date),DATETRUNC(month,shipping_date)) AS [Order Date],
	SUM(sales_amount) AS [Monthly Sales]
	FROM gold.fact_sales
    GROUP BY COALESCE(DATETRUNC(month,order_date),DATETRUNC(month,shipping_date))
	)t
