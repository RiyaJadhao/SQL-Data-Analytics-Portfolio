-- ==============================================
-- 03_incremental_load.sql
-- Incremental data load: only load new or updated rows
-- ==============================================

-- INSERT only new/updated rows from staging to fact table
INSERT INTO fact_sales
SELECT *
FROM staging_sales s
WHERE s.updated_at >
      (SELECT MAX(updated_at) FROM fact_sales);

-- Explanation:
-- staging_sales: temporary table with raw new/updated data
-- MAX(updated_at) from fact_sales: find last update in the main table
-- Only load rows newer than that timestamp → prevents duplicates
-- Incremental load is faster than full reload and used in real pipelines
