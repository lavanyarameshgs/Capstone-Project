-- Resolving schema errors and aggregate filtering
SELECT
  c.region AS region_name,
  SUM(o.amount) AS sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.region
HAVING SUM(o.amount) > 80000
ORDER BY sales DESC;