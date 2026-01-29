-- ==============================================
-- 01_table_design.sql
-- Basic table design example for data engineering
-- ==============================================

-- Dimension table: stores descriptive data about customers
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,   -- Unique identifier for each customer
    name VARCHAR(100),             -- Customer's name
    email VARCHAR(100),            -- Customer's email
    city VARCHAR(50),              -- Customer's city
    created_at TIMESTAMP           -- When the customer was created
);

-- Fact table: stores transactional data (orders)
CREATE TABLE fact_orders (
    order_id INT PRIMARY KEY,       -- Unique identifier for each order
    customer_id INT,                -- Reference to dim_customer
    order_date DATE,                -- When the order was made
    total_amount DECIMAL(10,2),    -- Total value of the order
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id)
    -- Ensures every order is linked to a valid customer
);
