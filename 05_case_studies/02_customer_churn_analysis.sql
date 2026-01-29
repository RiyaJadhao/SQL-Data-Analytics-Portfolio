-- BUSINESS PROBLEM:
-- Identify inactive customers (churned)

SELECT
    customer_id,
    MAX(order_date) AS last_order_date
FROM orders
GROUP BY customer_id
HAVING MAX(order_date) < CURRENT_DATE - INTERVAL '90 days';

-- INSIGHT:
-- Customers inactive for 90+ days are likely churned
