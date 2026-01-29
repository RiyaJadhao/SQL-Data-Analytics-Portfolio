# Window Functions in SQL (Advanced Analytics)

This folder contains hands-on SQL examples demonstrating **Window Functions**, 
which are used for advanced analytics without collapsing rows like GROUP BY.

Window functions are essential for:
- Ranking
- Running totals
- Trend analysis
- Comparisons between rows
- Time-based analytics

---

## 🧠 Topics Covered

| File | Concept |
|------|--------|
| 01_row_number.sql | ROW_NUMBER() |
| 02_rank_dense_rank.sql | RANK() vs DENSE_RANK() |
| 03_ntile.sql | NTILE() Bucketing |
| 04_lag_lead.sql | LAG() & LEAD() |
| 05_cumulative_agg.sql | Running totals & moving averages |
| 06_partitioning.sql | PARTITION BY usage |

---

## 🗂 Tables Used
- Customers
- Orders
- Products
- Payments

Refer to **ERD.png** for table relationships.

---

## 💡 Why Window Functions?
Unlike GROUP BY, window functions:
- Keep row-level data
- Enable advanced ranking & analytics
- Are heavily used in Data Analyst interviews

---

## ✅ How to Use
Run each `.sql` file independently in:
- MySQL 8+
- PostgreSQL
- SQL Server
- BigQuery (with minor syntax changes)
