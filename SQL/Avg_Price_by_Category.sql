### Showcases the average price of Adult-Use (Recreational) and Medical-Use Cannabis products over the time period
SELECT 
  `Week Ending`,
  `Adult-Use Average Product Price`,
  `Medical Average Product Price`
FROM `sylvan-shuttle-456019-r2.Cannabis_Retail_Sales.Cannabis Retail Sales Data`
ORDER BY `Week Ending`;
