-- ============================================
-- SQL JOINS & WINDOW FUNCTIONS (Generic SQL)
-- Author: Riya Jadhao
-- ============================================

/* ---------------------------
   INNER JOIN (4 tables)
----------------------------*/
SELECT 
    c.CustomerName, 
    o.OrderID, 
    p.ProductName, 
    pay.PaymentDate
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
INNER JOIN Products p 
    ON o.ProductID = p.ProductID
INNER JOIN Payments pay 
    ON o.OrderID = pay.OrderID;

/* ---------------------------
   LEFT JOIN
----------------------------*/
SELECT 
    c.CustomerName, 
    o.OrderID, 
    p.ProductName, 
    pay.PaymentDate
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
LEFT JOIN Products p 
    ON o.ProductID = p.ProductID
LEFT JOIN Payments pay 
    ON o.OrderID = pay.OrderID;

/* ---------------------------
   RIGHT JOIN
----------------------------*/
SELECT 
    c.CustomerName, 
    o.OrderID, 
    pay.PaymentDate
FROM Customers c
RIGHT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
RIGHT JOIN Payments pay 
    ON o.OrderID = pay.OrderID;

/* ---------------------------
   FULL OUTER JOIN
----------------------------*/
SELECT 
    c.CustomerName, 
    o.OrderID, 
    pay.PaymentDate
FROM Customers c
FULL OUTER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
FULL OUTER JOIN Payments pay 
    ON o.OrderID = pay.OrderID;

/* ---------------------------
   CROSS JOIN
----------------------------*/
SELECT 
    c.CustomerName, 
    p.ProductName
FROM Customers c
CROSS JOIN Products p;

/* ---------------------------
   SELF JOIN (Employee–Manager)
----------------------------*/
SELECT 
    e1.EmployeeName AS Employee, 
    e2.EmployeeName AS Manager
FROM Employees e1
INNER JOIN Employees e2 
    ON e1.ManagerID = e2.EmployeeID;

/* ---------------------------
   WINDOW FUNCTION
----------------------------*/
-- Rank products by total quantity sold
SELECT 
    product_id, 
    SUM(quantity) AS total_sold,
    RANK() OVER (ORDER BY SUM(quantity) DESC) AS sales_rank
FROM order_details
GROUP BY product_id;
