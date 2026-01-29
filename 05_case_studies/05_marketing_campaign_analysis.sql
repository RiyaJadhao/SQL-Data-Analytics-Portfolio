-- BUSINESS PROBLEM:
-- Measure campaign performance (before vs after)

SELECT
    CASE
        WHEN order_date < '2024-01-01' THEN 'Before Campaign'
        ELSE 'After Campaign'
    END AS period,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(oi.price * oi.quantity) AS revenue
FROM orders o
JOIN order_item oi ON o.order_id = oi.order_id
GROUP BY period;

-- INSIGHT:
-- Measures campaign ROI
