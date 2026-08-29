-- Clauses

-- 1. Show the name and price of all products.
select name,price from products;

-- 2. Show all products where the category is 'Electronics'.
select * from products where category= 'Electronics';

-- 3. Group products by category show each category  once.
select category from products Group by category;

-- 4. Show categories that have more than 1 products (Use after Group by).
select category from products Group by category having count(*) > 1;

-- 5. Show all products sorted by price in ascending order
select * from products order by price;

-- 6. Show only tje frist 3 products from the table.
select * from products limit 3;

-- 7. Show products name as 'Item_name', price  as 'item_price'.
select name as Item_name , price as item_price from products;

-- 8. Show all the unique category from the products. 
select Distinct category from products;