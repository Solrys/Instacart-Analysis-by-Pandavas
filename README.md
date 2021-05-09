# Instacart Analysis


## Introduction
Instacart is an American Company that operates a grocery delivery and pick-up service in the United States and Canada. The service allows customers to order groceries from participating retailers with the shopping being done by a personal shopper.

During the COVID-19 lockdown, Instacart became an essential service for millions of Americans trapped at home. Even as early as February, Instacart started noticing unusual demand for items such as toilet paper, canned vegetables and long-life milk. 
Analysts expect sustained growth in this field as new Instacart users have discovered the ease of ordering online and now prefer shopping online even as Covid restrictions are being lifted.

Instacart reportedly generated $1.5 billion revenue in 2020, with $35 billion worth of sales. During the coronavirus pandemic, Instacart hit its first profitable month, netting $10 million. Instacart has an estimated 9.6 million active users and over 500,000 shoppers who pick up the items. In March 2021, Instacart was valued at $39 billion


## Objective

The dataset chosen for analysis comprises of about 3 million grocery orders placed by around 200,000 customers. The goal is to predict purchasing patterns among these customers as well as gain insight on customer segmentation.

### Market Basket Analysis:

-	Introduce new products in the market similar to the top selling products
- Introduce new products in the market similar to the top selling products by department
- Highlight the most popular vs least popular aisles across the store
- Plot order count vs reorder count by product
- To boost sales by providing discounts on products that are frequently purchased<br>
- To identify which products are least ordered or never re-ordered. With this analysis, the company would be able to reduce overhead costs incurred by carrying items that are less likely to be purchased
- Segment customers on their purchase frequency and recommend loyalty programs to each group of customers to increase sales.
- Which time of the day is the busiest for a particular product? A good understanding of this could help with the restocking time for the particular product.

### Customer Segmentation:
*  What is the distribution of annual Income by age?
*  What is the distribution of gender for Instacart users?
*  What is the age group of most frequent Instacart users
*  What is the overall distribution of income level for instacart users?
*  How do male and female spending scores differ? 

## Introduction
Instacart is an American Company that operates a grocery delivery and pick-up service in the United States and Canada. The service allows customers to order groceries from participating retailers with the shopping being done by a personal shopper.

During the COVID-19 lockdown, Instacart became an essential service for millions of Americans trapped at home. Even as early as February, Instacart started noticing unusual demand for items such as toilet paper, canned vegetables and long-life milk. 
Analysts expect sustained growth in this field as new Instacart users have discovered the ease of ordering online and now prefer shopping online even as Covid restrictions are being lifted.

Instacart reportedly generated $1.5 billion revenue in 2020, with $35 billion worth of sales. During the coronavirus pandemic, Instacart hit its first profitable month, netting $10 million. Instacart has an estimated 9.6 million active users and over 500,000 shoppers who pick up the items. In March 2021, Instacart was valued at $39 billion


## Objective

The dataset chosen for analysis comprises of about 3 million grocery orders placed by around 200,000 customers. The goal is to predict purchasing patterns among these customers as well as gain insight on customer segmentation.

### Market Basket Analysis:

-	Introduce new products in the market similar to the top selling products
- Introduce new products in the market similar to the top selling products by department
- Highlight the most popular vs least popular aisles across the store
- Plot order count vs reorder count by product
- To boost sales by providing discounts on products that are frequently purchased<br>
- To identify which products are least ordered or never re-ordered. With this analysis, the company would be able to reduce overhead costs incurred by carrying items that are less likely to be purchased
- Segment customers on their purchase frequency and recommend loyalty programs to each group of customers to increase sales.
- Which time of the day is the busiest for a particular product? A good understanding of this could help with the restocking time for the particular product.

### Customer Segmentation:
*  What is the distribution of annual Income by age?
*  What is the distribution of gender for Instacart users?
*  What is the age group of most frequent Instacart users
*  What is the overall distribution of income level for instacart users?
*  How do male and female spending scores differ? 


## Database

For this project we created and AWS RDS instance connected to pgAdmin to store our database.  By using AWS we were able to ease the process of sharing the database amongst team members.
  
The data used for our project resulted in six related tables. The tables contain information on store aisles, departments, products in an order, orders, available products, and customers.

<img src="erd_diagram_v2.PNG" width="400" height="240"/>

Six additional tables have been created to analyze the data. A table named customer_score_counts containing the number of customers in each customer score from 4 to 100. Tables containg the number of orders for each department, number of orders by gender, and number of orders and reorders by product have also been created. A table named user_reorder_counts has also been created; this table bins users into ranges of 1-18 reorders, 18-35, 36-53, and 54-70 reorders and counts the number of users in each range to determine most users are in the lower ranges. 

## Machine Learning models
For our project, we will be using Unsupervised learning algorithms like K-means for customer segmentation and product segmentation. For Predictive analytics, we will be using deep learning Neural Networks. 
### K-Means for Customer Segmentation –
Our customers and Orders dataset would be merged for this analysis to group the customers into clusters based on characteristics of 
* Gender
* Age
* Income
* Customer_score

### DBSCAN
For our first Machine model study we used a dbscan algorithm  Or Density Based Clustering, . This algorithm groups clusters as areas of high density separated by areas of low density. Because dbscans aren’t limited to clustering in elliptical shapes around a centroid Our DBSAN was able to identify a number of clusters similar in behavior. These clusters could be useful if for creating more tailored promotion initiatives since these consumers are very close in their habits towards spending. 

NOTE : Density = Number of points within a specified radius
DBSCAN uses two different parameters:
Epsilon: Determines a specified radius that if includes enough number of points within, we call it dense area.
Minimum Samples: Determines the minimum number of data points we want in a neighborhood to define a cluster.)

