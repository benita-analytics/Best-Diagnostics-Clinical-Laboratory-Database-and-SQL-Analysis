-- 1. Trend of Tests
--Question: What is the trend of test requests per month between July 2024 and July 2025?
--?? Insight: Identify seasonal spikes or drops in lab activity. Useful for staffing and resource planning.

USE[BestDiagnostics]
GO
SELECT 
FORMAT (request_date, 'yyyy-MM') AS Month,
COUNT (requestID) AS Total_request_per_month
FROM TestRequest
WHERE request_date BETWEEN '2024-07-01' AND '2025-07-31'
GROUP BY FORMAT (request_date, 'yyyy-MM')
ORDER BY  Month;
GO