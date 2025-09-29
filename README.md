# PL/SQL Window Functions Assignment

### Student: Uwimbabazi Sandrine  
### Course: Database Development with PL/SQL (INSY 8311)  
### Instructor: Eric Maniraguha  
### Submission Date: 21 September 2025  

---

## 📌 Problem Definition
A supermarket chain operating in multiple regions records daily sales transactions.  
The management wants to analyze customer behavior and product performance to improve marketing and inventory decisions.

**Objectives:**
- Identify top products in each region/quarter.
- Track sales growth trends month by month.
- Segment customers into quartiles for targeted marketing.
- Calculate running totals and moving averages.

---

## 🎯 Success Criteria
1. **Top 5 Products per Region/Quarter** → `RANK()`  
2. **Running Monthly Sales Totals** → `SUM() OVER()`  
3. **Month-over-Month Growth** → `LAG(), LEAD()`  
4. **Customer Quartiles** → `NTILE(4)`  
5. **3-Month Moving Averages** → `AVG() OVER()`  

---

## 🗂 Database Schema
Three tables were created:  
- **Customers** (`customer_id`, `name`, `region`)  
- **Products** (`product_id`, `name`, `category`)  
- **Transactions** (`transaction_id`, `customer_id`, `product_id`, `sale_date`, `amount`)  

**ER Diagram:**  
![ER Diagram](screenshots/ER.png)

---

## 🛠 Window Functions Implemented

### 🔹 Ranking Functions
**Query:**
```sql
SELECT c.customer_id, c.name, SUM(t.amount) AS total_sales,
       ROW_NUMBER() OVER (ORDER BY SUM(t.amount) DESC) AS row_num,
       RANK() OVER (ORDER BY SUM(t.amount) DESC) AS rank_pos,
       DENSE_RANK() OVER (ORDER BY SUM(t.amount) DESC) AS dense_rank,
       PERCENT_RANK() OVER (ORDER BY SUM(t.amount) DESC) AS percent_rank
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name;
```
![Ranking functions](https://github.com/sandra2303/plsql-window-functions-uwimbabazi-sandrine/blob/main/screnshoots/ranking_function.PNG)

---

###🔹 Aggregate Functions

**Query:**

```sql

SELECT TO_CHAR(t.sale_date, 'YYYY-MM') AS month,
       SUM(t.amount) AS monthly_sales,
       SUM(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM')) AS running_total,
       AVG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM')) AS running_avg
FROM transactions t
GROUP BY TO_CHAR(t.sale_date, 'YYYY-MM')
ORDER BY month;
```
![Aggregate functions](https://github.com/sandra2303/plsql-window-functions-uwimbabazi-sandrine/blob/main/screnshoots/aggregate_function.PNG)

---

###🔹 Navigation Functions

**Query:**

```sql

SELECT TO_CHAR(t.sale_date, 'YYYY-MM') AS month,
       SUM(t.amount) AS monthly_sales,
       LAG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM')) AS prev_month,
       ( (SUM(t.amount) - LAG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM'))) 
          / LAG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM')) ) * 100 AS growth_percent
FROM transactions t
GROUP BY TO_CHAR(t.sale_date, 'YYYY-MM')
ORDER BY month;

```
![Navigation functions](https://github.com/sandra2303/plsql-window-functions-uwimbabazi-sandrine/blob/main/screnshoots/navigation_function.PNG)

---

###🔹 Distribution Functions

**Query:**

```sql

SELECT c.customer_id, c.name, SUM(t.amount) AS total_sales,
       NTILE(4) OVER (ORDER BY SUM(t.amount) DESC) AS quartile,
       CUME_DIST() OVER (ORDER BY SUM(t.amount) DESC) AS cumulative_dist
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name;
```
![Distribution functions](https://github.com/sandra2303/plsql-window-functions-uwimbabazi-sandrine/blob/main/screnshoots/distribution_function.PNG)

---
