-- Running total of daily sales

SELECT
    OrderDate,
    SUM(Amount) AS daily_sales,
    SUM(SUM(Amount)) OVER (
        ORDER BY OrderDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM Orders
GROUP BY OrderDate;

-- Also used for moving averages, YTD sales, growth analysis
