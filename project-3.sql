create table products(
    product_id int primary key,
	product_name varchar(100),
	category text,
	price numeric(10,2),
	stock_quantity int,
	is_available boolean,
	added_on date
);

create table orders(
    order_id int primary key,
	product_id int,
	quantity int,
	order_date date,
	customer_name varchar(50),
	payment_method varchar(50),
	constraint fk_product foreign key (product_id)
	references products (product_id)
	on delete cascade
);

select * from products;
select * from orders;

-- Questions

-- 1. Show each order along with the product name and price.
select p.product_name,p.price,o.quantity from
products p join orders o on p.product_id = o.product_id;

-- 2. Show all products even if they were never ordered.
select p.product_name,p.price,o.order_id from products p 
left join orders o on p.product_id = o.product_id;

-- 3. Show orders for only 'Electronics' category.
select p.product_name,p.price,o.quantity,p.category from products p 
join orders o on p.product_id = o.product_id where p.category = 'Electronics';

-- 4. List all orders sorted by products price (high to low).
select p.product_name,p.price,o.quantity from products p 
join orders o on p.product_id = o.product_id order by p.price desc;

-- 5. Show number of orders placed for each product.
select p.product_name, count(o.order_id) as total_orders
from products p left join orders o on p.product_id = o.product_id
group by p.product_name;

-- 6. Show total revenue earned per product.
select p.product_name,sum(p.price * o.quantity),count(o.order_id) as product_revenue 
from products p join orders o on p.product_id = o.product_id
group by p.product_name;

-- 7. Show products where total order revenue > 2000.
select p.product_name,sum(p.price * o.quantity),count(o.order_id) as product_revenue 
from products p join orders o on p.product_id = o.product_id
group by p.product_id,p.product_name  
having sum(p.price * o.quantity) > 2000;

-- 8. Show unique customers who ordered 'Fitness' products.
select distinct o.customer_name,p.product_name,p.category from orders o join products p 
on o.product_id= p.product_id where p.category = 'Fitness';