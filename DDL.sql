
-- DDL COMMANDS CREATE, ALTER, DROP, TRUNCATE
-- Create Datatbase

Create Database Sales;

-- Create Table
USE Sales;
Create TABLE Stores
(
store_id INT,
store_name VARCHAR(200)
);

-- Insert some records in table
INSERT INTO Stores
VALUES
(1, "store_xyz"),
(2, "store_abc");

-- Add new data to Stores TABLE
INSERT INTO Stores(store_id)
VALUES
(1);

-- Create table Stores_new
USE Sales;
Create TABLE Stores_new
(
store_id INT,
store_name VARCHAR(200) NOT NULL -- CONSTRAINT
);

-- Insert values in Stores_new
INSERT INTO Stores_new
VALUES
(1, "store_xyz"),
(2); -- because of NOT NULL Constraint, we can't cretae row with null value and need to provide all column record in values

-- DROP Table - deletes entire table
DROP TABLE Stores_new;

-- TRUNCATE - deletes the data in the table and structure remains
-- TRUNCATE TABLE Sales;

-- ALTER Command is used to alter the table schema, like add, delete a column, 

-- to test this command I'm creating a Stores_new table again running above code
ALTER TABLE Stores_new
ADD COLUMN store_city varchar(200);

-- rename column store_city
ALTER TABLE Stores_new
RENAME COLUMN store_city to store_location;


