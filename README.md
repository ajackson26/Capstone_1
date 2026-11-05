# Capstone_1
Territory "MARYLAND" in Region "NORTHEAST" - Writing multiple queries regarding sales manager request from sales database

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

SELECT State, SUM(SalesTotal) 
FROM Management, Online_Sales
WHERE State = 'Maryland'

SELECT SUM(SalesTotal)
FROM Management, Online_Sales
WHERE Region = 'Northeast'

--What is the number of transactions per month and average transaction amount by product category for the sales territory?

SELECT  Category, Date , AVG(SalesTotal), COUNT(*)
FROM Inventory_Categories JOIN Management JOIN Online_Sales
WHERE State = 'Maryland'
GROUP BY Category, Date
ORDER BY AVG(SalesTotal), Category

--Can you provide a ranking of in-store sales performance by each store in the sales territory, or a ranking of online sales performance by state within an online sales territory?

SELECT DISTINCT Transaction_Date, Store_ID,StoreLocation,State, AVG(Sale_Amount)
FROM Store_Locations JOIN Store_Sales
WHERE State = 'Maryland' 
GROUP BY Transaction_Date, Store_ID, StoreLocation
ORDER BY AVG(Sale_Amount) ASC

--What is your recommendation for where to focus sales attention in the next quarter?

My recommendation would be to add sales training to stores 903 which is the store that brings in the least averaged sales in the state of Maryland, 836,850, and 816 to assess if training would increase the sales for these stores as a controlled group then implement the developmental training to all stores if deemed successful.


-- BONUS QUESTION
-- Create a list of all transactions that took place on January 15, 2024, sorted by sale amount from highest to lowest.

SELECT ProdNum, SalesTotal, YEAR(Date), MONTH(Date), DAY(Date)
FROM Online_Sales
WHERE YEAR(Date) = '2024'
AND MONTH(Date) = '1'
AND DAY(Date) = '15'
GROUP BY Date,ProdNum,SalesTotal
ORDER BY YEAR(Date), MONTH(Date), DAY(Date)

FOR MARYLAND
SELECT ProdNum, SalesTotal, YEAR(Date), MONTH(Date), DAY(Date), State,Region
FROM Online_Sales JOIN Management
WHERE YEAR(Date) = '2024'
AND MONTH(Date) = '1'
AND DAY(Date) = '15'
AND State = 'Maryland'
GROUP BY Date,ProdNum,SalesTotal, State,Region
ORDER BY YEAR(Date), MONTH(Date), DAY(Date)

---- What is the total sales revenue across all transactions? What is the average transaction amount? 
SELECT SUM(SalesTotal), AVG(SalesTotal)
FROM Online_Sales,Management
ORDER BY SUM(SalesTotal), AVG(SalesTotal)
