-- Rank orders by amount within each customer

SELECT
    CustomerID,
    OrderID,
    Amount,
    RANK() OVER (
        PARTITION BY CustomerID
        ORDER BY Amount DESC
    ) AS order_rank
FROM Orders;

-- PARTITION BY works like GROUP BY but keeps rows
