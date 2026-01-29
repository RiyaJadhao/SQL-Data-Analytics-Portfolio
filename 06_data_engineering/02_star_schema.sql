-- ==============================================
-- 02_star_schema.sql
-- Star schema: common data warehouse design
-- ==============================================

-- Dimension table for products
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,     -- Unique product ID
    name VARCHAR(100),              -- Product name
    category VARCHAR(50)            -- Product category
);

-- Dimension table for dates (date dimension helps in analytics)
CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,       -- Unique date (can be used for partitioning/filtering)
    year INT,                       -- Year part of date
    month INT,                      -- Month part of date
    day INT                         -- Day part of date
);

-- Fact table storing sales transactions
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,       -- Unique ID for each sale
    product_id INT,                 -- Reference to dim_product
    customer_id INT,                -- Reference to dim_customer
    date_id DATE,                   -- Reference to dim_date
    amount DECIMAL(10,2)            -- Sale amount
);

-- STAR SCHEMA: Fact table in the center, dimension tables around it
-- Helps in fast analytics queries, aggregation, and reporting
