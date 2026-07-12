-- 1. REVENUE ANALYSIS
-----------------------------------------------------------

-- Total Revenue
SELECT 
    SUM(Quantity * (1000 + (ProductID % 100) * 50) * (1 - Discount / 100.0)) AS TotalRevenue
FROM Sales;

-- Average Order Value
SELECT 
    SUM(Quantity * (1000 + (ProductID % 100) * 50) * (1 - Discount / 100.0)) 
    / COUNT(*) AS AvgOrderValue
FROM Sales;

-----------------------------------------------------------
-- 2. ORDER & CUSTOMER ANALYSIS
-----------------------------------------------------------

-- Total Orders
SELECT COUNT(*) AS TotalOrders
FROM Sales;

-- Total Unique Customers
SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM Sales;

-- Top 10 Customers by Revenue
SELECT TOP 10
    CustomerID,
    SUM(Quantity * (1000 + (ProductID % 100) * 50) * (1 - Discount / 100.0)) AS Revenue
FROM Sales
GROUP BY CustomerID
ORDER BY Revenue DESC;

-----------------------------------------------------------
-- 3. PRODUCT PERFORMANCE ANALYSIS
-----------------------------------------------------------

-- Top 10 Best-Selling Products
SELECT TOP 10
    ProductID,
    SUM(Quantity) AS TotalSold
FROM Sales
GROUP BY ProductID
ORDER BY TotalSold DESC;

-- Bottom 10 Low-Selling Products
SELECT TOP 10
    ProductID,
    SUM(Quantity) AS TotalSold
FROM Sales
GROUP BY ProductID
ORDER BY TotalSold ASC;

-----------------------------------------------------------
-- 4. SALES TREND ANALYSIS
-----------------------------------------------------------

-- Monthly Revenue Trend
SELECT 
    FORMAT(OrderDate, 'yyyy-MM') AS Month,
    SUM(Quantity * (1000 + (ProductID % 100) * 50) * (1 - Discount / 100.0)) AS Revenue
FROM Sales
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY Month;

-----------------------------------------------------------
-- 5. BRANCH PERFORMANCE ANALYSIS
-----------------------------------------------------------

-- Revenue by Branch
SELECT 
    BranchID,
    SUM(Quantity * (1000 + (ProductID % 100) * 50) * (1 - Discount / 100.0)) AS Revenue
FROM Sales
GROUP BY BranchID
ORDER BY Revenue DESC;

-- Top 3 Performing Branches
SELECT TOP 3
    BranchID,
    SUM(Quantity * (1000 + (ProductID % 100) * 50) * (1 - Discount / 100.0)) AS Revenue
FROM Sales
GROUP BY BranchID
ORDER BY Revenue DESC;

-----------------------------------------------------------
-- 6. DISCOUNT IMPACT ANALYSIS
-----------------------------------------------------------

SELECT 
    Discount,
    COUNT(*) AS TotalOrders,
    AVG(Quantity) AS AvgQuantity
FROM Sales
GROUP BY Discount
ORDER BY Discount;

-----------------------------------------------------------
-- 7. EMPLOYEE PERFORMANCE ANALYSIS
-----------------------------------------------------------

SELECT 
    EmployeeID,
    COUNT(*) AS OrdersHandled,
    SUM(Quantity) AS TotalQuantity
FROM Sales
GROUP BY EmployeeID
ORDER BY OrdersHandled DESC;

