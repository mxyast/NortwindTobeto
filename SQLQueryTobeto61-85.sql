--61
select top 1 products.product_name,categories.category_name,suppliers.company_name
from order_details
inner join orders on order_details.order_id=orders.order_id
inner join products on order_details.product_id=products.product_id
inner join categories on products.category_id=categories.category_id
inner join suppliers on products.supplier_id=suppliers.supplier_id
ORDER BY order_details.quantity DESC

--62
select count (DISTINCT customers.country) as 'count costumer'
from customers

--63
select orders.ship_country, count(*) as 'müþteri sayýsý'
from orders
group by orders.ship_country

--64
SELECT orders.employee_id, SUM(order_details.quantity*order_details.unit_price) AS total_product_sold
FROM orders
INNER JOIN order_details  ON orders.order_id = order_details.order_id
WHERE orders.employee_id = 3
  AND orders.order_date >= '2023-01-01'
GROUP BY orders.employee_id;

--65
select SUM(order_details.quantity*order_details.unit_price) as'son 3 aylýk ciro'
from order_details
inner join orders on orders.order_id=order_details.order_id
where order_details.product_id=10 AND orders.order_date >= '1997-08-03'

--66
select employees.first_name,  count(orders.order_id)as 'sipariþ sayýsý'
from order_details
inner join orders on orders.order_id=order_details.order_id
inner join employees on employees.employee_id=orders.employee_id
group by employees.first_name

--67
select company_name, contact_name
from customers
left join orders on customers.customer_id = orders.customer_id
where orders.order_id is null

--68
select 
	customers.company_name,
	customers.contact_name,
	customers.address,
	customers.city,
	customers.country
from customers
where customers.country = 'Brazil'

--69
select *
from customers
where customers.country != 'Brazil'
order by customers.country;

--70
select *
from customers
where
	customers.country = 'Spain' or 
	customers.country = 'France'or 
	customers.country = 'Germany'
order by customers.country;

--71
select *
from customers
where customers.fax is null

--72
select *
from customers
where
	customers.city = 'London' or 
	customers.city = 'Paris'
order by customers.city;

--73
select *
from customers
where
	customers.city = 'México D.F.' and 
	customers.contact_title = 'owner'

--74
select products.product_name,products.unit_price
from products
where products.product_name like 'C%'

--75
select employees.first_name,employees.last_name,employees.birth_date
from employees
where employees.first_name like 'A%'

--76
select customers.company_name
from customers
where customers.company_name like '%RESTAURANT%'

--77
select products.product_name,products.unit_price
from products
where products.unit_price>50 and products.unit_price<100

--78
select order_id,order_date
from orders
where order_date between '1996-07-01'and '1996-12-31'
order by order_date

--79
select *
from customers
where
	customers.country = 'Spain' or 
	customers.country = 'France'or 
	customers.country = 'Germany'
order by customers.country;

--80
select *
from customers
where customers.fax is null

--81
select *
from customers
order by customers.country;

--82
select products.product_name,products.unit_price
from products
order by products.unit_price desc

--83
select products.product_name,products.unit_price ,products.units_in_stock 
from products
order by products.units_in_stock , products.unit_price desc

--84
select COUNT(*)as '1. kategorideki ürün sayýsý'
from products
where products.category_id=1

--85
select COUNT(DISTINCT orders.ship_country) as 'ülke sayýsý'
from orders
