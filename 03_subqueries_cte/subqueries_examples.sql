-- =========================
-- Subqueries Examples
-- =========================

-- Tables used:
-- Customers(CustomerID, Name, City, Country)
-- Orders(OrderID, CustomerID, OrderDate, TotalAmount)
-- Products(ProductID, ProductName, Category, Price)
-- OrderDetails(OrderID, ProductID, Quantity, Price) -- if needed

-----------------------------------------------------
-- 1️⃣ Scalar Subquery: Find customers with orders above average order amount
-----------------------------------------------------
SELECT Name, CustomerID
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE TotalAmount > (
        SELECT AVG(TotalAmount) FROM Orders
    )
);

-----------------------------------------------------
-- 2️⃣ Column Subquery: List all products ordered at least once
-----------------------------------------------------
-- If using OrderDetails table
SELECT ProductName
FROM Products
WHERE ProductID IN (
    SELECT DISTINCT ProductID
    FROM OrderDetails
);

-----------------------------------------------------
-- 3️⃣ Row Subquery: Find order(s) with the highest total amount
-----------------------------------------------------
SELECT OrderID, CustomerID, TotalAmount
FROM Orders
WHERE TotalAmount = (
    SELECT MAX(TotalAmount)
    FROM Orders
);

-----------------------------------------------------
-- 4️⃣ Table Subquery / CTE: Get top 3 customers by total purchase
-----------------------------------------------------
WITH TopCustomers AS (
    SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
    ORDER BY TotalSpent DESC
    LIMIT 3
)
SELECT c.CustomerID, c.Name, tc.TotalSpent
FROM Customers c
JOIN TopCustomers tc
ON c.CustomerID = tc.CustomerID;
