
--SCENARIO: The business has recently appointed a new CEO whose mission is to grow the company’s revenue and improve product performance. Your role, as a Junior Data Analyst, is to extract actionable insights from historical data and prepare a presentation to assist the CEO in decision-making.--
SELECT 
   transaction_id,
   TO_DATE(transaction_date) AS transaction_date,
   DAYNAME(TO_DATE(transaction_date)) AS nameofday,
   MONTHNAME(TO_DATE(transaction_date)) AS nameofmonth,
   TO_CHAR(TO_DATE(transaction_date), 'YYYYMMDD') AS monthid,
   COUNT(DISTINCT transaction_qty) AS no_of_sales,
   --totalrevenue--
   SUM(transaction_qty * unit_price) As revenue_per_transaction,
   CASE 
      WHEN transaction_time BETWEEN '00:00:00' AND '12:00:00' THEN 'MORNING'
      WHEN transaction_time BETWEEN '12:00:01' AND '17:00:00' THEN'AFTERNOON'
      WHEN transaction_time BETWEEN '17:00:01' AND '23:59:59' THEN 'EVENING'
      ELSE 'Unknown'
   END AS time_bucket,
   --productcategories--
   transaction_qty,
   transaction_time,
   product_category,
   product_detail,
   product_type,
   store_location  
FROM COFFEE
GROUP BY ALL;
