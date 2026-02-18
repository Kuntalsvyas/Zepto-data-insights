DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR (150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INT,
discountedSellingPrice NUMERIC(8,2),
weightInGms INT,
outOfStock BOOLEAN,
quantity INT
);

-- DATA EXPLORATION 

--COUNT OF ROWS 
SELECT COUNT(*) FROM zepto;

--SAMPLE DATA
SELECT * FROM zepto 
LIMIT 10;

--NULL VALUES 
SELECT * FROM zepto
WHERE name IS NULL
OR 
category IS NULL
OR 
mrp IS NULL
OR 
discountpercent IS NULL
OR 
availablequantity IS NULL
OR 
discountedsellingprice IS NULL
OR 
weightingms IS NULL
OR 
availablequantity IS NULL
OR 
outofstock IS NULL
OR 
quantity IS NULL;

--DIIFFERENT PRODUCT CATEGORIES
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--PRODUCT IN STOCK OR OUT OF STOCK 
SELECT outofstock, COUNT(sku_id)
FROM zepto 
GROUP BY outofstock;

--PRODUCT NAME, PRESENT MULTIPLE TIME 
SELECT name,COUNT(sku_id) as "Number of SKUs"
FROM zepto 
GROUP BY name 
HAVING COUNT(sku_id) > 1 
ORDER BY COUNT (sku_id) DESC;

--DATA CLEANING

--PRODUCT WITH PRICE "0"
SELECT * FROM zepto
WHERE mrp=0 OR discountedsellingprice=0;

--DELETE 
DELETE FROM zepto 
WHERE mrp=0;

--CONVERT PAISE INTO RUPPES 
UPDATE zepto 
SET mrp=mrp/100.0,
discountedsellingprice = discountedsellingprice/100.00;

SELECT mrp,discountedsellingprice FROM zepto 
LIMIT 10;



