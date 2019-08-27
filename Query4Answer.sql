SELECT sum(total_price - total_tax) as 'Revenue', COUNT(order_id) as 'Customer Orders' FROM order_details 
GROUP BY customer_id
HAVING COUNT(*) > 1

UNION

SELECT sum(total_price - total_tax) as 'Revenue', COUNT(order_id) as 'Customer Orders' FROM order_details 
GROUP BY customer_id
HAVING COUNT(*) = 1;