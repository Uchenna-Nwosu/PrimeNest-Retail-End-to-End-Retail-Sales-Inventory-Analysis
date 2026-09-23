# PrimeNest-Retail-End-to-End-Retail-Sales-Inventory-Analysis

Project Overview

PrimeNest Retail is a fictional retail business used for an end-to-end data analytics portfolio project built across PostgreSQL, SQL, Python, Pandas, Jupyter Notebook, and Matplotlib.

The project combines relational database design, SQL business analysis, Python-based exploratory analysis, Pandas data manipulation, customer and product analysis, payment analysis, employee performance analysis, and inventory monitoring.

The goal was to demonstrate how one retail dataset can move through a complete analytics workflow—from database creation and querying to reusable analytical datasets and business recommendations.

Project Objectives

Design a relational retail database in PostgreSQL

Create and populate interconnected business tables

Maintain referential integrity with primary and foreign keys

Use SQL to answer business questions across multiple tables

Apply advanced SQL techniques such as CASE, subqueries, CTEs, window functions, ranking, and views

Connect Python to PostgreSQL

Load relational tables into Pandas DataFrames

Validate missing values, duplicates, and data types

Analyze customers, products, orders, payments, employees, revenue, and inventory

Create reusable analytical datasets for future reporting and dashboarding

Translate findings into practical business recommendations

Tools & Technologies

PostgreSQL

pgAdmin

SQL

Python

Pandas

NumPy

Matplotlib

Jupyter Notebook

SQLAlchemy

psycopg2

Database Structure

The PrimeNest Retail database contains nine major analytical tables:

Table

Records

Customers

20

Employees

10

Products

20

Categories

10

Suppliers

10

Inventory

20

Orders

100

Order Details

200

Payments

100

The relational model connects customers, employees, products, categories, suppliers, inventory, orders, order details, and payments through primary and foreign keys.

SQL Analysis

The SQL stage covered:

Data exploration

Overall business performance

Sales and order analysis

Product performance

Category performance

Customer analysis

Employee analysis

Monthly sales trends

Payment analysis

Inventory monitoring

Product performance classification using CASE

Above-average product analysis using subqueries

Customer spending analysis using CTEs

Product and employee ranking using window functions

Reusable analytical views

Final consolidated business-performance query

Advanced SQL Techniques Used

JOIN

GROUP BY

CASE

Subqueries

CTEs

RANK()

Window functions

Views

Aggregate functions

Filtering and sorting

Python & Pandas Workflow

Python was connected directly to the PostgreSQL database using SQLAlchemy and psycopg2.

The relational tables were loaded into Pandas DataFrames and analyzed using:

merge()

groupby()

agg()

assign()

sort_values()

rank()

pd.cut()

np.select()

pd.to_datetime()

describe()

corr()

The project also used Matplotlib and Pandas plotting for selected visual summaries.

Data Quality

The Python analysis found:

No missing values across the nine loaded tables

No duplicate rows

Five date fields successfully converted to datetime64[ns]

Useful categorical variation across order status, payment method, warehouse location, and customer attributes

Key Findings

1. Customer Profile

Lagos had the largest customer concentration with 4 customers

Port Harcourt followed with 3 customers

The customer base was evenly split:

10 male

10 female

2. Product Sales vs Revenue

The analysis showed that high sales volume does not automatically mean high revenue.

Highest unit sales

Wireless Mouse — 39 units

Protein Powder — 38 units

SQL Fundamentals — 37 units

Highest product revenue

HP Laptop 15 — approximately ₦24.48M

Samsung Galaxy A55 — approximately ₦12.60M

This demonstrates the importance of evaluating both demand and financial contribution.

3. Category Performance

Electronics generated approximately ₦37.55M, making it the strongest revenue category

Fashion & Clothing followed at approximately ₦2.12M

Books generated the lowest category revenue at approximately ₦486K

By sales volume:

