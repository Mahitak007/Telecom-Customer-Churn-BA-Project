
-- Does billing preference affect churn?


SELECT
    CASE
        WHEN PaperlessBilling = 'Yes'
        THEN 'Paperless Billing'
        ELSE 'Paper Billing'
    END AS Billing_Group,
    COUNT(*) AS Total_Customers,
    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM TelcoCustomerChurn
GROUP BY
    CASE
        WHEN PaperlessBilling = 'Yes'
        THEN 'Paperless Billing'
        ELSE 'Paper Billing'
    END;
