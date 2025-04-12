-- STEP 6: Products with Most Returns

SELECT
    Description,
    SUM(Quantity) AS total_returned
FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
WHERE Quantity < 0
GROUP BY Description
ORDER BY total_returned;
