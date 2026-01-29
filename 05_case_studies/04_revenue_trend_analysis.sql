-- BUSINESS PROBLEM:
-- Analyze monthly revenue trend

SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(oi.price * oi.quantity) AS monthly_revenue,
    LAG(SUM(oi.price * oi.quantity)) OVER (
        ORDER BY DATE_TRUNC('month', order_date)
    ) AS prev_month_revenue
FROM orders o
JOIN order_item oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- INSIGHT:
-- Identifies growth or decline trends
