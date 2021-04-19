-- Join both order_products table into one large table
CREATE TABLE order_products_complete AS
(SELECT * FROM order_products_prior
UNION
SELECT * FROM order_products_train);

-- Number of orders by product table
SELECT p.product_name, p.product_id, COUNT(o.order_id) AS num_of_orders
INTO orders_by_product
FROM products p
JOIN order_products_train o
ON p.product_id = o.product_id
GROUP BY 1, 2
ORDER BY 3 DESC;

-- Number of reorders by product table
SELECT p.product_name, p.product_id, SUM(o.reordered) AS num_of_reorders
INTO reorders_by_product
FROM products p
JOIN order_products_train o
ON p.product_id = o.product_id
GROUP BY 1, 2
ORDER BY 3 DESC;

-- Number of customers in each customer score
SELECT customer_score, COUNT(user_id)
INTO customer_score_counts
FROM customer_data
GROUP BY 1
ORDER BY 1;

-- Number of orders by gender
SELECT c.gender, COUNT(o.order_id) num_orders
INTO orders_by_gender
FROM customer_data c
JOIN orders ord
ON c.user_id = ord.user_id
JOIN order_products_train o
ON ord.order_id = o.order_id
GROUP BY 1;

-- Number of orders per department
SELECT d.department_id, COUNT(o.order_id) num_orders
INTO orders_by_department
FROM departments d
JOIN products p
ON d.department_id = p.department_id
JOIN order_products_train o
ON p.product_id = o.product_id
GROUP BY 1;

-- Bin users into number of reorders and find counts in each range of reorders
SELECT
      CASE WHEN reordered >= 0 AND reordered < 18    THEN '1 - 18'
           WHEN reordered >= 18 AND reordered < 36   THEN '18 - 35'
           WHEN reordered >= 36 AND reordered < 54  THEN '36 - 53'
           ELSE '54 - 70'
      END Num_of_reorders,
      COUNT(user_id) AS Users_in_Range
	  INTO user_reorder_counts
   FROM
      (SELECT c.user_id, COUNT(t.reordered) reordered
		FROM customer_data C
		JOIN orders o
		ON o.user_id = c.user_id
		JOIN order_products_train t
		ON o.order_id = t.order_id
		GROUP BY 1
		ORDER BY 2 DESC) as table1
   GROUP BY 1
   ORDER BY 2 DESC;