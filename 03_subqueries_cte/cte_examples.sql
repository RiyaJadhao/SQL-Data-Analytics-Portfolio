-- =========================
-- CTE (Common Table Expression) Examples
-- =========================

-- Tables used:
-- Customers(CustomerID, Name, City, Country)
-- Orders(OrderID, CustomerID, OrderDate, TotalAmount)
-- Products(ProductID, ProductName, Category, Price)
-- Employees(EmployeeID, Name, ManagerID) -- for recursive example
-- OrderDetails(OrderID, ProductID, Quantity, Price)

-----------------------------------------------------
-- 1️⃣ Basic CTE: Get total order amount per customer
-----------------------------------------------------
WITH CustomerOrders AS (
    SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
)
SELECT c.Name, co.TotalSpent
FROM Customers c
JOIN CustomerOrders co
ON c.CustomerID = co.CustomerID
ORDER BY co.TotalSpent DESC;

-----------------------------------------------------
-- 2️⃣ CTE with filtering (HAVING): Customers spending more than 5000
-----------------------------------------------------
WITH CustomerOrders AS (
    SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
    HAVING SUM(TotalAmount) > 5000
)
SELECT c.CustomerID, c.Name, co.TotalSpent
FROM Customers c
JOIN CustomerOrders co
ON c.CustomerID = co.CustomerID
ORDER BY co.TotalSpent DESC;

-----------------------------------------------------
-- 3️⃣ CTE with aggregation on products: Top-selling products in a category
-----------------------------------------------------
WITH ProductSales AS (
    SELECT p.ProductID, p.ProductName, SUM(od.Quantity * od.Price) AS TotalSales
    FROM Products p
    JOIN OrderDetails od
    ON p.ProductID = od.ProductID
    WHERE p.Category = 'Electronics'
    GROUP BY p.ProductID, p.ProductName
)
SELECT *
FROM ProductSales
WHERE TotalSales > 1000
ORDER BY TotalSales DESC;

-----------------------------------------------------
-- 4️⃣ Recursive CTE: Employee hierarchy (Manager -> Subordinates)
-----------------------------------------------------
WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: top-level managers
    SELECT EmployeeID, Name, ManagerID, 1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- Recursive case: employees reporting to managers
    SELECT e.EmployeeID, e.Name, e.ManagerID, eh.Level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh
    ON e.ManagerID = eh.EmployeeID
)
SELECT *
FROM EmployeeHierarchy
ORDER BY Level, ManagerID, EmployeeID;
