--Exploring the tables present in the database--
select * from INFORMATION_SCHEMA.TABLES

--Exploring the columns of fact table--
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME= 'fact_sales'
--Measures are: sales_amount, quantity, price
--Dates are: order_date, shipping_date,due_date

--Exploring the columns of dim_customers table--
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME= 'dim_customers'
--Dimensions are: country,gender,marital_status

--Exploring the columns of dim_products table--
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME= 'dim_products'
--Dimensions are: category,subcategory,product_name, product_line,maintenance
--Measures are: cost

