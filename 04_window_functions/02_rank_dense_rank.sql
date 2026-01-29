-- Compare RANK() vs DENSE_RANK() for sales ranking

SELECT
    ProductID,
    SUM(Amount) AS total_sales,
    RANK() OVER (ORDER BY SUM(Amount) DESC) AS rank_sales,
    DENSE_RANK() OVER (ORDER BY SUM(Amount) DESC) AS dense_rank_sales
FROM Orders
GROUP BY ProductID;

-- RANK() → gaps in ranking
-- DENSE_RANK() → no gaps
