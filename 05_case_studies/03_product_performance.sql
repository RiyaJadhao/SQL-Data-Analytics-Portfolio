-- BUSINESS PROBLEM:
-- Identify best and worst performing products

SELECT
    p.product_id,
    p.name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.price) AS revenue
FROM products p
JOIN order_item oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name
ORDER BY revenue DESC;

-- INSIGHT:
-- Helps optimize inventory & promotions
