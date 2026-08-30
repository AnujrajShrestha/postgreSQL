-- string functions

-- 1. Show all the name of products in uppercase.
select upper(name) from products;

-- 2. Show all the name of products in lowercase.
select lower(name) from products;

-- 3. Show the length of all sku_code of products.
select length(sku_code) from products;

-- 4. Show name and sku_code of all products (sku_code should contian only 2 letter).
select name, substring(sku_code,1,2) from products;

-- 5. Show name and sku_code of all products (sku_code should contian only 3 letter from start).
select name,left(sku_code,3) from products;

-- 6. Show all the name and category of products in concatination.
select concat(name,' ',category) from products;

-- 7. Replace all the sku_code first 2 latter with 'GG'.
select name,replace(sku_code,left(sku_code,2),'GG') from products;