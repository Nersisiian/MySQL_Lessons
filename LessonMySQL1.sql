DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL DEFAULT 0
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    status_id INT NOT NULL,
    order_date DATETIME NOT NULL
);

INSERT INTO products (name, price, quantity) VALUES
('Телефон A1', 500, 10),
('Телефон X9', 1200, 5),
('Наушники S3', 850, 0),
('Зарядка Fast', 300, 0),
('Планшет Tab 4', 900, 7),
('Монитор View', 750, 2);


INSERT INTO orders (user_id, status_id, order_date) VALUES
(101, 7, '2016-04-01 10:22:00'),
(102, 3, '2016-04-01 15:42:00'),
(103, 7, '2016-04-01 08:10:00'),
(104, 7, '2016-05-10 12:00:00'),
(105, 2, '2015-12-31 23:59:00');


SELECT * 
FROM products
WHERE price > 800;

SELECT *
FROM products
WHERE quantity = 0;

SELECT id, user_id
FROM orders
WHERE status_id = 7
  AND DATE(order_date) = '2016-04-01';
