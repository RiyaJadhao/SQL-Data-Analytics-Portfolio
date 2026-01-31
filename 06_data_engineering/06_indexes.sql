-- ==============================================
-- 06_indexes.sql
-- Indexing for query performance
-- ==============================================

-- Index on customer_id to speed up joins and filters
CREATE INDEX idx_customer_id ON fact_orders(customer_id);

-- Index on order_date to speed up date range queries
CREATE INDEX idx_order_date ON fact_orders(order_date);

-- Explanation:
-- Index is like a table of contents for database
-- Queries that filter or join on indexed columns are faster
