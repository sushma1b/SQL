-- WINDOW FUNCTIONS

SELECT * FROM dim_product;

SELECT
	AVG(unit_price) -- squeeze into single row
FROM
	dim_product;
    
-- gives running sum or running total
SELECT
	*,
    SUM(unit_price) OVER(ORDER BY launch_date) 
FROM
	dim_product;

-- Moving Avg
SELECT
	*,
    AVG(unit_price) OVER(ORDER BY launch_date) 
FROM
	dim_product;
    
-- FRAMES LOGIC -- mostly used -- EXAMPLE 1
SELECT
	*,
    SUM(unit_price) OVER(ORDER BY launch_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM
	dim_product;

-- EXAMPLE 2
SELECT
	*,
    SUM(unit_price) OVER(ORDER BY launch_date ROWS BETWEEN UNBOUNDED PRECEDING AND  UNBOUNDED FOLLOWING)
FROM
	dim_product;
    
-- EXAMPLE RANKING
SELECT
	unit_price,
    ROW_NUMBER() OVER(ORDER BY unit_price) AS 'row_number',
    RANK() OVER(ORDER BY unit_price) AS 'rank',
    DENSE_RANK() OVER(ORDER BY unit_price) AS 'dense_rank'
FROM
	dim_product;

-- RANKING WITH PARTITIONS
SELECT
	unit_price,
    category,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY unit_price) AS 'row_number',
    RANK() OVER(PARTITION BY category ORDER BY unit_price) AS 'rank',
    DENSE_RANK() OVER(PARTITION BY category ORDER BY unit_price) AS 'dense_rank'
FROM
	dim_product;


