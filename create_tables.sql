-- Creating tables for our database

-- Create table for aisles
CREATE TABLE aisles (
	aisle_id INT NOT NULL,
	aisle VARCHAR(40) NOT NULL,
	PRIMARY KEY (aisle_id)
);

-- Create table for departments
CREATE TABLE departments (
	department_id INT NOT NULL,
	department VARCHAR(40) NOT NULL,
	PRIMARY KEY (department_id)
);

-- Create table for order_products_prior
CREATE TABLE order_products_prior (
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	add_to_cart_order INT,
	reordered INT,
	FOREIGN KEY (product_id) REFERENCES products (product_id),
	PRIMARY KEY (order_id, product_id)
);
	
-- Create table for order_products_train
CREATE TABLE order_products_train (
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	add_to_cart_order INT,
	reordered INT,
	FOREIGN KEY (product_id) REFERENCES products (product_id),
	PRIMARY KEY (order_id, product_id)
);

-- Create table for orders
CREATE TABLE orders (
	order_id INT NOT NULL,
	user_id INT NOT NULL,
	eval_set VARCHAR,
	order_number INT,
	order_dow INT,
	order_hour_of_day INT,
	days_since_prior_order INT,
	FOREIGN KEY (order_id) REFERENCES order_products_prior (order_id),
	FOREIGN KEY (order_id) REFERENCES order_products_train (order_id),
	PRIMARY KEY (order_id, user_id)
);

-- Create table for products
CREATE TABLE products (
	product_id INT NOT NULL,
	product_name VARCHAR NOT NULL,
	aisle_id INT NOT NULL,
	department_id INT NOT NULL,
	FOREIGN KEY (aisle_id) REFERENCES aisles (aisle_id),
	FOREIGN KEY (department_id) REFERENCES departments (department_id),
	PRIMARY KEY (product_id)
);

-- Create table for customers
CREATE TABLE customer_data (
	user_id INT NOT NULL,
	gender VARCHAR NOT NULL,
	age FLOAT,
	income INT,
	customer_score INT,
	PRIMARY KEY (user_id)
);