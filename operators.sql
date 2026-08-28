-- Operators

-- 1. Show all products where category is equal to 'Electronics'.
select * from products where category = 'Electronics';

-- 2. Show all products where catoegory is not equal to 'Electronics'.
select * from products where category != 'Electronics';

-- 3. Show all products where price is greater than 1000.
select * from products where price > 1000;

-- 4. Show all products where price is less than 1000.
select * from products where price < 1000;

-- 5. Show all products where price is greater than 1000 and category must be 'Electronics'.
select * from products where price > 1000 and category = 'Electronics';

-- 6. Show all products where price is less than 1000 and greater than 400.
select * from products where price < 1000 and price > 400;
select * from products where price Between 400 and 1000; 

-- 7. Show all products where category is 'Electronics' or 'Fitness'.
select * from products where category = 'Electronics' or category = 'Fitness';
select * from products where category in ('Electronics','Fitness');

-- 8. Show all products whose sku_code frist letter is 'W'.
select * from products where sku_code like 'W%'; 

-- 9. Show all products who has '123' in between there sku_code.
select * from products where sku_code like '%123%';

-- 10. Show all products whose sku_code second letter is 'B'.
select * from products where sku_code like '_B%';