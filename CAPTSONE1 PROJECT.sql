-- what is the total revenue overall for sales in assigned territory, plus the start/end date?

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

-- Provide a comparison of total revenue for the specific sales territory and the region it belongs to.

SELECT State, SUM(SalesTotal) 
FROM Management, Online_Sales
WHERE State = 'Maryland'

SELECT SUM(SalesTotal)
FROM Management, Online_Sales
WHERE Region = 'Northeast'

-- What is the number of transactions per month and average transaction amount by product category for the sales territory?

SELECT  Category, Date , AVG(SalesTotal), COUNT(*)
FROM Inventory_Categories JOIN Management JOIN Online_Sales
WHERE State = 'Maryland'
GROUP BY Category, Date
ORDER BY AVG(SalesTotal), Category

-- Can you provide a ranking of in-store sales performance by each store in the sales territory, or a ranking of online sales performance by state within an online sales territory?

SELECT DISTINCT Transaction_Date, Store_ID,StoreLocation,State, AVG(Sale_Amount)
FROM Store_Locations JOIN Store_Sales
WHERE State = 'Maryland' 
GROUP BY Transaction_Date, Store_ID, StoreLocation
ORDER BY AVG(Sale_Amount) ASC

-- What is your recommendation for where to focus sales attention in the next quarter?

-- My recommendation would be to add sales training to stores 903 which is the store that brings in the least averaged sales in the state of Maryland, 836,850, and 816 to assess if training would increase the sales for these stores as a controlled group then implement the developmental training to all stores if deemed successful.
