-- Remove records with missing CustomerID or Description
DELETE FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
WHERE CustomerID IS NULL OR Description IS NULL;

-- Remove returned items (cancelled invoices)
DELETE FROM `subtle-signal-456022-n0.E_Commerce_Data.E_Commerce_Sales_Data`
WHERE InvoiceNo LIKE 'C%';

