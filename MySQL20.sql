USE shop;

SET @cat_id := (SELECT id FROM good_category LIMIT 1);

INSERT INTO good (name, price, count, category_id) VALUES
('Товар тестовый A', 1500, 10, @cat_id),
('Товар тестовый B', 1800, 12, @cat_id),
('Товар тестовый C', 2200, 8, @cat_id),
('Товар тестовый D', 3000, 5, @cat_id);

SELECT id, name, price, count
FROM good
ORDER BY price DESC
LIMIT 10;

UPDATE good
SET count = 0
WHERE id IN (
    SELECT id FROM (
        SELECT id FROM good WHERE price > 1000
    ) t
);

SELECT id, name, price, count
FROM good
WHERE price > 1000;

UPDATE good
SET price = price * 3
WHERE id IN (
    SELECT id FROM (
        SELECT id FROM good WHERE price > 1000
    ) t
);

SELECT id, name, price, count
FROM good
WHERE price > 1000;

DELETE FROM good
WHERE id IN (
    SELECT id FROM (
        SELECT id FROM good WHERE price > 1000
    ) t
);

SELECT id, name, price, count
FROM good
WHERE price > 1000;
