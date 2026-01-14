-- COMMON TABLE EXPRESSIONS
-- ctes are similar to subqueries
-- we can't use ctes in the where clause, but can use subquery in the where clause

-- Example 1 , one cte_table
WITH cte_table AS
(
SELECT 
	*
FROM
	dim_product
WHERE
	unit_price > (SELECT AVG(unit_price) FROM dim_product))
SELECT * FROM cte_table -- using query result from the cte_table
WHERE
	product_name IN ('Figure Method', 'Huge Change', 'Film Finally');

-- Example 2 , 2 cte tables

WITH cte_table AS
(
SELECT 
	*
FROM
	dim_product
WHERE
	unit_price > (SELECT AVG(unit_price) FROM dim_product)
),
    
cte_table_2 AS
(
	SELECT * FROM cte_table -- using query result from the cte_table
	WHERE
		product_name IN ('Figure Method', 'Huge Change', 'Film Finally')
)
	SELECT * FROM cte_table_2
	WHERE product_name = 'Figure Method';