-- 12. Request Volume per Day of Week
--Is the lab busiest on Mondays? Least busy on Sundays?
--Insights: It helps to figure out what days of the week are the most busiest

SELECT DATENAME(WEEKDAY, request_date) AS DayOfWeek, COUNT(*) AS total_requests
FROM TestRequest
 GROUP BY DATENAME(WEEKDAY, request_date)
ORDER BY total_requests DESC;