SELECT
    name AS product_name,
    COUNT(*) AS repeat_count,
    MIN(`count`) AS min_count,
    AVG(`count`) AS avg_count,
    MAX(`count`) AS max_count
FROM good
GROUP BY name
HAVING COUNT(*) > 1;

SELECT
    u.name,
    u.email,
    SUM(og.count * og.price) AS total_spent,
    AVG(og.count) AS avg_goods_count
FROM user u
JOIN `order` o ON o.user_id = u.id
JOIN order_good og ON og.order_id = o.id
WHERE u.email LIKE '%.uk'
GROUP BY u.id, u.name, u.email
HAVING
    SUM(og.count * og.price) > 1000
    AND COUNT(DISTINCT o.id) > 1;
