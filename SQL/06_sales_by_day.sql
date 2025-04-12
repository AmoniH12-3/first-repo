STEP 5: Revenue by Day of Week

SELECT 
    EXTRACT(DAYOFWEEK FROM InvoiceDate) AS day_num,
    FORMAT_DATE('%A', DATE(InvoiceDate)) AS day_name,
    SUM(Quantity * UnitPrice) AS revenue
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
GROUP BY day_num, day_name
ORDER BY day_num;
