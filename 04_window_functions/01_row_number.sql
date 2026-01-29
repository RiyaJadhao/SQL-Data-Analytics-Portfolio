-- Assign unique row numbers to orders per customer

SELECT
    CustomerID,
    OrderID,
    OrderDate,
    ROW_NUMBER() OVER (
        PARTITION BY CustomerID
        ORDER BY OrderDate
    ) AS order_number
FROM Orders;

-- Use case:
-- Identify first / latest order per customer
