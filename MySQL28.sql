USE shop;

SELECT 
    id,
    user_id,
    status_id,
    creation_date,
    CASE
        WHEN creation_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND status_id IN (7,8) THEN 'Старый'
        WHEN creation_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN 'Устаревший'
        ELSE 'Новый'
    END AS label
FROM `order`
ORDER BY status_id ASC, creation_date DESC;