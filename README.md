**Walmart Sales Data Analysis**
**About**
This project aims to explore Walmart Sales data to understand top-performing branches and products, sales trends of different products, and customer behavior. The aim is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

"In this recruiting competition, job-seekers are provided with historical sales data for 45 Walmart stores located in different regions. Each store contains many departments, and participants must project the sales for each department in each store. To add to the challenge, selected holiday markdown events are included in the dataset. These markdowns are known to affect sales, but it is challenging to predict which departments are affected and the extent of the impact." source

**Purposes Of The Project**
The major aim of this project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.

**About Data**
The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from three different branches of Walmart located in Mandalay, Yangon, and Naypyitaw. The data contains 17 columns and 1000 rows:

**Column	Description	Data Type**
invoice_id	Invoice of the sales made	VARCHAR(30)
branch	Branch at which sales were made	VARCHAR(5)
city	The location of the branch	VARCHAR(30)
customer_type	The type of the customer	VARCHAR(30)
gender	Gender of the customer making purchase	VARCHAR(10)
product_line	Product line of the product sold	VARCHAR(100)
unit_price	The price of each product	DECIMAL(10, 2)
quantity	The amount of the product sold	INT
VAT	The amount of tax on the purchase	FLOAT(6, 4)
total	The total cost of the purchase	DECIMAL(10, 2)
date	The date on which the purchase was made	DATE
time	The time at which the purchase was made	TIMESTAMP
payment_method	The total amount paid	DECIMAL(10, 2)
cogs	Cost Of Goods sold	DECIMAL(10, 2)
gross_margin_percentage	Gross margin percentage	FLOAT(11, 9)
gross_income	Gross Income	DECIMAL(10, 2)
rating	Rating	FLOAT(2, 1)

**Analysis List**
**Product Analysis**

Analyze the data to understand the different product lines, the product lines performing best, and the product lines that need to be improved.

**Sales Analysis**
This analysis aims to answer the question of the sales trends of products. The result of this can help us measure the effectiveness of each sales strategy the business applies and what modifications are needed to gain more sales.

**Customer Analysis**
This analysis aims to uncover the different customer segments, purchase trends, and the profitability of each customer segment.

**Approach Used**
1. Data Wrangling: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace missing or NULL values.
2. Build a database
3. Create a table and insert the data.
4. Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.

**Feature Engineering:**
This will help us generate some new columns from existing ones.
1. Add a new column named time_of_day to give insight into sales in the Morning, Afternoon, and Evening. This will help answer the question of which part of the day most sales are made.
2. Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
3. Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
   
**Exploratory Data Analysis (EDA): **
Exploratory data analysis is done to answer the listed questions and aims of this project.

**Business Questions To Answer**
How many unique cities does the data have?
In which city is each branch?

**Product**
How many unique product lines does the data have?
What is the most common payment method?
What is the most selling product line?
What is the total revenue by month?
What month had the largest COGS?
What product line had the largest revenue?
What is the city with the largest revenue?
What product line had the largest VAT?
Which branch sold more products than the average product sold?
What is the most common product line by gender?
What is the average rating of each product line?

**Sales**
Number of sales made at each time of the day per weekday
Which of the customer types brings the most revenue?
Which city has the largest tax percentage/ VAT (Value Added Tax)?
Which customer type pays the most in VAT?

**Customer**
How many unique customer types does the data have?
How many unique payment methods does the data have?
What is the most common customer type?
Which customer type buys the most?
What is the gender of most of the customers?
What is the gender distribution per branch?
Which time of the day do customers give the most ratings?
Which time of the day do customers give the most ratings per branch?
Which day of the week has the best average ratings?
Which day of the week has the best average ratings per branch?
