-- STEP 0: Data Cleaning and Preprocessing
-- This file includes basic exploration and cleaning steps
-- Dataset: E_Commerce_Sales_Data

-- Sample rows from dataset showcasing the first 10 rows
SELECT * FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data` LIMIT 10;

-- Count total records
SELECT COUNT(*) FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`;

-- Count null CustomerID entries
SELECT COUNT(*) FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data` WHERE CustomerID IS NULL;

-- Delete rows with null CustomerID or Description
DELETE FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
WHERE CustomerID IS NULL OR Description IS NULL;

-- Delete canceled orders (InvoiceNo starting with 'C')
DELETE FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
WHERE InvoiceNo LIKE 'C%';

-- STEP 1: Top Products by Total Revenue

SELECT 
    Description,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;

-- STEP 2: Monthly Revenue Trend

SELECT 
    DATE_TRUNC(InvoiceDate, MONTH) AS month,
    SUM(Quantity * UnitPrice) AS monthly_revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
GROUP BY month
ORDER BY month;

-- STEP 3: Top Customers by Revenue

SELECT 
    CustomerID,
    SUM(Quantity * UnitPrice) AS customer_revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
GROUP BY CustomerID
ORDER BY customer_revenue DESC
LIMIT 10;

-- STEP 4: Total Revenue by Country (Excludes UK)

SELECT 
    Country,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
WHERE Country != 'United Kingdom'
GROUP BY Country
ORDER BY total_revenue DESC;

-- STEP 5: Revenue by Day of Week

SELECT 
    EXTRACT(DAYOFWEEK FROM InvoiceDate) AS day_num,
    FORMAT_DATE('%A', DATE(InvoiceDate)) AS day_name,
    SUM(Quantity * UnitPrice) AS revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
GROUP BY day_num, day_name
ORDER BY day_num;

-- STEP 6: Products with Most Returns

SELECT 
    Description,
    SUM(Quantity) AS total_returned
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
WHERE Quantity < 0
GROUP BY Description
ORDER BY total_returned;

-- STEP 7: Customer Purchase Behavior & AOV

SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    SUM(Quantity * UnitPrice) AS total_spent,
    SUM(Quantity * UnitPrice)/COUNT(DISTINCT InvoiceNo) AS avg_order_value
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
GROUP BY CustomerID
ORDER BY avg_order_value DESC
LIMIT 10;

## SQL Queries Overview

| Step | Description                     | File |
|------|----------------------------------|------|
| 0    | Data Cleaning & Preprocessing    | [00_data_cleaning.sql](SQL/00_data_cleaning.sql) |
| 1    | Top Products by Revenue          | [01_top_products.sql](SQL/01_top_products.sql) |
| 2    | Monthly Revenue Trend            | [02_monthly_revenue.sql](SQL/02_monthly_revenue.sql) |
| 3    | Top Customers                    | [03_top_customers.sql](SQL/03_top_customers.sql) |
| 4    | Country Revenue (ex-UK)          | [04_country_revenue.sql](SQL/04_country_revenue.sql) |
| 5    | Sales by Day Heatmap             | [05_sales_by_day.sql](SQL/05_sales_by_day.sql) |
| 6    | Product Returns                  | [06_returns_analysis.sql](SQL/06_returns_analysis.sql) |
| 7    | Customer Behavior & AOV          | [07_customer_behavior.sql](SQL/07_customer_behavior.sql) |
