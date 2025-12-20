
-- Does usage of streaming services affect churn?

SELECT
    CASE
        WHEN StreamingTV = 'No' AND StreamingMovies = 'No'
        THEN 'No Streaming Services'
        ELSE 'At Least One Streaming Service'
    END AS Streaming_Group,
    COUNT(*) AS Total_Customers,
    CAST(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Churn_Rate_Percentage
FROM TelcoCustomerChurn
GROUP BY
    CASE
        WHEN StreamingTV = 'No' AND StreamingMovies = 'No'
        THEN 'No Streaming Services'
        ELSE 'At Least One Streaming Service'
    END;
