--2. Top Performing Tests
--Question: Which test types were most requested?
-- Insight: This helps with stock planning (e.g., reagents), test pricing, and investment in specific machines or kits.

SELECT TOP 5
t.test_name, COUNT(tr.testID) AS count_of_tests
FROM Test AS t
JOIN TestRequest AS tr
ON t.testID=tr.testID
GROUP BY t.test_name
ORDER BY count_of_tests DESC;
