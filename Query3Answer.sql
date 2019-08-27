#Both queries take about 20 minutes each to run

#This query fetch all the orders for all  the hours in which order is placed or not */
SELECT
h.hour as 'HOUR',
sum(o.total_price - o.total_tax) as 'REVENUE',
COUNT(o.order_id) as 'NO ORDER'
FROM hours h
LEFT JOIN order_details o ON DATE_FORMAT(o.created_at, "%Y-%m-%d-%H") = h.hour
GROUP BY h.hour
ORDER BY h.hour DESC;


#This query sets Revenue to Null and Oreder to 0 when there are certain hours for which there is no order placed 

SELECT
h.hour as 'HOUR',
SUM(o.total_price - o.total_tax) as 'REVENUE',
COUNT(o.order_id) as 'NO ORDER'
FROM hours h
LEFT JOIN order_details o ON DATE_FORMAT(o.created_at, "%Y-%m-%d-%H") = h.hour
GROUP BY h.hour
HAVING COUNT(o.order_id) = 0
ORDER BY h.hour DESC