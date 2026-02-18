--Q1 Find the top 10 best-value products based on the discount percentage

SELECT DISTINCT name,mrp,discountpercent 
FROM zepto 
ORDER BY discountpercent DESC
LIMIT 10 ;

--Q2 What are the products with high MRP but out of stock 

SELECT DISTINCT name,mrp,outofstock 
FROM zepto 
WHERE outofstock = TRUE 
ORDER BY outofstock ,mrp DESC 
LIMIT 5 ;

--Q3 Calculate estimate revenue for each category 

SELECT category ,
SUM(discountedsellingprice*availablequantity)AS total_revenue 
FROM zepto 
GROUP BY category 
ORDER BY total_revenue DESC;

--Q4 Find all products where MRP is greater than ₹500 and discount is less than 10% 

SELECT DISTINCT name,mrp,discountpercent FROM zepto 
WHERE discountpercent <10 AND mrp>500 
ORDER BY mrp DESC ,discountpercent DESC

--Q5 Identify the top 5 categories offering the highest average discount percentage

SELECT category,
ROUND(AVG(discountpercent),2) as avgdiscount
FROM zepto
GROUP BY category 
ORDER BY avgdiscount DESC
LIMIT 5;

--Q6 Find the price per gram for products above 100g and sort by best value 

SELECT DISTINCT name,weightingms,discountedsellingprice,
ROUND(discountedsellingprice/weightingms,2) AS price_per_gms 
FROM zepto 
WHERE weightingms >=100
ORDER BY price_per_gms;

--Q7 Group the products into categories like low, medium, bulk

SELECT DISTINCT name,weightingms,
CASE WHEN weightingms <1000 THEN 'LOW'
	 WHEN weightingms <5000 THEN 'MEDIUM'
	 ELSE 'BULK'
	 END AS weight_category
FROM zepto ;

--Q8 What is the total inventory weight per category 

SELECT category,
SUM(weightingms * availablequantity)AS total_weight_GRAM 
FROM zepto 
GROUP BY category 
ORDER BY total_weight_GRAM DESC;