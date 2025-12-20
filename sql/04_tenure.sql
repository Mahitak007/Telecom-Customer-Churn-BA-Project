
-- How does customer tenure relate to churn behavior?


SELECT
    CASE
        WHEN tenure < 12 THEN '0–1 Year'
        WHEN tenure BETWEEN 12 AND 24 THEN '1–2 Years'
        WHEN tenure BETWEEN 25 AND 48 THEN '2–4 Years'
        ELSE '4+ Years'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM TelcoCustomerChurn
GROUP BY
    CASE
        WHEN tenure < 12 THEN '0–1 Year'
        WHEN tenure BETWEEN 12 AND 24 THEN '1–2 Years'
        WHEN tenure BETWEEN 25 AND 48 THEN '2–4 Years'
        ELSE '4+ Years'
    END
ORDER BY Churn_Rate_Percentage DESC;
