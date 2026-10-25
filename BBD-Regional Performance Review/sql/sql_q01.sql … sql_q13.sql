-- ========================================
-- Query Q01
-- ========================================
-- Pending orders
SELECT
  o.order_id,
  o.customer_id,
  o.item,
  o.amount
FROM orders o
WHERE o.status = 'pending'
ORDER BY o.order_id ASC;

-- ========================================
-- Query Q02
-- ========================================
-- Missing (NULL) amount
SELECT
  o.order_id,
  o.customer_id,
  o.item,
  o.status
FROM orders o
WHERE o.amount IS NULL
ORDER BY o.order_id ASC;

-- ========================================
-- Query Q03
-- ========================================
-- Five bigest completed orders
SELECT
  o.order_id,
  o.customer_id,
  o.item,
  o.amount
FROM orders o
WHERE o.status = 'completed'
ORDER BY o.amount DESC, o.order_id ASC
LIMIT 5;

-- ========================================
-- Query Q04
-- ========================================
-- Target customer segment
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  c.region,
  c.age
FROM customers c
WHERE c.region IN ('North', 'West')
  AND c.age BETWEEN 25 AND 40
ORDER BY c.age ASC, c.customer_id ASC;

-- ========================================
-- Query Q05
-- ========================================
-- Headline KPIs
SELECT
  COUNT(o.order_id) AS total_orders,
  SUM(o.amount) AS total_revenue,
  AVG(o.amount) AS avg_order_value,
  MIN(o.amount) AS min_order_value,
  MAX(o.amount) AS max_order_value
FROM orders o
WHERE o.status = 'completed';

-- ========================================
-- Query Q06
-- ========================================
-- Order by status
SELECT
  o.status,
  COUNT(o.order_id) AS number_of_orders,
  SUM(o.amount) AS total_amount
FROM orders o
GROUP BY o.status
ORDER BY COUNT(o.order_id) DESC;

-- ========================================
-- Query Q07
-- ========================================
--Strong products
SELECT
  o.item,
  COUNT(o.order_id) AS number_of_orders,
  SUM(o.amount) AS revenue
FROM orders o
WHERE o.status = 'completed'
GROUP BY o.item
HAVING SUM(o.amount) > 20000
ORDER BY SUM(o.amount) DESC;

-- ========================================
-- Query Q08
-- ========================================
-- Customers profile by region
SELECT
  c.region,
  COUNT(c.customer_id) AS number_of_customers,
  AVG(c.age) AS average_age,
  MIN(c.age) AS min_age,
  MAX(c.age) AS max_age
FROM customers c
GROUP BY c.region
ORDER BY c.region ASC;

-- ========================================
-- Query Q09
-- ========================================
-- Order-level fact table
SELECT
  o.order_id,
  o.order_month,
  c.first_name,
  c.last_name,
  c.region,
  r.rep_name,
  o.item,
  o.quantity,
  o.amount,
  o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN reps r ON c.rep_id = r.rep_id
ORDER BY o.order_id ASC;

-- ========================================
-- Query Q10
-- ========================================
-- Customers who never ordered
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  c.region
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id ASC;

-- ========================================
-- Query Q11
-- ========================================
--  Region and month report.
SELECT
  c.region,
  o.order_month,
  COUNT(o.order_id) AS number_of_orders,
  COUNT(DISTINCT c.customer_id) AS number_of_customers,
  SUM(o.amount) AS total_revenue,
  AVG(o.amount) AS average_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'completed'
GROUP BY c.region, o.order_month
ORDER BY c.region ASC, o.order_month ASC;

-- ========================================
-- Query Q12
-- ========================================
-- Product contribution tiers
SELECT
  o.item,
  SUM(o.amount) AS total_revenue,
  CASE
    WHEN SUM(o.amount) >= 60000 THEN 'High'
    WHEN SUM(o.amount) >= 15000 THEN 'Medium'
    ELSE 'Low'
  END AS contribution_tier
FROM orders o
WHERE o.status = 'completed'
GROUP BY o.item
ORDER BY SUM(o.amount) DESC;

-- ========================================
-- Query Q13
-- ========================================
-- Rep perform against target
SELECT
  r.rep_name,
  o.order_month,
  r.monthly_target,
  SUM(o.amount) AS revenue,
  CASE
    WHEN SUM(o.amount) < r.monthly_target THEN 'Below Target'
    WHEN SUM(o.amount) >= r.monthly_target AND SUM(o.amount) < (1.1 * r.monthly_target) THEN 'On Target'
    ELSE 'Above Target'
  END AS performance_tier
FROM reps r
JOIN customers c ON r.rep_id = c.rep_id
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY r.rep_name, o.order_month, r.monthly_target
ORDER BY r.rep_name ASC, o.order_month ASC;

