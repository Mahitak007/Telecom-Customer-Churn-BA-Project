
-- How does churn vary across different contract types?


SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM TelcoCustomerChurn
GROUP BY Contract
ORDER BY Churn_Rate_Percentage DESC;
