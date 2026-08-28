-- Clauses

-- 1. Show the name and price of all products.
select name,price from products;

-- 2. Show all products where the category is 'Electronics',.
select * from products where category='Electronics';

-- 3. Group products by category. Show each category once.
select category from products Group by category;

-- 4. Show catogories that have more than 1 product. (Use after GROUP BY).
select category,count(*) from products Group by category
Having count(*) > 1;

-- 5. Show all products sorted by price in ascending order.
select * from products order by price DESC;

-- 6. Show only the first 3 products from the table.
select * from products limit 3;

-- 7. Show product name as 'Item_Name' and price as 'Item_Price'.
select name as Item_name, price as Item_price from products;

-- 8. Show all the unique categories from the products. 
select Distinct category from products;