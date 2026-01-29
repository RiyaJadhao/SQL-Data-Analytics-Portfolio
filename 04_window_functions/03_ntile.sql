-- Divide customers into 4 revenue groups (quartiles)

SELECT
    CustomerID,
    SUM(Amount) AS total_spent,
    NTILE(4) OVER (ORDER BY SUM(Amount) DESC) AS spending_bucket
FROM Orders
GROUP BY CustomerID;

-- Useful for customer segmentation
