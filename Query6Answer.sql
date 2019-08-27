SELECT customer_id as 'Customer ID', MAX(created_at) as 'Last Order Date' ,  
DATE_ADD(MAX(created_at), INTERVAL  DATEDIFF(MAX(created_at), MIN(created_at)) DAY) as 'Next Projected Expected date',
(sum(total_price - total_tax)/Count(order_id)) as 'Next Projected Order Value'
FROM order_details  
GROUP BY customer_id
HAVING SECOND(MIN(created_at)) < 60 AND COUNT(*) > 1;