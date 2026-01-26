# SQL Subqueries and CTEs

This folder contains examples and demonstrations of **SQL Subqueries** and **Common Table Expressions (CTEs)** using realistic database tables.  
The goal is to show how to write **advanced SQL queries**, including aggregation, filtering, and hierarchical queries.

---

## Tables Used

| Table Name     | Columns / Description |
|----------------|----------------------|
| Customers      | CustomerID, Name, City, Country |
| Orders         | OrderID, CustomerID, OrderDate, TotalAmount |
| Products       | ProductID, ProductName, Category, Price |
| OrderDetails   | OrderID, ProductID, Quantity, Price |
| Employees      | EmployeeID, Name, ManagerID |
| Payments       | PaymentID, OrderID, PaymentDate, Amount, PaymentMethod |

---

## 1️⃣ Subqueries

Subqueries are **queries nested inside another query**. They can be:

- **Scalar Subquery**: Returns a single value.
- **Column Subquery**: Returns a single column.
- **Row Subquery**: Returns a single row.
- **Table Subquery**: Returns multiple rows and columns.

See `subqueries_examples.sql` for examples including:

- Customers with orders above average amount
- Products ordered at least once
- Orders with the highest total amount
- Top 3 customers by total purchase (using CTE for top N)

---

## 2️⃣ Common Table Expressions (CTEs)

CTEs are **temporary named result sets** used within `SELECT`, `INSERT`, `UPDATE`, or `DELETE`.  
Benefits:

- Improves **readability** and **organization**
- Allows **recursive queries**
- Helps in **complex aggregations and filtering**

See `cte_examples.sql` for examples including:

- Total order amount per customer
- Customers spending above a threshold
- Top-selling products in a category
- Recursive employee hierarchy

---

