
-- How do demographics affect churn?


SELECT
    CASE
        WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
        ELSE 'Non-Senior'
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM TelcoCustomerChurn
GROUP BY
    CASE
        WHEN SeniorCitizen = 1 THEN 'Senior Citizen'
        ELSE 'Non-Senior'
    END;

-- Churn by Partner Status
SELECT
    CASE
        WHEN Partner = 'Yes' THEN 'Has Partner'
        ELSE 'No Partner'
    END AS Partner_Status,
    COUNT(*) AS Total_Customers,
    CAST(
