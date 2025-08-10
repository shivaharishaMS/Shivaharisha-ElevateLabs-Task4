-- Step 1: Simple SELECT
SELECT * FROM orders
LIMIT 10;

-- Step 2: WHERE filter
SELECT * FROM orders
WHERE order_status = 'delivered'
LIMIT 10;

-- Step 3: ORDER BY
SELECT order_id, order_purchase_timestamp
FROM orders
ORDER BY order_purchase_timestamp DESC
LIMIT 10;

-- Step 4: GROUP BY with aggregation
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;

-- Step 5: Join two tables
SELECT o.order_id, o.customer_id, oi.product_id, oi.price
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
LIMIT 10;

-- Step 6: Subquery example
SELECT order_id, price
FROM order_items
WHERE price > (
    SELECT AVG(price) FROM order_items
)
LIMIT 10;

-- Step 7: Aggregate functions
SELECT MIN(price) AS min_price,
       MAX(price) AS max_price,
       AVG(price) AS avg_price
FROM order_items;

-- Step 8: Complex join with aggregation
SELECT c.customer_city,
       COUNT(o.order_id) AS total_orders
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_city
ORDER BY total_orders DESC
LIMIT 10;

-- Step 9: Create a view for top categories
CREATE VIEW IF NOT EXISTS top_categories AS
SELECT p.product_category_name,
       ROUND(SUM(oi.price), 2) AS total_sales
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC
LIMIT 10;

-- View the data from the new view
SELECT * FROM top_categories;

-- Step 10: Create an index (fixed with IF NOT EXISTS)
CREATE INDEX IF NOT EXISTS idx_order_items_order_id
ON order_items(order_id);
