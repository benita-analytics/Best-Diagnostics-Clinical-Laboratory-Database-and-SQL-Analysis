--6. Patient Request Frequency
--Question: What percentage of patients only requested one test, and who are the patients with multiple test requests?
--Insight:It identifies one-time vs returning clients. Useful for investigating test bundling strategies.


WITH count_requests AS 
	(SELECT patientID, count (requestID) AS count_of_tests
		FROM TestRequest 
		GROUP BY PatientID)
SELECT COUNT (CASE WHEN count_of_tests = 1 THEN 1  END)*100/COUNT (*) as percentge_with_one_test
FROM count_requests

GO

SELECT patientID, count (requestID) AS count_of_tests
FROM TestRequest
GROUP BY PatientID
HAVING count (requestID) > 1;

GO


