
--25
SELECT top 1 products.product_name, categories.category_name, suppliers.company_name,
SUM(order_details.quantity) AS total_quantity
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
INNER JOIN order_details ON products.product_id = order_details.product_id
GROUP BY products.product_name, categories.category_name, suppliers.company_name;
-- ORDER BY total_quantity


--26
select  products.product_id,products.product_name,suppliers.company_name,suppliers.phone,products.units_in_stock
from products
INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
where products.units_in_stock =0;


--27
select orders.order_date ,orders.ship_address,employees.first_name +' '+ employees.last_name as 'Employee Name'
from orders
inner join employees on orders.employee_id=employees.employee_id
where order_date >= '1998-03-01' and order_date <='1998-03-31';

--28
select COUNT(orders.order_date) as 'Şuat sipariş sayısı'
from orders
where order_date >= '1997-02-01' and order_date <='1997-02-28';


select count(*) OrderCount
from
    orders
where
    DATEPART(year from orders.order_date) =1997
    and DATEPART(month from orders.order_date) =2

--29
select COUNT(orders.ship_city) as 'London orders count'
from orders
where order_date >= '1998-01-01' and order_date <'1999-01-01';

--30
select customers.contact_name,customers.phone,order_date
from orders
inner join customers on orders.customer_id=customers.customer_id
where order_date >= '1997-01-01' and order_date <'1998-01-01';

--31
select*
from orders
where orders.freight>40;

--32
select orders.ship_city,customers.contact_name 
from orders
inner join customers on orders.customer_id=customers.customer_id
where orders.freight>=40
group by orders.ship_city,customers.contact_name;

--33
select orders.order_date ,orders.ship_city,upper(employees.first_name) +' '+ upper(employees.last_name) as 'Employee name'
from orders
inner join employees on orders.employee_id=employees.employee_id
where order_date >= '1997-01-01' and order_date <'1998-01-01';

--34 //sıkıntılı 34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
select customers.contact_name,customers.phone
from orders 
inner join customers on orders.customer_id=customers.customer_id
where order_date >= '1997-01-01' and order_date <'1998-01-01'
group by customers.contact_name,customers.phone;

--35
select orders.order_date,customers.contact_name,employees.first_name ,employees.last_name 
from orders
inner join customers on orders.customer_id=customers.customer_id
inner join employees on orders.employee_id=employees.employee_id;

--36
select *
from orders
where orders.required_date < orders.shipped_date;

--37
select orders.order_date,orders.required_date,orders.shipped_date,customers.contact_name
from orders
inner join customers on orders.customer_id=customers.customer_id
where orders.required_date < orders.shipped_date;


--38
select order_details.order_id,products.product_name,categories.category_name,order_details.quantity
from order_details
inner join products on order_details.product_id=products.product_id
inner join categories on products.category_id =categories.category_id
where order_details.order_id=10248;

--39
select products.product_name,suppliers.company_name
from order_details
inner join products on order_details.product_id=products.product_id
inner join suppliers on products.supplier_id=suppliers.supplier_id
where order_details.order_id=10248;

--40
select products.product_name,order_details.quantity, orders.employee_id,order_date
from orders
inner join order_details on orders.order_id=order_details.order_id
inner join products on order_details.product_id=products.product_id
where  order_date >= '1997-01-01' and order_date <'1998-01-01'and orders.employee_id=3 ;

--41
SELECT top 1
       employees.employee_id,order_details.order_id,
       employees.first_name + ' ' + employees.last_name AS 'name surname',
       COUNT(order_details.order_id) AS 'order_count'
from order_details
INNER JOIN orders on order_details.order_id=orders.order_id
INNER JOIN employees ON orders.employee_id = employees.employee_id
WHERE DATEPART(YEAR FROM order_date) = 1997
GROUP BY employees.employee_id,order_details.order_id, employees.first_name, employees.last_name
ORDER BY COUNT(order_details.order_id) DESC;

--42
SELECT TOP 1
       employees.employee_id,
       employees.first_name + ' ' + employees.last_name AS 'name surname',
       COUNT(orders.employee_id) AS 'employees_order_count'
FROM orders 
INNER JOIN employees ON orders.employee_id = employees.employee_id
WHERE DATEPART(YEAR, order_date) = 1997
GROUP BY employees.employee_id, employees.first_name, employees.last_name
ORDER BY COUNT(orders.employee_id) DESC;

--43
select top 1 products.product_name, products.unit_price ,categories.category_name
from products
inner join categories on products.category_id =categories.category_id
order by products.unit_price DESC;

--44
select 
	employees.first_name + ' ' + employees.last_name AS 'name surname',
	orders.order_date,
	orders.order_id
from orders
inner JOIN employees ON orders.employee_id = employees.employee_id
order by orders.order_date ;

--45
SELECT TOP 5 order_details.unit_price AS total_order_amount,orders.order_id
    FROM order_details
	inner join orders on order_details.order_id=orders.order_id
    ORDER BY order_date DESC
SELECT AVG(sub.total_order_amount) AS average_last_5_orders
FROM (
    SELECT TOP 5 order_details.unit_price AS total_order_amount,orders.order_id
    FROM order_details
	inner join orders on order_details.order_id=orders.order_id
    ORDER BY order_date DESC
) AS sub;

--46
select products.product_name,categories.category_name,SUM(order_details.quantity) AS total_sales
from order_details
inner join orders on order_details.order_id=orders.order_id
inner join products on order_details.product_id=products.product_id
inner join categories on products.category_id=categories.category_id
WHERE DATEPART(MONTH, order_date) = 1
group by products.product_name,categories.category_name;

--47
SELECT *
FROM orders
INNER JOIN order_details ON order_details.order_id = orders.order_id
WHERE order_details.quantity > (SELECT AVG(quantity) FROM order_details);

--48
select top 1 products.product_name,categories.category_name,suppliers.company_name
from order_details
inner join orders on order_details.order_id=orders.order_id
inner join products on order_details.product_id=products.product_id
inner join categories on products.category_id=categories.category_id
inner join suppliers on products.supplier_id=suppliers.supplier_id
ORDER BY order_details.quantity DESC

--49
select count (DISTINCT customers.city) as 'count city'
from customers

select customers.city
from customers
group by customers.city

--50
SELECT orders.employee_id, SUM(order_details.quantity) AS total_product_sold
FROM orders
INNER JOIN order_details  ON orders.order_id = order_details.order_id
WHERE orders.employee_id = 3
  AND orders.order_date >= '2023-01-01'
GROUP BY orders.employee_id;
