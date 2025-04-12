-- STEP 4: Total Revenue by Country (Excludes UK)

SELECT 
    Country,
    SUM(Quantity * UnitPrice) AS total_revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
WHERE Country != 'United Kingdom'
GROUP BY Country
ORDER BY total_revenue DESC;
