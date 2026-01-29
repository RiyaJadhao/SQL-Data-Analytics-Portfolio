-- ==============================================
-- 04_scd_type2.sql
-- Slowly Changing Dimension (Type 2) example
-- ==============================================

-- SCD Type 2: Keep history of changes in dimension tables
-- If a customer's details change, we don't overwrite old data
-- Instead, mark old record as inactive and insert new record

-- Step 1: Mark old record as inactive
UPDATE dim_customer
SET end_date = CURRENT_DATE,   -- End of validity for old record
    is_active = false          -- Mark as inactive
WHERE customer_id = 101
  AND is_active = true;

-- Step 2: Insert new record for the same customer
INSERT INTO dim_customer
VALUES (
    101, 
    'Riya', 
    'riya@gmail.com', 
    'Mumbai', 
    CURRENT_DATE,  -- Start date for new record
    NULL,          -- End date unknown (still active)
    true           -- Mark as active
);

-- Benefits of SCD Type 2:
-- Track history of changes (audit trail)
-- Analytics can analyze trends over time
-- Slightly more storage needed (duplicate records)
