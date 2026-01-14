-- select * from dim_customer;
select 
	customer_id,
    email,
    gender,
    country,
    join_date
FROM 
	dim_customer
-- 1 -> where is a condition, for multiple conditions use braces 
where
	(gender = 'F') and (country = 'France') and 
    (join_date > '2022-01-01')

limit 10;
-- ----------------------
select 
	*
FROM 
	dim_customer
where
	(gender = 'F') and ((country = 'France') or
    (join_date > '2022-01-01'));

-- 2 -> LIKE 
select 
	*
FROM 
	dim_customer
where
	first_name LIKE 'T%_Y';

-- 3 -> SORTING ASC, DESC
SELECT * 
FROM 
	dim_product
ORDER BY
	unit_price DESC;

-- 4 -> Alias
SELECT 
	product_id,
    product_key,
    product_name AS 'product name'
FROM 
	dim_product;

-- 5 -> Grouping, having
-- where clause is only used for columns available in the table, so use having

SELECT 
	category,
    avg(unit_price) AS avg_price,
    sum(unit_price) AS total_price
FROM
	dim_product
GROUP BY 
	category
HAVING
	avg_price > 500;
    