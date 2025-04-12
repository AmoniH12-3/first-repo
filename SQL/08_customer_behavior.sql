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
