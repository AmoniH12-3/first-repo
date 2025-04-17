SELECT
  SUM(`Adult-Use Retail Sales`) AS total_adult_use_sales,
  SUM(`Medical Marijuana Retail Sales`) AS total_medical_sales,
  CASE 
    WHEN SUM(`Adult-Use Retail Sales`) > SUM(`Medical Marijuana Retail Sales`) THEN 'Adult-Use'
    ELSE 'Medical'
  END AS top_selling_category
FROM `sylvan-shuttle-456019-r2.Cannabis_Retail_Sales.Cannabis Retail Sales Data`;
