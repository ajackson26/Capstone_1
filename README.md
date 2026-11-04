# Capstone_1
Territory "South" - Writing multiple queries regarding sales manager request from sales database
--what is the total revenue overall for sales in assigned territory, plus the start/end date?
SELECT SUM(SalesTotal) AS total_revenue, MIN(Date), MAX(Date)
FROM Management,Online_Sales
WHERE Region = 'Northeast'
AND State = 'Maryland'
-- What is the revenue breakdown by year and month for the sales territory?
USE sample_sales;
SELECT DISTINCT Sale_Amount, Transaction_Date
FROM Store_Sales,Management
WHERE Region = 'South'
ORDER BY Transaction_Date

--Provide a comparison of total revenue for the specific sales territory and the region it belongs to.

SELECT SUM(SalesTotal)
FROM Management, Online_Sales
WHERE Region = 'Northeast'

SELECT SUM(SalesTotal)
FROM Management, Online_Sales
WHERE State = 'Maryland'

--What is the number of transactions per month and average transaction amount by product category for the sales territory?

SELECT  Category, Date , AVG(SalesTotal), COUNT(*)
FROM Inventory_Categories JOIN Management JOIN Online_Sales
WHERE State = 'Maryland'
GROUP BY Category, Date
ORDER BY AVG(SalesTotal), Category

