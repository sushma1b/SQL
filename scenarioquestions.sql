-- Ranking
-- Find nth value

-- Example 1, find 5th highest pricing

SELECT
	* -- also can use subquery.* 
FROM
(
SELECT
	*,
	DENSE_RANK() OVER(ORDER BY unit_price DESC) as ranking -- using dense rank because it don't skip the rank
FROM
	dim_product
)subquery
WHERE
	ranking = 5;

-- Example 2, find 5th highest pricing in each category

SELECT
	*
FROM
(
SELECT
	*,
	DENSE_RANK() OVER(PARTITION BY category ORDER BY unit_price DESC) as ranking -- using dense rank because it don't skip the rank
FROM
	dim_product
)subquery
WHERE
	ranking = 5;
    
-- Example 3 , scenario -2 - removing duplicates

-- creating table customers for this example
CREATE TABLE customers
(
	id INT,
    name VARCHAR(200),
    email VARCHAR(200)
);
INSERT INTO  customers
VALUES
(101, 'ABC', 'aa'),
(201, 'BCD', 'bb'),
(201, 'BCD', 'bb'),
(301, 'CDE', 'cc');

Select * from customers;
-- using row_number() with partion by on id gives more than one ranking for duplicate rows
-- First start with find the ranking and then apply the condition
SELECT
	*
FROM
(
SELECT
	*,
    ROW_NUMBER() OVER(PARTITION BY id order by id) AS dedup
FROM
	customers
) subquery
WHERE dedup = '1';

-- Example 4 -- Scenario 3 -- LAG & LEAD

CREATE TABLE weather
( 
	id INT,
	temp FLOAT
);
INSERT INTO weather
VALUES
(1,10),
(2,12),
(3,9),
(4,15),
(5,20),
(6,15),
(7,12);

select * from weather;

SELECT 
	*,
    LAG(temp,1) OVER(ORDER BY id) AS prev_day_temp, -- we can update LAG(temp,1,0) to get 0 instead of null if we don't have previous day
    LEAD(temp,1) OVER(ORDER BY id) AS next_day_temp,
    LAG(temp,2,0) OVER(ORDER BY id) AS prev_2days_temp
FROM
	weather;