use intern_shop
-- 1. Выведите логин вашего пользователя, номера его заказов и их стоимость (таблицы users и orders)
select u.login, o.order_id, o.total 
from users u
join orders o
on u.user_id = o.user_id
where u.user_id = 101;

-- 2. Выведите номера всех заказов, названия товаров в них и их количество (таблицы order_items и products)
select order_items.order_id, products.name, order_items.quantity 
from order_items
join products
on order_items.product_id = products.product_id;

-- 3. Выведите логины всех пользователей и номера заказов, вне зависимоcти от того, есть ли у них заказ или нет (таблицы users и orders)
select u.login, o.order_id
from users u
 left join orders o
on u.user_id = o.user_id;

-- 4. Выведите номера оплаченных заказов и название всех товаров, вне зависимоcти от того, упоминаются ли товары в оплаченных заказах (таблицы products и order_items_paid)
select 
    oip.order_id, p.name
from order_items_paid oip
right join products p on oip.product_id = p.product_id
order by oip.order_id;

-- 5. Используя вложенный запрос выведите названия и стоимость товаров, у которых стоимость товара больше, чем стоимость товара "Samsung Active 5" из таблицы products
select name, price
from products
where price > (select price from products where name = 'Samsung Active 5');

