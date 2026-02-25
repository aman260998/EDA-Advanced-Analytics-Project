--Pecentage Contribution by Category in Total Sales--
WITH Category_Sales AS
(
SELECT p.category AS Category,
SUM(f.sales_amount) AS [Sales Amount]
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key=p.product_key
GROUP BY p.category
)

SELECT Category,
[Sales Amount],
SUM([Sales Amount]) OVER() AS [Total Amount],
CAST(ROUND(CAST([Sales Amount] AS Float)*100/(SUM([Sales Amount]) OVER()),2) AS varchar(6))+ ' %' AS [Percent of Total Sales]
FROM Category_Sales
ORDER BY [Percent of Total Sales] DESC


--Pecentage Contribution by Country in Total Sales--
WITH Country_Sales AS
(
SELECT c.country AS Country,
SUM(f.sales_amount) AS [Sales Amount]
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key=c.customer_key

GROUP BY c.country
)

SELECT Country,
[Sales Amount],
SUM([Sales Amount]) OVER() AS [Total Amount],
CAST(ROUND(CAST([Sales Amount] AS Float)*100/(SUM([Sales Amount]) OVER()),2) AS varchar(6))+ ' %' AS [Percent of Total Sales]
FROM Country_Sales
ORDER BY [Percent of Total Sales] DESC
