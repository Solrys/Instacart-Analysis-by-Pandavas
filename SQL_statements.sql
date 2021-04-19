CREATE TABLE order_products_complete AS
(SELECT * FROM order_products_prior
UNION
SELECT * FROM order_products_train);

SELECT p.product_name, p.product_id, COUNT(o.order_id) AS num_of_orders
INTO orders_by_product
FROM products p
JOIN order_products_train o
ON p.product_id = o.product_id
GROUP BY 1, 2
ORDER BY 3 DESC;

SELECT p.product_name, p.product_id, SUM(o.reordered) AS num_of_reorders
INTO reorders_by_product
FROM products p
JOIN order_products_train o
ON p.product_id = o.product_id
GROUP BY 1, 2
ORDER BY 3 DESC;

SELECT customer_score, COUNT(user_id)
INTO customer_score_counts
FROM customer_data
GROUP BY 1
ORDER BY 1;