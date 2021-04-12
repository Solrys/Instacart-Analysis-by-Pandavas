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


<img src="preliminary_erd_image.PNG" width="400" height="240"/>

# Machine Learning models
For our project, we will be using Unsupervised learning algorithms like K-means for customer segmentation and product segmentation. For Predictive analytics, we will be using deep learning Neural Networks. 
## K-Means for Customer Segmentation –
Our customers and Orders dataset would be merged for this analysis to group the customers into clusters based on characteristics of 
* Gender
* Age
* Income
* Customer_score
## K-Means for Product Segmentation –
We will be joining the product and orders dataset for this purpose, which would include characteristics such as-
* product_id
* dept_id
* aisle_id
* add_to_card_order
*  reordered_status
## Predictive analysis using Deep learning Neural network models.
Understanding retail industry can be tricky and evolving hence we will be using Deep Neural Networks for this purpose as many of the relationships between inputs and outputs are non-linear as well as complex.
 


