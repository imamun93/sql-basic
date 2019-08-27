#takes about 20 minutes to run
SELECT
h.hour as 'HOUR',
COUNT(o.order_id) as 'NO ORDER'
FROM hours h
LEFT JOIN order_details o ON DATE_FORMAT(o.created_at, "%Y-%m-%d-%H") = h.hour
GROUP BY h.hour
HAVING COUNT(o.order_id) = 0
