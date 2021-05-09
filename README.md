# Instacart-Analysis-by-Pandavas
A collaboration 

For this project we created and AWS RDS instance connected to pgAdmin to store our database.  By using AWS we were able to ease the process of sharing the database amongst team members.

The data used for our project resulted in six related tables.  The tables contain information on store aisles, departments, products in an order, orders, available products, and customers.  

<img src="erd_diagram_v2.PNG" width="400" height="240"/>

Six additional tables have been created to analyze the data. A table named customer_score_counts containing the number of customers in each customer score from 4 to 100. Tables containg the number of orders for each department, number of orders by gender, and number of orders and reorders by product have also been created. A table named user_reorder_counts has also been created.  This table bins users into ranges of 1-18 reorders, 18-35, 36-53, and 54-70 reorders and counts the number of users in each range to determine most users are in the lower ranges.
