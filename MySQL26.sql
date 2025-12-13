USE shop;

SELECT DISTINCT RIGHT(email, 3) AS tld
FROM `user`
WHERE LENGTH(RIGHT(email, 3)) = 3;

SELECT 
    parent.id AS parent_category_id,
    parent.name AS parent_category_name,
    g.id AS good_id,
    g.name AS good_name,
    g.count AS good_count
FROM good g
JOIN good_category c ON c.id = g.category_id
JOIN good_category parent ON parent.id = c.parent_id
ORDER BY parent.name, g.name;

SELECT 
    CONCAT(
        'Статус заказа номер ', o.id, 
        ' пользователя "', u.name, 
        '" изменился ', DATE(o.creation_date),
        ' с ', src.name, 
        ' на ', dst.name
    ) AS status_change
FROM order_status_change osc
JOIN `order` o ON o.id = osc.order_id
JOIN `user` u ON u.id = o.user_id
JOIN order_status src ON src.id = osc.src_status_id
JOIN order_status dst ON dst.id = osc.dst_status_id
WHERE src.name = 'Доставлен'
  AND dst.name = 'Оплачен'
  AND DATE(o.creation_date) = '2015-05-25';