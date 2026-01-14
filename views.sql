-- VIEWS

CREATE VIEW dedup_view AS
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

-- after creating view we can query view

SELECT * FROM dedup_view;