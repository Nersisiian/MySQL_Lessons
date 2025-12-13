USE shop;

SELECT
    parent.id AS parent_category_id,
    parent.name AS parent_category_name,
    COUNT(g.id) AS goods_count,
    IF(COUNT(g.id) % 2 = 0, 'чётное', 'нечётное') AS parity
FROM good g
JOIN good_category c ON c.id = g.category_id
JOIN good_category parent ON parent.id = c.parent_id
GROUP BY parent.id, parent.name;

SELECT
    c.id AS category_id,
    c.name AS category_name,
    SUM(g.count) AS total_count,
    IF(parent.name <> 'Чай', 'NOT TEA',
        IF(g.count > 500, 'ENOUGH', 'NOT ENOUGH')
    ) AS status
FROM good g
JOIN good_category c ON c.id = g.category_id
LEFT JOIN good_category parent ON parent.id = c.parent_id
GROUP BY c.id, c.name, status
HAVING SUM(g.price * g.count) >= 390000;

SELECT
    c.id AS category_id,
    c.name AS category_name,
    SUM(g.count) AS total_count,
    CASE
        WHEN parent.name <> 'Чай' THEN 'NOT TEA'
        WHEN g.count > 500 THEN 'ENOUGH'
        ELSE 'NOT ENOUGH'
    END AS status
FROM good g
JOIN good_category c ON c.id = g.category_id
LEFT JOIN good_category parent ON parent.id = c.parent_id
GROUP BY c.id, c.name, status
HAVING SUM(g.price * g.count) >= 390000;
