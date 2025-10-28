SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name,
       MONTHNAME(transaction_date) AS month_name,
       CASE
       WHEN day_name IN ('Sun','Sat') THEN 'Weekend'
       ELSE 'Weekday' 
       END AS day_classification,

       transaction_time,
       CASE
       WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
       WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
       WHEN transaction_time >= '18:00:00' THEN 'Evening'
       END AS time_bucket,

       HOUR(transaction_time) AS hour_of_day,

       ---catagorial data
       store_location,
       product_type,
       product_detail,
       product_category,
       ---unit_price,
       ---transaction_qty,
       COUNT(DISTINCT transaction_id) AS number_of_sales,
       SUM(transaction_qty*unit_price) AS Revenue,

       ----IDs

       COUNT (DISTINCT transaction_id) AS number_of_sales,

       ---revenue calculation

       SUM(transaction_qty*unit_price) AS revenue,
  FROM
  "CASESTUDY"."COFFEESHOP"."SALES"
  GROUP BY ALL
