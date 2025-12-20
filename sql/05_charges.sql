
-- How do monthly charges relate to churn behavior?


SELECT
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Charges'
        WHEN MonthlyCharges BETWEEN 35 AND 70 THEN 'Medium Charges'
        ELSE 'High Charges'
    END AS Charges_Group,
    COUNT(*) AS Total_Customers,
    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM TelcoCustomerChurn
GROUP BY
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Charges'
        WHEN MonthlyCharges BETWEEN 35 AND 70 THEN 'Medium Charges'
        ELSE 'High Charges'
    END
ORDER BY Churn_Rate_Percentage DESC;
