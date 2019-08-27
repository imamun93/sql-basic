#Query 1 Answer
SELECT h.hour as "Hours", sum(o.total_price - o.total_tax) as "Revenue", COUNT(o.order_id) as "Total Number of orders"
FROM order_details o LEFT JOIN hours h
ON DATE_FORMAT(o.created_at, "%Y-%m-%d-%H") = h.hour
GROUP BY h.hour
ORDER BY h.hour DESC;








