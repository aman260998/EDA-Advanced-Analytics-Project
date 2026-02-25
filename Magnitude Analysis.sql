--Total Customers by Country--
SELECT country, COUNT(customer_key) AS [Total Customers]
FROM gold.dim_customers
GROUP BY country
ORDER BY [Total Customers] DESC

--Total Revenue by Country--
SELECT 
c.country AS Country,
SUM(f.sales_amount) AS [Total Revenue],
SUM(f.quantity) AS [Total Quantities Sold]
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key=c.customer_key
GROUP BY country
ORDER BY [Total Revenue] DESC

--Total Revenue by Customers--
SELECT 
c.first_name+ ' '+c.last_name AS [Full Name],
SUM(f.sales_amount) AS [Total Revenue],
SUM(f.quantity) AS [Total Quantities Sold]
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key=c.customer_key
GROUP BY c.first_name+ ' '+c.last_name
ORDER BY [Total Revenue] DESC


--Total Customers by Gender--
SELECT gender, COUNT(customer_key) AS [Total Customers]
FROM gold.dim_customers
GROUP BY gender
ORDER BY [Total Customers] DESC

--Total Customers by Marital Status--
SELECT marital_status, COUNT(customer_key) AS [Total Customers]
FROM gold.dim_customers
GROUP BY marital_status
ORDER BY [Total Customers] DESC

--Products by Category--
SELECT COALESCE(category,'Category Not Available') AS [Product Category], 
COUNT(product_key) AS [Total Products],
AVG(cost) AS [Average Cost]
FROM gold.dim_products
GROUP BY category
ORDER BY [Average Cost] DESC

--Products by Sub-Category--
SELECT COALESCE(category,'Category Not Available') AS [Product Category],
COALESCE(subcategory,'Sub-Category Not Available') AS [Product Sub-Category],
COUNT(product_key) AS [Total Products],
AVG(cost) AS [Average Cost]
FROM gold.dim_products
GROUP BY category,subcategory
ORDER BY [Average Cost] DESC

--Total Revenue by Category--
SELECT 
COALESCE(p.category,'Category Not Available') AS [Product Category],
SUM(f.sales_amount) AS [Total Revenue],
SUM(f.quantity) AS [Total Quantities Sold]
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key=p.product_key
GROUP BY category
ORDER BY [Total Revenue] DESC


--Total Revenue by Sub-Category--
SELECT 
COALESCE(p.category,'Category Not Available') AS [Product Category],
COALESCE(p.subcategory,'Sub-Category Not Available') AS [Product Sub-Category],
SUM(f.sales_amount) AS [Total Revenue],
SUM(f.quantity) AS [Total Quantities Sold]
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key=p.product_key
GROUP BY category,subcategory
ORDER BY [Total Revenue] DESC


--Customers Analysis--
SELECT 
c.first_name+ ' '+c.last_name AS [Full Name],
COALESCE(p.category,'Category Not Available') AS [Product Category],
COALESCE(p.subcategory,'Sub-Category Not Available') AS [Product Sub-Category],
COALESCE(p.product_name,'Product Not Available') AS [Product Name],
SUM(f.sales_amount) AS [Total Revenue],
SUM(f.quantity) AS [Total Quantities Sold]
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key=c.customer_key
LEFT JOIN gold.dim_products p
ON f.product_key=p.product_key
GROUP BY c.first_name+ ' '+c.last_name,p.category,p.subcategory,p.product_name
ORDER BY [Total Quantities Sold] DESC

