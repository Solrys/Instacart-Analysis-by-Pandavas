# automatic-palm-tree

## Introduction
Instacart is an American Company that operates a grocery delivery and pick-up service in the United States and Canada. The service allows customers to order groceries from participating retailers with the shopping being done by a personal shopper.

## Objective

The dataset chosen for analysis comprises of about 3 million grocery orders placed by around 200,000 customers. The goal is to predict purchasing patterns among these customers to be able to

•	Introduce new products in the market similar to the top selling products <br>
•	To boost sales by providing discounts on products that are frequently purchased<br>
•	To identify which products are least ordered or never re-ordered. With this analysis, the company would be able to reduce overhead costs incurred by carrying items that are less likely to be purchased<br>
•	Segment customers on their purchase frequency and recommend loyalty programs to each group of customers to increase sales.<br>
•	Which time of the day is the busiest for a particular product? A good understanding of this could help with the restocking time for the particular product<br>

## Database
For this project we have chosen to use PostgreSQL to hold our database.

We currently have five related tables in our database, but that is expected to change as we begin to work with and transform our data. The database contains tables holding information on store aisles, departments, products in an order, orders, and available products.


# Machine Learning models
For our project, we will be using Unsupervised learning algorithms like K-means for customer segmentation and product segmentation. For Predictive analytics, we will be using deep learning Neural Networks. 
## K-Means for Customer Segmentation –
Our customers and Orders dataset would be merged for this analysis to group the customers into clusters based on characteristics of 
* Gender
* Age
* Income
* Customer_score
## K-Means for Product Segmentation –
We have almost 50k products in our dataset, studying them individually or even based on aisles or departments can be challenging. Hence, analyzing them in clusters or groups would be beneficial to boost sales, offer promotions and increase overall revenue.  For this purpose, we combined the products dataset with the prior orders dataset to get metrics such as **num_of_orders** and **num_of_reorders** per product. Also using product characteristics such as its department and the aisle it belongs to, we used K-Means algorithm to cluster the products into 4 main clusters –

-	Class 0 - never re-ordered.
-	Class 1 - occasionally re-ordered.
-	Class 2 - often re-ordered or Popular.
-	Class 3 - frequently re-ordered or “In-High Demand”.

## Predictive analysis using Deep learning Neural network models.
Will this product stocked be ever re-ordered? Often, stores carry products that are not as frequently bought as other daily used products such as milk, fruits, etc. Predicting the likelihood if a particular product will be re-ordered is necessary for stores for inventory management. This will also be helpful in decision making for the introduction of new products. Machine learning algorithms such as deep learning neural networks can be employed for this purpose since our data is complex and enormous in size.
We used the prior orders dataset and joined with products, departments, and aisles to build our combined dataset used to train the Neural Network model.
Features:
-	order day of week (order_dow)
-	order hour of day (order_hour_of_day)
-	days since product was bought since prior order (days_since_prior_order)
-	order in which product was added to the cart (add_to_cart_order)
-	total number of re-orders for the product (num_of_reorders)
-	total number of orders for the product (num_of_orders)
-	product department (department)
-	product aisle (aisle)
Target = “reordered”
We used pd.dummies for string  value features and scaled the dataset before training the model.
We received an accuracy of ~70.5% using multiple attempts, by altering the number of inputs, activation functions and the number of hidden layers and the number of epochs.


<img src="preliminary_erd_image.PNG" width="400" height="240"/>


