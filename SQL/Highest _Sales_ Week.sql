### Showcases the highest selling week within the time period
SELECT 
  `Week Ending`,
  `Total Adult-Use and Medical Sales`
FROM`sylvan-shuttle-456019-r2.Cannabis_Retail_Sales.Cannabis Retail Sales Data`
ORDER BY `Total Adult-Use and Medical Sales` DESC
LIMIT 1;
