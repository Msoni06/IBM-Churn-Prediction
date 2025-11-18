-- SQL Analysis for Telco Churn Prediction
-- Goal: Extract business insights regarding churn patterns

-- 1. Overall Churn Rate Calculation
SELECT 
    COUNT(customerID) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churn_Count,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(customerID), 
        2
    ) AS Churn_Rate_Percent
FROM Telco_Customer_Churn;

-- 2. Churn by Contract Type (Identifying the High-Risk Segment)
-- Insight: Month-to-month contracts usually have higher churn.
SELECT 
    Contract,
    COUNT(customerID) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churn_Count,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(customerID), 
        2
    ) AS Churn_Rate_Percent
FROM Telco_Customer_Churn
GROUP BY Contract
ORDER BY Churn_Rate_Percent DESC;

-- 3. Revenue Loss Analysis by Internet Service
-- Insight: Which service type causes the highest financial loss due to churn?
SELECT 
    InternetService,
    COUNT(customerID) AS Churn_Count,
    ROUND(SUM(MonthlyCharges), 2) AS Total_Revenue_Lost
FROM Telco_Customer_Churn
WHERE Churn = 'Yes'
GROUP BY InternetService
ORDER BY Total_Revenue_Lost DESC;

-- 4. Identifying High-Value At-Risk Customers
-- Criteria: High Monthly Charges (> $70) and Short Tenure (< 1 Year)
SELECT 
    customerID,
    MonthlyCharges,
    Tenure,
    Contract,
    PaymentMethod
FROM Telco_Customer_Churn
WHERE MonthlyCharges > 70 
  AND tenure < 12
  AND Churn = 'No' -- Customers who are still with us but fit the "Risk Profile"
ORDER BY MonthlyCharges DESC
LIMIT 50;

-- 5. Customer Segmentation by Tenure Groups (CASE Statement)
SELECT 
    CASE 
        WHEN tenure <= 12 THEN 'New (0-1 Year)'
        WHEN tenure > 12 AND tenure <= 24 THEN 'Established (1-2 Years)'
        WHEN tenure > 24 THEN 'Loyal (> 2 Years)'
    END AS Tenure_Group,
    COUNT(customerID) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churn_Count
FROM Telco_Customer_Churn
GROUP BY 
    CASE 
        WHEN tenure <= 12 THEN 'New (0-1 Year)'
        WHEN tenure > 12 AND tenure <= 24 THEN 'Established (1-2 Years)'
        WHEN tenure > 24 THEN 'Loyal (> 2 Years)'
    END
ORDER BY Churn_Count DESC;