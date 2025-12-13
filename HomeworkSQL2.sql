-- ------------------------------- Homework 13
USE Учебная_База_Данных;

-- CREATE TABLE IF NOT EXISTS Студенты ...
-- CREATE TABLE IF NOT EXISTS Курсы ...
-- CREATE TABLE IF NOT EXISTS Оценки ...

INSERT INTO Студенты (имя, фамилия, email, дата_рождения)
VALUES 
    ('Иван', 'Иванов', 'ivan@example.com', '2000-01-15') AS new_s
ON DUPLICATE KEY UPDATE 
    имя = new_s.имя, фамилия = new_s.фамилия, дата_рождения = new_s.дата_рождения;

INSERT INTO Студенты (имя, фамилия, email, дата_рождения)
VALUES 
    ('Мария', 'Петрова', 'maria@example.com', '1999-05-22') AS new_s
ON DUPLICATE KEY UPDATE 
    имя = new_s.имя, фамилия = new_s.фамилия, дата_рождения = new_s.дата_рождения;

INSERT INTO Курсы (название, описание, дата_начала, дата_окончания)
VALUES 
    ('Программирование на Python', 'Курс по основам программирования на Python.', '2023-09-01', '2023-12-15') AS new_c
ON DUPLICATE KEY UPDATE 
    описание = new_c.описание, дата_начала = new_c.дата_начала, дата_окончания = new_c.дата_окончания;

INSERT INTO Курсы (название, описание, дата_начала, дата_окончания)
VALUES 
    ('Базы данных', 'Курс по проектированию и управлению базами данных.', '2023-09-01', '2023-12-15') AS new_c
ON DUPLICATE KEY UPDATE 
    описание = new_c.описание, дата_начала = new_c.дата_начала, дата_окончания = new_c.дата_окончания;


INSERT INTO Оценки (студент_id, курс_id, оценка)
VALUES 
    (1, 1, 95.0),
    (1, 2, 88.5),
    (2, 1, 75.0)
AS new_o
ON DUPLICATE KEY UPDATE оценка = new_o.оценка;

SELECT s.имя, s.фамилия, k.название, o.оценка
FROM Оценки o
JOIN Студенты s ON o.студент_id = s.id
JOIN Курсы k ON o.курс_id = k.id
WHERE s.id = 1;

SELECT s.имя, s.фамилия, AVG(o.оценка) AS средний_балл
FROM Студенты s
JOIN Оценки o ON s.id = o.студент_id
GROUP BY s.id, s.имя, s.фамилия;

SELECT s.имя, s.фамилия, k.название, o.оценка
FROM Оценки o
JOIN Студенты s ON o.студент_id = s.id
JOIN Курсы k ON o.курс_id = k.id
WHERE o.оценка < 80;

SELECT s.имя, s.фамилия, k.название, o.оценка
FROM Студенты s
CROSS JOIN Курсы k
LEFT JOIN Оценки o ON s.id = o.студент_id AND k.id = o.курс_id;

SELECT k.название, AVG(o.оценка) AS средний_балл
FROM Курсы k
JOIN Оценки o ON k.id = o.курс_id
GROUP BY k.id, k.название
ORDER BY средний_балл DESC;
