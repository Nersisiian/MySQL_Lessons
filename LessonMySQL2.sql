-- USE shop;

-- SELECT DISTINCT status_id
-- FROM `order`
-- ORDER BY status_id;

-- SELECT og.good_id, COUNT(DISTINCT og.order_id) AS orders_count
-- FROM order2good og
-- GROUP BY og.good_id
-- ORDER BY og.good_id
-- LIMIT 5;

-- SELECT DISTINCT src_status_id, dst_status_id
-- FROM order_status_change
-- ORDER BY src_status_id, dst_status_id;

-- SELECT src_status_id, dst_status_id
-- FROM order_status_change
-- GROUP BY src_status_id, dst_status_id
-- ORDER BY src_status_id, dst_status_id;

-- SELECT s.name, COUNT(o.id) AS cnt
-- FROM `order` o
-- JOIN order_status s ON s.id = o.status_id
-- GROUP BY s.id, s.name
-- ORDER BY cnt ASC;

-- SELECT DISTINCT u.name
-- FROM `user` u
-- JOIN `order` o ON o.user_id = u.id
-- JOIN order2good og ON og.order_id = o.id
-- JOIN good g ON g.id = og.good_id
-- WHERE LOWER(g.name) LIKE '%пуэр%';

-- SELECT g.id, g.name
-- FROM good g
-- LEFT JOIN order2good og ON og.good_id = g.id
-- WHERE og.good_id IS NULL
-- ORDER BY g.id;

-- 


