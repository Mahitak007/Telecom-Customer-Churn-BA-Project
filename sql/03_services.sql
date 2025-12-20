
-- How does churn differ between customers who use value-added services and those who do not?


SELECT
    CASE
        WHEN OnlineSecurity = 'No'
         AND OnlineBackup = 'No'
         AND DeviceProtection = 'No'
         AND TechSupport = 'No'
        THEN 'No Value-Added Services'
        ELSE 'At Least One Service'
    END AS Service_Group,
    COUNT(*) AS Total_Customers,
    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM TelcoCustomerChurn
GROUP BY
    CASE
        WHEN OnlineSecurity = 'No'
         AND OnlineBackup = 'No'
         AND DeviceProtection = 'No'
         AND TechSupport = 'No'
        THEN 'No Value-Added Services'
        ELSE 'At Least One Service'
    END;
