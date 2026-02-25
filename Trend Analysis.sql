--Yearly Analysis--
SELECT YEAR(order_date) AS Year,
SUM(sales_amount) AS [Yearly Sales],
SUM(quantity) AS [Quantities Sold]
FROM gold.fact_sales
GROUP BY YEAR(order_date)
ORDER BY [Yearly Sales] DESC

--Quarterly Analysis--
SELECT CONCAT(CAST(YEAR(order_date) AS nvarchar(4)),'-Q',DATEPART(QUARTER,order_date)) AS Quarter,
SUM(sales_amount) AS [Quarterly Sales],
SUM(quantity) AS [Quantities Sold]
FROM gold.fact_sales
GROUP BY YEAR(order_date),DATEPART(QUARTER,order_date)
ORDER BY [Quarterly Sales] DESC

--Monthly Analysis--
SELECT YEAR(order_date) AS Year,
FORMAT(order_date,'MMM') AS Month,
SUM(sales_amount) AS [Monthly Sales],
SUM(quantity) AS [Quantities Sold]
FROM gold.fact_sales
GROUP BY YEAR(order_date),FORMAT(order_date,'MMM')
ORDER BY [Monthly Sales] DESC

--Yearly Sales by Category --
SELECT COALESCE(YEAR(f.order_date),YEAR(shipping_date)) AS Year,
p.category AS Category,
SUM(sales_amount) AS [Yearly Sales],
SUM(quantity) AS [Quantities Sold]
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key=p.product_key
GROUP BY COALESCE(YEAR(f.order_date),YEAR(shipping_date)),p.category
ORDER BY Year 

--Yearly Sales by Country --
SELECT COALESCE(YEAR(f.order_date),YEAR(f.shipping_date)) AS Year,
c.country AS Country,
SUM(sales_amount) AS [Yearly Sales],
SUM(quantity) AS [Quantities Sold]
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key=c.customer_key
GROUP BY COALESCE(YEAR(f.order_date),YEAR(f.shipping_date)),c.country
ORDER BY [Yearly Sales] DESC


--New Customers added each year--
SELECT YEAR(first_order_date) AS Year,
COUNT(customer_key) AS [New Customers]
FROM 
	(SELECT customer_key, 
	MIN(order_date) AS first_order_date
	FROM gold.fact_sales
	GROUP BY customer_key) t
GROUP BY YEAR(first_order_date)
ORDER BY Year

