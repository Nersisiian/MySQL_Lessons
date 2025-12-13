SELECT DISTINCT u.name, u.email
FROM `user` u
JOIN `order` o ON o.user_id = u.id
JOIN order2good og ON og.order_id = o.id
JOIN good g ON g.id = og.good_id
JOIN good_category gc ON gc.id = g.category_id
JOIN order_status os ON os.id = o.status_id
WHERE g.name LIKE 'Гватемала%'        
  AND u.email NOT LIKE '%.ru'          
  AND u.email NOT LIKE '%.su'          
  AND os.name = 'упакован'             
  AND gc.name = 'Кофе без кофеина';    
