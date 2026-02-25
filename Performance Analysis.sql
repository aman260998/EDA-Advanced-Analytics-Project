--Product Performance Analysis--
WITH yearly_product_sales AS
(
SELECT 
	YEAR(COALESCE(f.order_date,f.shipping_date)) AS [Sales Year],
	p.product_name AS [Product Name],
	SUM(sales_amount) AS [Total Sales]
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_products AS p
ON f.product_key=p.product_key
GROUP BY YEAR(COALESCE(f.order_date,f.shipping_date)),p.product_name
)

SELECT 
	[Sales Year],[Product Name],[Total Sales],
	AVG([Total Sales]) OVER(PARTITION BY [Product Name]) AS [Average Sales],
	[Total Sales]-AVG([Total Sales]) OVER(PARTITION BY [Product Name]) AS [Difference from Average],
	LAG([Total Sales]) OVER(PARTITION BY [Product Name] ORDER BY [Sales Year]) AS [Previous Year Sales],
	[Total Sales]-	LAG([Total Sales]) OVER(PARTITION BY [Product Name] ORDER BY [Sales Year]) AS [Difference from Previous Year],
	CASE
		WHEN [Total Sales]-AVG([Total Sales]) OVER(PARTITION BY [Product Name])>0 THEN 'Above Average'
		WHEN [Total Sales]-AVG([Total Sales]) OVER(PARTITION BY [Product Name])<0THEN 'Below Average'
		ELSE 'Average'
	END AS [Average Status],
	CASE
		WHEN [Total Sales]-	LAG([Total Sales]) OVER(PARTITION BY [Product Name] ORDER BY [Sales Year])>0 THEN 'Increase'
		WHEN [Total Sales]-	LAG([Total Sales]) OVER(PARTITION BY [Product Name] ORDER BY [Sales Year])<0 THEN 'Decrease'
		ELSE 'No Change'
	END AS [Change from Previous Year Status]

FROM yearly_product_sales 


