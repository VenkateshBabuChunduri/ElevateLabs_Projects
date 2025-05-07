-- Create the Database & Table

CREATE DATABASE retail_analysis;

USE retail_analysis;

CREATE TABLE orders (
  Item_Name VARCHAR(50),
  Category VARCHAR(50),
  Version VARCHAR(100),
  Item_Code VARCHAR(100),
  Item_ID BIGINT,
  Buyer_ID BIGINT,
  Transaction_ID BIGINT,
  Date DATE,
  Final_Quantity INT,
  Total_Revenue DECIMAL(10,2),
  Price_Reductions DECIMAL(10,2),
  Refunds DECIMAL(10,2),
  Final_Revenue DECIMAL(10,2),
  Sales_Tax DECIMAL(10,2),
  Overall_Revenue DECIMAL(10,2),
  Refunded_Item_Count INT,
  Purchased_Item_Count INT
);

SET GLOBAL local_infile = 1;

SET GLOBAL max_allowed_packet = 67108864;  -- 64MB

-- Check for NULL or Missing Records
-- Check how many rows have NULLs in any column

SELECT COUNT(*) AS total_nulls
FROM orders
WHERE Item_Name IS NULL
   OR Category IS NULL
   OR Version IS NULL
   OR Item_Code IS NULL
   OR Item_ID IS NULL
   OR Buyer_ID IS NULL
   OR Transaction_ID IS NULL
   OR Date IS NULL
   OR Final_Quantity IS NULL
   OR Total_Revenue IS NULL
   OR Price_Reductions IS NULL
   OR Refunds IS NULL
   OR Final_Revenue IS NULL
   OR Sales_Tax IS NULL
   OR Overall_Revenue IS NULL
   OR Refunded_Item_Count IS NULL
   OR Purchased_Item_Count IS NULL;

-- Delete rows with nulls (if needed)
DELETE FROM orders
WHERE Item_Name IS NULL
   OR Category IS NULL
   OR Version IS NULL
   OR Item_Code IS NULL
   OR Item_ID IS NULL
   OR Buyer_ID IS NULL
   OR Transaction_ID IS NULL
   OR Date IS NULL
   OR Final_Quantity IS NULL
   OR Total_Revenue IS NULL
   OR Price_Reductions IS NULL
   OR Refunds IS NULL
   OR Final_Revenue IS NULL
   OR Sales_Tax IS NULL
   OR Overall_Revenue IS NULL
   OR Refunded_Item_Count IS NULL
   OR Purchased_Item_Count IS NULL;

-- Profit Margin by Category

SELECT 
    Category,
    ROUND(SUM(Final_Revenue), 2) AS Total_Final_Revenue,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND((SUM(Final_Revenue) / NULLIF(SUM(Total_Revenue), 0)) * 100, 2) AS Profit_Margin_Percent
FROM 
    orders
GROUP BY 
    Category
ORDER BY 
    Profit_Margin_Percent;


-- Profit Margin by Category + Item Name (Sub-category)

SELECT 
    Category,
    Item_Name,
    ROUND(SUM(Final_Revenue), 2) AS Total_Final_Revenue,
    ROUND(SUM(Total_Revenue), 2) AS Total_Revenue,
    ROUND((SUM(Final_Revenue) / NULLIF(SUM(Total_Revenue), 0)) * 100, 2) AS Profit_Margin_Percent
FROM 
    orders
GROUP BY 
    Category, Item_Name
ORDER BY 
    Profit_Margin_Percent;






