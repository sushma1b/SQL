-- Transformations
-- Numeric 

-- ex - sale 10% discount
SELECT 
	unit_price * 0.90 AS discounted_price,
    unit_price + 10 AS taxed_price,
    unit_price / 10 as fractioned_price,
    round(unit_price,1) as rounded_price
FROM 
	dim_product;


-- DATE Transformations
-- 1 - fetch current date

SELECT
	date,
    now() as 'current_timestamp',
    utc_date(),
    utc_time(),
    utc_timestamp()
FROM
	dim_date;
    
-- 2 - Date extraction

SELECT 
	date,
    YEAR(date),
    MONTH(date),
    DAY(date),
    WEEKDAY(date),
    DAYNAME(date),
    DATE(utc_timestamp())
FROM
	dim_date;
    
-- 3 - Date add/sub

SELECT 
	date,
    ADDDATE(date, 2),
    SUBDATE(date, 2),
    DATEDIFF(DATE(utc_timestamp()), date) AS total_days, -- to find number of day before order was placed
    CAST('2025-01-01' AS datetime) AS datetime 
FROM
	dim_date;

-- 4 convert date format
SELECT 
	date,
    date_format(date, "%W %M %e %y") AS converted_date
FROM
	dim_date;
    
-- 5 TYPE CASTING -- To join tables column datatype must be same, so use typecasting
SELECT 
	customer_key,
    CAST(customer_key AS CHAR(100))
FROM
	dim_customer;
    
-- 6 STRING FUNCTIONS
SELECT
	*,
	CONCAT(first_name,' ',last_name),
    CONCAT_WS(" ",first_name,last_name,country),
    LENGTH(country) AS country_sname_length,
    LOWER(city),
    SUBSTRING(email,1,6),
    REPLACE(email, '@', '%'),
    LEFT(country,3),
    RIGHT(country, 3),
    REVERSE(country),
    REPEAT(first_name,2)
FROM
	dim_customer;