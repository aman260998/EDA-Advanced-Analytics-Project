--Exploring unique country in customers table--
SELECT DISTINCT country FROM gold.dim_customers AS Country

--Exploring unique category in products table--
SELECT DISTINCT category FROM gold.dim_products AS Categories
--Contains NULL--

--Exploring unique subcategory in products table--
SELECT DISTINCT subcategory FROM gold.dim_products AS SubCategories
--Contains NULL--

--Exploring unique subcategory in products table--
SELECT DISTINCT category,subcategory,product_name FROM gold.dim_products AS ProductHierarchy 
--Contains NULL--

