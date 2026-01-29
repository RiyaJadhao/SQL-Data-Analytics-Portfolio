-- Compare current order amount with previous order

SELECT
    OrderID,
    OrderDate,
    Amount,
    LAG(Amount) OVER (ORDER BY OrderDate) AS prev_order_amount,
    Amount - LAG(Amount) OVER (ORDER BY OrderDate) AS difference
FROM Orders;

-- Used in trend analysis
