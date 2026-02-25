--Top 5 Products by Revenue--

SELECT TOP 5
p.product_name AS [Product Name],
SUM(f.sales_amount) AS [Total Revenue]
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key=p.product_key
GROUP BY p.product_name
ORDER BY [Total Revenue] DESC

--Bottom 5 Products by Revenue--

SELECT TOP 5
p.product_name AS [Product Name],
SUM(f.sales_amount) AS [Total Revenue]
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key=p.product_key
GROUP BY p.product_name
ORDER BY [Total Revenue] 

--Top 5 Customers by Revenue--

SELECT TOP 5
c.first_name+ ' '+c.last_name AS [Full Name],
SUM(f.sales_amount) AS [Total Revenue]
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key=c.customer_key
GROUP BY c.first_name+ ' '+c.last_name
ORDER BY [Total Revenue] DESC

--Bottom 5 Customers by Revenue--

SELECT TOP 5
c.first_name+ ' '+c.last_name AS [Full Name],
SUM(f.sales_amount) AS [Total Revenue]
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key=c.customer_key
GROUP BY c.first_name+ ' '+c.last_name
ORDER BY [Total Revenue] 
