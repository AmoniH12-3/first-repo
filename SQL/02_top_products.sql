-- STEP 1: Top 10 Products by Total Revenue

SELECT 
    Description,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;
