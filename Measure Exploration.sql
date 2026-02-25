--Total Sales--
SELECT 'Total Sales' AS measure_name,SUM(sales_amount) AS measure_value 
FROM gold.fact_sales

UNION ALL

--Total Quantities Sold--
SELECT 'Total Quantities Sold' AS measure_name,SUM(quantity) AS measure_value 
FROM gold.fact_sales

UNION ALL

--Average Selling Price--
SELECT 'Average Selling Price' AS measure_name,AVG(sales_amount) AS measure_value 
FROM gold.fact_sales

UNION ALL

--Total No.of Orders--
SELECT 'Total No.of Orders' AS measure_name,COUNT( DISTINCT order_number) AS measure_value 
FROM gold.fact_sales

UNION ALL

--Total No.of Customers--
SELECT 'Total No.of Customers' AS measure_name,COUNT(*) AS measure_value 
FROM gold.dim_customers

UNION ALL

--Total No.of Products--
SELECT 'Total No.of Products' AS measure_name,COUNT(*) AS measure_value 
FROM gold.dim_products

UNION ALL

--Average Cost of Products--
SELECT 'Average Cost of Products' AS measure_name,AVG(cost) AS measure_value 
FROM gold.dim_products



