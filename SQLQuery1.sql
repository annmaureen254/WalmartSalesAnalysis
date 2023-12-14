-- DATA WRANGLING : Creating a Database, Import data, Get rid of Null Values
CREATE DATABASE WALMARTSALES;

SELECT * FROM [WalmartSalesData.csv];

--  FEATURE ENGINEERING --
SELECT Time FROM [WalmartSalesData.csv];

-- Time of day --
SELECT 
    Time,
    (CASE 
        WHEN DATEPART(HOUR, Time) BETWEEN 0 AND 11 THEN 'Morning'
        WHEN DATEPART(HOUR, Time) BETWEEN 12 AND 16 THEN 'Afternoon'
        ELSE 'Evening'
    END) AS time_of_day
FROM [WalmartSalesData.csv];

ALTER TABLE [WalmartSalesData.csv] 
ADD time_of_day VARCHAR(20);

UPDATE [WalmartSalesData.csv]
SET time_of_day = (
	CASE 
        WHEN DATEPART(HOUR, Time) BETWEEN 0 AND 11 THEN 'Morning'
        WHEN DATEPART(HOUR, Time) BETWEEN 12 AND 16 THEN 'Afternoon'
        ELSE 'Evening'
    END);

-- Day of the week --
SELECT Date,
DATENAME(dw, Date) AS day_of_week
FROM [WalmartSalesData.csv];

ALTER TABLE [WalmartSalesData.csv]
ADD day_of_week varchar(10);

UPDATE [WalmartSalesData.csv]
SET day_of_week = DATENAME(dw, Date);

SELECT * FROM [WalmartSalesData.csv];

-- Month Name -- 
SELECT Date,
DATENAME (month, Date) AS month_name
From [WalmartSalesData.csv];

ALTER TABLE [WalmartSalesData.csv]
ADD month_name varchar(10);

UPDATE [WalmartSalesData.csv]
SET month_name = DATENAME(month, Date)

SELECT * FROM [WalmartSalesData.csv];

-- EDA --
-- How many unique Cities does the data have --
SELECT DISTINCT City
FROM [WalmartSalesData.csv];

-- In which city is each branch -- 
SELECT DISTINCT Branch
FROM [WalmartSalesData.csv];

SELECT DISTINCT City, Branch
FROM [WalmartSalesData.csv];

-- Product Analysis --

-- How many unique product lines does the data have? --
SELECT COUNT (DISTINCT Product_line)
FROM [WalmartSalesData.csv];

-- What is the most common payment method -- 
SELECT Payment_Method, COUNT(Payment_Method) AS cnt 
FROM [WalmartSalesData.csv]
GROUP BY Payment_Method
ORDER BY cnt DESC;

-- What is the most selling product line --
SELECT Product_line, COUNT(Product_line) AS cnt
FROM [WalmartSalesData.csv]
GROUP BY Product_line
ORDER BY cnt DESC;

-- What is the total revenue by Month --
SELECT month_name, SUM(Total) AS Total_Revenue
FROM [WalmartSalesData.csv]
GROUP BY month_name
ORDER BY Total_Revenue DESC;

--What Month had the largest COGS --
SELECT month_name, SUM(cogs) AS COGS
FROM [WalmartSalesData.csv]
GROUP BY month_name
ORDER BY COGS DESC;

-- What Product Line had the largest Revenue --
SELECT Product_line, SUM(Total) AS Total_Revenue
FROM [WalmartSalesData.csv]
GROUP BY Product_line
ORDER BY Total_Revenue DESC;

--What is the city with the largest revenue --
SELECT Branch, City, SUM(Total) AS Total_Revenue
FROM [WalmartSalesData.csv]
GROUP BY Branch, City
ORDER BY Total_Revenue DESC;

-- What Product Line had the largest VAT --
SELECT Product_line, AVG(VAT) AS AVG_VAT
FROM [WalmartSalesData.csv]
GROUP BY Product_line
ORDER BY AVG_VAT DESC;

