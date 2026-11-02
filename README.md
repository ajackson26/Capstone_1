# Capstone_1
Territory "South" - Writing multiple queries regarding sales manager request from sales database
--what is the total revenue overall for sales in assigned territory, plus the start/end date?
USE sample_sales;
SELECT DISTINCT SUM(SalesTotal), SUM(Sale_Amount), Region, MIN(Transaction_Date), MAX(Transaction_Date)
FROM Inventory_Categories,Inventory_Subcategories,Management,Online_Sales,Products,Shipper_List,Store_Locations,Store_Sales
WHERE Region = 'South'

--
USE sample_sales;
SELECT DISTINCT Sale_Amount, Transaction_Date
FROM Store_Sales,Management
WHERE Region = 'South'
ORDER BY Transaction_Date

--
