-- Views

-- 1. Get only available fitness items regularly.
create view fitness_views as 
select * from products where category = 'Fitness';

select * from fitness_views;

-- 2. View for low stock items.
create view low_stock as
select name,quantity,category from products
where quantity < 30;

select * from low_stock;