--Segment products into cost ranges--
WITH product_segments AS
(
SELECT product_key,product_name,cost,
	CASE 
	     WHEN cost<100 THEN 'Below 100'
		 WHEN cost BETWEEN 100 AND 500 THEN '100-500'
		 WHEN cost BETWEEN 500 AND 1000 THEN '500-100'
		 ELSE 'Above 1000'
	END AS [Product Segment]
FROM gold.dim_products
)

SELECT [Product Segment],
	   COUNT(product_name) AS [Total Product in Segment]  
FROM product_segments
GROUP BY [Product Segment]
ORDER BY [Total Product in Segment] DESC

--Group Customers into 3 segments based on their spending behaviour--
WITH customer_spending AS (
    SELECT
        c.customer_key,
        SUM(f.sales_amount) AS [Total Spending],
        MIN(order_date) AS [First Order],
        MAX(order_date) AS [Last Order],
        DATEDIFF(month, MIN(order_date), MAX(order_date)) AS Lifespan
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
)
SELECT 
    [Customer Segment],
    COUNT(customer_key) AS [Total Customers]
FROM (
    SELECT 
        customer_key,
        CASE 
            WHEN Lifespan >= 12 AND [Total Spending] > 5000 THEN 'VIP'
            WHEN Lifespan >= 12 AND [Total Spending] <= 5000 THEN 'Regular'
            ELSE 'New'
        END AS [Customer Segment]
    FROM customer_spending
) AS segmented_customers
GROUP BY [Customer Segment]
ORDER BY [Total Customers] DESC;