### The KNN model 
We also created a  knn, or  k nearest neighbor model, relies on supervised data. We tried 3, 4, and 5 clusters. This combined the classification of the K nearest points.  It is supervised because you are trying to classify a point based on the known classification of other points. 

### The KMeans model
The KMEANS model proved most useful for our goal of creating clusters and then based on that segmentation we categorized these  clusters and ranked them based on their relationship to income and spending. 
The clusters we found represented tho following labels:
*  Careless
*  Standard
*  Target
*  Careful

Careless, (light pink Annual income are low but the spending is high.
Standard, (light blue)The annual income and spending score both are in mid range.
Target, (Dark Blue). Annual income and spending score are higher.
Careful, (magenta) Annual income is high but spending is low. 

Grouping our customers this way will help us determine how to target specific demographics and engage them through a variety of promotions. 

### Hierarchical Dendograms
Hierarchical dendograms are really useful because it shows all the possible linkages within a cluster. 

We used an agglomerative algorithm way which started from the bottom up.  In other words it starts with all the various individual data samples, and then groups them into clusters based on the their similarities until you are left with one final cluster at the top. This model was great and because it illustrates the inner workings of the clustering and their relationship to each other. 

### K-Means for Product Segmentation –
We combined the products dataset with the prior orders dataset to get metrics such as **num_of_orders** and **num_of_reorders** per product. Also using product characteristics such as its department and the aisle it belongs to, we used K-Means algorithm to cluster the products into 4 main clusters –
-	Class 0 - never re-ordered.
-	Class 1 - occasionally re-ordered.
-	Class 2 - often re-ordered or **Popular**.
-	Class 3 - frequently re-ordered or **“In-High Demand”**.
### Predictive analysis using Deep learning Neural network models.
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
- Target = **“reordered”**
We used pd.dummies for string  value features and scaled the dataset before training the model.
We received an accuracy of ~70.5% using multiple attempts, by altering the number of inputs, activation functions and the number of hidden layers and the number of epochs.

## Tableau Images

### Product Analysis:

#### Top N Products by Department
![Top N Products by Department](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/Surekha/Tableau%20Images/Products/Top%20N%20Products%20by%20Department.PNG) <br>
##### Results : Orders from the Produce Department exceeded the orders from other departments significantly

#### %Products Never Ordered by Aisle
![%Products Never Ordered by Aisle](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/Surekha/Tableau%20Images/Products/%25%20Products%20Never%20Ordered%20by%20Aisle.PNG)<br>
##### Results : The top 2 aisles that had over 40% of its products never ordered were Beauty and Baby Accessories

#### Least Re-ordered Products
![Least Re-ordered Products](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/Surekha/Tableau%20Images/Products/Least%20Re-ordered%20Products.PNG)<br>
##### Results : Top 5 products that were least reordered were Corn Starch,Paprika,Bay Leaves,Cayenne Pepper and Ground Ginger. These products need to be re-evaluated to understand the reason behind these not being re-ordered

#### Market Basket Analysis
![Market Basket Analysis](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/Surekha/Tableau%20Images/Products/Market%20Basket%20Analysis.PNG)<br>
##### Results: the top 3 items bought together include Organic Hass Avocado and Bag of Organic Bananas, Organic Strawberries and Bag of Organic Bananas and Organic Baby Spinach and Bananas.

#### Order Volumes based on DOW and Time
![Order Volumes based on DOW and Time](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/Surekha/Tableau%20Images/Products/Order%20Volumes%20based%20on%20DOW%20and%20Time.PNG)<br>
##### Results: Saturday and Sunday were the days with the highest number of orders with peak order time between 12 to 2 PM on Saturdays and 9 to 11 AM on Sundays.

#### Products Ordered together
![Products Ordered together](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/Surekha/Tableau%20Images/Products/Products%20Ordered%20together.PNG)

### Customer Analysis

#### Analysis by Customer Age
![Analysis by Customer Age](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/main/Tableau%20Images/Customer/Customer%20Analysis%20by%20Age.PNG)

#### Analysis by Gender
![Analysis by Gender](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/main/Tableau%20Images/Customer/Customer%20Analysis%20by%20Gender.PNG)

#### Analysis by Income
![Analysis by Income](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/main/Tableau%20Images/Customer/Customer%20Analysis%20by%20Income.PNG)

#### Orders by Age
![Orders by Age](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/main/Tableau%20Images/Customer/Orders%20Analysis%20by%20Age.PNG)<br>
##### Results: Biggest users of Instacart were people in the age group of 55-70. These people seemed to shop the most on Saturdays followed by Sundays.Close second were people of the age group 40-55.

#### Orders by Age and Gender
![Orders by Age and Gender](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/main/Tableau%20Images/Customer/Orders%20by%20Age%20and%20Gender.PNG)

#### Spending Trends by Gender and Income
![Spending Trends](https://github.com/acorrales650/Instacart-Analysis-by-Pandavas/blob/main/Tableau%20Images/Customer/Spening%20trends%20by%20Gender%20and%20Income.PNG)<br>
##### Results: Highest spenders per our analysis was the age group of 60-75K for both Female and Male customers

## Group Communication Protocols

The group members will remain in consistent contact through the Slack app and will hold meetings via Zoom throughout the week to discuss arising challenges, delgate tasks, and ensure the progress of the project.

## Presentation 
[Click Here to View Google Slide Presentation](https://docs.google.com/presentation/d/1Em1EJJ7RFDe6lQUdzrOOEO2_fN0sd_4-sNbsHl7Ewz4/edit#slide=id.g35f391192_00)


