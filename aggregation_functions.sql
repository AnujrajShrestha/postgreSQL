-- Aggregation functions

-- 1. Show total count of product_id from products table.
select count(product_id) from products;

-- 2. Show the total sum of prices from products table.
select sum(price) from products;

-- 3. Show the sum of prices from products table where category is 'Electronics'. 
select sum(price) from products where category= 'Electronics';

-- 4. Show the average of prices from products table.
select round(avg(price),2) from products;

-- 5. Show the minimum price from products table.
select min(price) from products;

-- 6. Show the maximum price from products table.
select max(price) from products;