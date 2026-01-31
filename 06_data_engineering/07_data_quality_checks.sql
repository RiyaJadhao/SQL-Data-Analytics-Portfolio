-- ==============================================
-- 07_data_quality_checks.sql
-- Basic data quality checks
-- ==============================================

-- 1️.Check for NULLs in critical columns
SELECT * FROM fact_orders
WHERE customer_id IS NULL;

-- 2️.Check for duplicate order IDs
SELECT order_id, COUNT(*)
FROM fact_orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 3️.Check referential integrity (orphans)
SELECT *
FROM fact_orders f
LEFT JOIN dim_customer d
ON f.customer_id = d.customer_id
WHERE d.customer_id IS NULL;

-- Explanation:
-- > NULL check: ensures mandatory fields are not empty
-- > Duplicate check: ensures primary key uniqueness
-- > Referential integrity: ensures all foreign keys point to valid records
