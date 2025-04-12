-- STEP 3: Top 10 Customers by Revenue

SELECT 
    CustomerID,
    SUM(Quantity * UnitPrice) AS customer_revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
GROUP BY CustomerID
ORDER BY customer_revenue DESC
LIMIT 10;
