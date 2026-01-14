-- SUBQUERIES

-- SELECT AVG(unit_price) FROM dim_product;

SELECT 
	*
FROM
	dim_product
WHERE
	unit_price > (SELECT AVG(unit_price) FROM dim_product);


-- example 2 -- muti-step transformations - using result table from above query as table to query info

SELECT
	*
FROM
(
	SELECT 
	*
	FROM
		dim_product
	WHERE
		unit_price > (SELECT AVG(unit_price) FROM dim_product)) AS subquery_table
WHERE
	product_name = 'Figure Method';
    