-- Which branch sold more products than average product sold --
SELECT Branch, SUM(Quantity) AS Qty
FROM [WalmartSalesData.csv]
GROUP BY Branch
HAVING SUM(Quantity) > (SELECT AVG(Quantity) FROM [WalmartSalesData.csv]);

--What is the most common product line by Gender --
SELECT * FROM [WalmartSalesData.csv]
SELECT DISTINCT (Gender), COUNT(Product_line) AS cnt, Product_line
FROM [WalmartSalesData.csv]
GROUP BY Gender, Product_line
ORDER BY cnt DESC

-- What is the Average Rating of each product line --
SELECT Product_line, ROUND(AVG(Rating),2) AS avg_rating
FROM [WalmartSalesData.csv]
GROUP BY Product_line
ORDER BY avg_rating DESC;

-- SALES Analysis--

-- Number of Sales made in each time of the day per weekday --
SELECT time_of_day, COUNT(Invoice_ID) AS Sales
FROM [WalmartSalesData.csv]
WHERE day_of_week = 'Monday'
GROUP BY time_of_day
ORDER BY Sales DESC;

-- Which of the customer types brings the most revenue -- 
SELECT * FROM [WalmartSalesData.csv];

SELECT Customer_type, ROUND (SUM(Total),2) AS Revenue
FROM [WalmartSalesData.csv]
GROUP BY Customer_type
ORDER BY Revenue DESC;

-- Which City has the largest tax percent/ VAT?--
SELECT City, ROUND(AVG(VAT),2) AS VAT
FROM [WalmartSalesData.csv]
GROUP BY City
ORDER BY VAT DESC;

-- Which Customer Type pays the most in VAT --
SELECT Customer_type, ROUND(AVG(VAT),2) AS VAT
FROM [WalmartSalesData.csv]
GROUP BY Customer_type
ORDER BY VAT DESC;

-- CUSTOMER ANALYSIS--
--How many unique customer types does the data have --
SELECT DISTINCT(Customer_type)
FROM [WalmartSalesData.csv]
GROUP BY Customer_type;

--How many unique Payment methods does the data have --
SELECT * FROM [WalmartSalesData.csv];

SELECT DISTINCT(Payment_Method), COUNT(Payment_Method) AS CNT
FROM [WalmartSalesData.csv]
GROUP BY Payment_Method
ORDER BY CNT DESC;

-- What is the most common customer type? --
SELECT DISTINCT(Customer_type), COUNT(Customer_type) AS cnt
FROM [WalmartSalesData.csv]
GROUP BY Customer_type
ORDER BY cnt;

-- Which Customer Type buys the most --
SELECT Customer_type, COUNT(*) AS COUNT_CUSTOMER
FROM [WalmartSalesData.csv]
GROUP BY Customer_type
ORDER BY COUNT_CUSTOMER;

-- What is the gender of most of the customers --
SELECT Gender, COUNT(*) Customers
FROM [WalmartSalesData.csv]
GROUP BY Gender
ORDER BY Customers DESC;

--What is the gender distribution per branch? --
SELECT Gender, COUNT(*) AS Gender_Cnt
FROM [WalmartSalesData.csv]
WHERE Branch = 'A'
GROUP BY Gender
ORDER BY Gender_Cnt;

--Which time of the day do customers give most ratings? --
SELECT time_of_day, AVG(Rating) AS Rate 
FROM [WalmartSalesData.csv]
GROUP BY time_of_day
ORDER BY Rate DESC;


--Which time of the day do customers give most ratings per branch? --
SELECT time_of_day, AVG(Rating) AS RATE
FROM [WalmartSalesData.csv]
WHERE BRANCH = 'B'
GROUP BY time_of_day
ORDER BY RATE;

--Which day of the week has the best average ratings --
SELECT day_of_week, AVG(Rating) AS Rate
FROM [WalmartSalesData.csv]
GROUP BY day_of_week
ORDER BY Rate DESC;

--Which day of the week has the best average ratings per branch --
SELECT day_of_week, AVG(Rating) AS Rate
FROM [WalmartSalesData.csv]
WHERE Branch = 'A'
GROUP BY day_of_week
ORDER BY Rate DESC;