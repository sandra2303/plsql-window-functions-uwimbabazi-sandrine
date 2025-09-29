-- Ranking customers by total spending
SELECT c.customer_id, c.name, SUM(t.amount) AS total_sales,
       ROW_NUMBER() OVER (ORDER BY SUM(t.amount) DESC) AS row_num,
       RANK() OVER (ORDER BY SUM(t.amount) DESC) AS rank_pos,
       DENSE_RANK() OVER (ORDER BY SUM(t.amount) DESC) AS dense_rank,
       PERCENT_RANK() OVER (ORDER BY SUM(t.amount) DESC) AS percent_rank
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name;

-- Running total and average monthly sales
SELECT TO_CHAR(t.sale_date, 'YYYY-MM') AS month,
       SUM(t.amount) AS monthly_sales,
       SUM(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM')) AS running_total,
       AVG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM')) AS running_avg
FROM transactions t
GROUP BY TO_CHAR(t.sale_date, 'YYYY-MM')
ORDER BY month;

-- Month-over-month sales growth
SELECT TO_CHAR(t.sale_date, 'YYYY-MM') AS month,
       SUM(t.amount) AS monthly_sales,
       LAG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM')) AS prev_month,
       ( (SUM(t.amount) - LAG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM'))) 
          / LAG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.sale_date, 'YYYY-MM')) ) * 100 AS growth_percent
FROM transactions t
GROUP BY TO_CHAR(t.sale_date, 'YYYY-MM')
ORDER BY month;

-- Divide customers into quartiles by spending
SELECT c.customer_id, c.name, SUM(t.amount) AS total_sales,
       NTILE(4) OVER (ORDER BY SUM(t.amount) DESC) AS quartile,
       CUME_DIST() OVER (ORDER BY SUM(t.amount) DESC) AS cumulative_dist
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.name;
