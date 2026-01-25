-- Basic SQL Queries for Data Analysis
-- Author: Riya Jadhao

-- 1. Select all data
SELECT * FROM customers;

-- 2. Select specific columns
SELECT customer_id, company_name, country
FROM customers;

-- 3. Filter data
SELECT *
FROM orders
WHERE order_date >= '1997-01-01';

-- 4. Sort data
SELECT *
FROM products
ORDER BY unit_price DESC;

-- 5. Aggregate data
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;

-- 6. Having clause
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country
HAVING COUNT(*) > 5;
