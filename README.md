# automatic-palm-tree

## Introduction
Instacart is an American Company that operates a grocery delivery and pick-up service in the United States and Canada. The service allows customers to order groceries from participating retailers with the shopping being done by a personal shopper.

## Objective

The dataset chosen for analysis comprises of about 3 million grocery orders placed by around 200,000 customers. The goal is to predict purchasing patterns among these customers to be able to

•	Introduce new products in the market similar to the top selling products by department <br>
. Highlight the most popular vs least popular aisles across the store
. Plot order count vs reorder count by product
•	To boost sales by providing discounts on products that are frequently purchased<br>
•	To identify which products are least ordered or never re-ordered. With this analysis, the company would be able to reduce overhead costs incurred by carrying items that are less likely to be purchased<br>
•	Segment customers on their purchase frequency and recommend loyalty programs to each group of customers to increase sales.<br>
•	Which time of the day is the busiest for a particular product? A good understanding of this could help with the restocking time for the particular product<br>

## Database
For this project we have chosen to use PostgreSQL to hold our database.

We currently have five related tables in our database, but that is expected to change as we begin to work with and transform our data. The database contains tables holding information on store aisles, departments, products in an order, orders, and available products.

<img src="preliminary_erd_image.PNG" width="400" height="240"/>

