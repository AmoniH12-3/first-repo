-- STEP 2: Monthly Revenue Trend

SELECT 
    DATE_TRUNC(InvoiceDate, MONTH) AS month,
    SUM(Quantity * UnitPrice) AS monthly_revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
GROUP BY month
ORDER BY month;
