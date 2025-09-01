--5. Unused Lab Resources
--Question: Which tests in the database were never requested?
-- Insight:  It flags tests that are not requested, and reduce allocations to test, to make room forthose that are frequently requested.
SELECT t.testID, t.test_name 
FROM Test as T 
LEFT JOIN TestRequest tr
ON t.testID=tr.testID
WHERE tr.testID IS NULL;
