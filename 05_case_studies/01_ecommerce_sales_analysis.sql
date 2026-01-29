-- BUSINESS PROBLEM:
-- Identify top customers, products, and revenue drivers

-- 1. Top 10 customers by revenue
SELECT
    c.customer_id,
    c.name,
    SUM(oi.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_item oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 10;

-- INSIGHT:
-- Helps identify VIP customers for loyalty programs
