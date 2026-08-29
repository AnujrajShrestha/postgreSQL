-- project-2

-- 1. Display the name and price of the cheapest product in the entire table.
select name,price from products where price= (select min(price) from products) 

-- 2. Find the average price of products they belong to the 'Home & Kitchen' or 'Fitness' category.
select avg(price) from products where category in ('Home & Kitchen','Fitness');

-- 3. Show product names and stock quantity where the product is available,stock is more than 50 and 
-- price is not equal to 299.
select name,quantity from products where is_available= TRUE and quantity > 50 and price != 299;

-- 4. Find the most expensive product in each category (name and price).
select name,price,category from products p where price= (select max(price) from products where category= p.category);

-- 5. Show all unique categories in uppercase, sorted in descending order.
select Distinct upper(category) as category from products order by category DESC;
