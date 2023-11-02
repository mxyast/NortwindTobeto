select product_name, quantity_per_unit
from products;

select product_id, product_name
from products
where discontinued = 0;

--yine bak
select product_id, product_name
from products
where discontinued = 1;

--select * from products

select product_id, product_name, unit_price
from products
where unit_price < 20;

select product_id, product_name, unit_price
from products
where unit_price < 20 and unit_price > 15;


select product_name, units_on_order, units_in_stock
from products
where units_in_stock < units_on_order;

-----
select product_name
from products
where product_name like 'a%';

select product_name
from products
where product_name like '%i';

select product_name, unit_price, (unit_price * 1.18) as unit_price_kdv
from products;

select count(*) as product_counts
from products
where unit_price > 30;

select lower (product_name) as lower_product_name, unit_price
from products
order by unit_price desc;


select concat(first_name, ' ', last_name) as total_name
from employees;

select count(*) as suppliers_count
from suppliers
where region is null;

select count(*) as suppliers_count
from suppliers
where region is not null;

---
select concat('TR ', upper(product_name)) as tr_product_name
from products;

select concat('TR ', product_name) as tr_product_name
from products
where unit_price < 20;

select concat('TR ', product_name, unit_price) as tr_product_name
from products
where unit_price < 20;

select product_name, unit_price
from products
where unit_price = (select max(unit_price) from products);

-----
select top 10 product_name, unit_price
from products
order by unit_price desc;


select product_name, unit_price
from products
where unit_price > (select avg(unit_price) from products);

SELECT product_name, units_in_stock - units_on_order AS quantity_sold
FROM products
WHERE units_in_stock > units_on_order;

select product_id, product_name
from products
where discontinued = 0 or discontinued = 1;

SELECT 
    (SELECT COUNT(*) FROM products WHERE discontinued = '0') as cont,
    (SELECT COUNT(*) FROM products WHERE discontinued = '1') as discont;

select products.product_name, categories.category_name
from products
inner join categories on products.category_id = categories.category_id;

select categories.category_name, avg (products.unit_price) as avg_price
from products
inner join categories on products.category_id = categories.category_id
GROUP BY Categories.Category_Name;

select top 1 products.product_name, products.unit_price, categories.category_name
from products
inner join categories on products.category_id = categories.category_id
order by products.unit_price desc;

--25
SELECT top 1 products.product_name, categories.category_name, suppliers.company_name,
SUM(order_details.quantity) AS total_quantity
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
INNER JOIN order_details ON products.product_id = order_details.product_id
GROUP BY products.product_name, categories.category_name, suppliers.company_name
-- ORDER BY total_quantity
;

--26
