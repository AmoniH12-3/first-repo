SELECT
  DATE(`Week Ending`) AS week,
  SUM(`Adult-Use Retail Sales`) AS adult_use_sales,
  SUM(`Medical Marijuana Retail Sales`) AS medical_sales,
  CASE 
    WHEN SUM(`Adult-Use Retail Sales`) > SUM(`Medical Marijuana Retail Sales`) THEN 'Adult-Use'
    ELSE 'Medical'
  END AS weekly_top_category
