-- 1.  Выведите информацию обо всех продуктах 
select * from products;

-- 2. Выведите информацию обо всех продуктах, произведенных Apple в категории Phones
select * from products where manufacturer = 'Apple'and category = 'Phones'; 

-- 3. Выведите названия продуктов и их стоимость, при условии что в названии содержатся буквы sa в любом месте
select name, price from products where name like '%sa%';

-- 4. Выведите названия продуктов и их стоимость, при условии того, что цена находится в диапазоне от 100 до 1000 долларов
select name, price from products where price BETWEEN 100 and 1000;

-- 5. Посчитайте сумму всех товаров, произведенных компанией Samsung. Название таблицы в результате запроса должно быть SAMSUNG TOTAL PRICE
select SUM(price) as SAMSUNG_TOTAL_PRICE FROM products WHERE manufacturer = 'Samsung';

-- 6. Выведите название всех товаров и их стоимость по убыванию
select name, price from products order by price DESC;

-- 7. Выведите названия всех производителей при условии, чтобы они не повторялись
select DISTINCT manufacturer from products;

-- 8. Выведите названия первых двух категорий продуктов, чтобы они не повторялись
select DISTINCT category from products limit 2;

-- 9. Выведите названия продуктов при условии, что они состоят из 12 символов и их названия начинаются с A
select name FROM products WHERE LENGTH(name) = 12 and name like 'A%';

-- 10. Посчитайте среднюю цену всех продуктов. Название таблицы в результате запроса должно быть PRODUCTS AVG PRICE
select AVG(price) as PRODUCTS_AVG_PRICE FROM products;

-- 11. Используя оператор IN, выведите названия и описание продуктов, у которых производитель Samsung и Huawei
select name, description from products where manufacturer in ('Samsung', 'Huawei');

-- 12. Используя оператор UNION, выведите информацию о названии товаров из таблицы products и номера заказов из таблицы orders
SELECT name FROM products
UNION
SELECT order_id FROM orders;

-- 13. Используя оператор HAVING, посчитайте количество товаров в каждой категории, оставив только те категории, в которых количество товаров больше 15
SELECT category, COUNT(*)
FROM products
GROUP BY category
HAVING COUNT(*) > 15;

-- 14. "Используя оператор CASE опишите следующую логику:
-- Выведите компанию, категорию, стоимость и название товара, а также следующий текстовое сообщение:
-- Если компания Apple, то в консоли должно вывестись ""Это продукт компании Apple"".
-- Если компания Samsung, то в консоли должно вывестись ""Это продукт компании Samsung"".
-- Если компания Huawei, то в консоли должно вывестись ""Это продукт компании  Huawei"".
-- Если компания Xiaomi, то в консоли должно вывестись ""Это продукт компании Xiaomi""."
SELECT manufacturer, category, price, name, manufacturer =
CASE 
    WHEN manufacturer = 'Apple' THEN 'Это продукт компании Apple'
    WHEN manufacturer = 'Samsung' THEN 'Это продукт компании Samsung'
    WHEN manufacturer = 'Apple' THEN 'Это продукт компании  Huawei'
    WHEN manufacturer = 'Apple' THEN 'Это продукт компании Xiaomi'
    ELSE 'Не найдена компания'
END as company
FROM products;