Electronics — 105 units

Health — 74 units

Toys & Games — 65 units

Office Supplies — 24 units

4. Customer Value

The highest-spending customers were:

Tunde Adebayo — approximately ₦6.62M

Mercy Ibrahim — approximately ₦5.59M

Joy Nnamdi — approximately ₦5.47M

Customers were also ranked and segmented into:

High Value

Medium Value

Low Value

This created a reusable structure for customer-retention and loyalty analysis.

5. Monthly Revenue Performance

Highest revenue month: June 2025 — approximately ₦10.28M

Lowest revenue month: December 2025 — approximately ₦0.33M

June contributed approximately 21.33% of annual revenue

November contributed approximately 19.30%

Mean monthly revenue: approximately ₦4.01M

Monthly revenue standard deviation: approximately ₦3.21M

Order-volume/revenue correlation: 0.597

The analysis showed substantial monthly revenue volatility and confirmed that order count alone does not fully explain revenue.

6. Order Status

Delivered — 28 orders

Cancelled — 25

Processing — 21

Shipped — 13

Pending — 13

The 25 cancelled orders represent an important operational issue for further investigation.

7. Payment Performance

Cash on Delivery was the most frequently used payment method

Bank Transfer handled the highest total payment value

65% of transactions were Paid

25% were Refunded

10% were Pending

Refunds represented approximately 27.61% of total payment value

Card had the lowest success rate at approximately 60%

This indicates that transaction frequency and financial value should be analyzed separately.

8. Employee Performance

Employee workload and revenue contribution were not the same.

Employee 101287 handled the most orders: 19

Employee 101284 (Olivia Jones) generated the highest revenue: approximately ₦16.24M from 16 orders

Employee 101289 generated approximately ₦5.55M from only 9 orders

This suggests that employee performance should be measured using order volume, revenue contribution, and average order value together.

9. Inventory & Sales Alignment

The inventory analysis used a sales-to-stock ratio to compare observed demand with available stock.

Strongest sales-to-stock signals included:

Protein Powder — 1.27

HP Laptop 15 — 1.20

Office Chair — 0.96

SQL Fundamentals — 0.93

Remote Control Car — 0.89

Weaker signals included:

Body Lotion — 0.19

Coffee 500g — 0.26

Vitamin C Serum — 0.32

Wireless Mouse — 0.33

Men's Sneakers — 0.33

Inventory segmentation classified:

10 products — Overstock Risk

9 products — Replenishment Priority

1 product — Adequately Stocked

HP Laptop 15 and Samsung Galaxy A55 were both high-revenue products requiring close replenishment attention.

Recommendations

Protect availability of high-revenue products such as HP Laptop 15 and Samsung Galaxy A55.

Prioritize Electronics and Health in inventory and marketing decisions.

Investigate the causes of cancelled orders.

Monitor revenue alongside order volume rather than relying on transaction count alone.

Develop retention strategies for high-value customers.

Monitor refunds and pending transactions more closely.

Evaluate employee performance using workload, revenue, and average order value together.

Replenish products with high sales-to-stock ratios before stock pressure develops.

Investigate overstock risk for slow-moving products before additional purchasing.

Use the Pandas-generated datasets as reusable inputs for future Power BI dashboards and reporting.

Project Limitation

PrimeNest Retail is a fictional project dataset with generated transactional values. The results therefore demonstrate analytical methods and business reasoning rather than the performance of a real-world company.

Conclusion

PrimeNest Retail demonstrates an end-to-end analytics workflow that combines relational database design, advanced SQL, Python, Pandas, and business analysis.

The project shows how technical methods can be used together to answer practical retail questions around product performance, customer value, monthly revenue, payment risk, employee contribution, and inventory alignment.

The strongest lesson from the project is that business performance cannot be measured with one metric alone. Sales volume, revenue, transaction value, customer value, employee workload, and stock levels all provide different pieces of the overall business picture.
