-- CASES

-- 1. If the price is above 1000 you will set it is expensive.
   -- If the price is between 500 and 1000 you will say it is moderate.
   -- and if the price is below 500 it is cheap.
select name,price,
case when (price > 1000) then 'Expensive'
     when price between 500 and 1000 then 'Moderate'
	 else 'Cheap'
end as price_tag from products; 

-- 2. Change it originally.
alter table products add column price_tag varchar(10);

update products set price_tag =
case when price > 1000 then 'Expensive'
     when price between 500 and 1000 then 'Moderate'
	 else 'Cheap'
end;

-- 3. Show case a new column to with in_stock and out of stock.
select name,
case when is_available then 'In Stock'
     else 'Out Of Stock'
end as availability_status
from products;

-- 4. Show product name, stock quantity and label:
   -- a. 'High Stock' if quantity > 100
   -- b. 'Medium Stock' if between 40 to 100
   -- c. 'Low Stock' otherwise

select name,quantity,
case when quantity > 100 then 'High Stock'
     when quantity between 30 and 100 then 'Medium Stock'
	 else 'Low Stock'
end as stock_level
from products;