--3. Departmental Workload
--Question: Which department processed the highest number of tests?
--Insight: This assess the  departmental productivity and workload distribution.
 
 SELECT TOP 1 
 tr.departmentID,dp.department_name,COUNT (resultID) AS total_test_processed
 FROM TestResult tr
 JOIN department dp
 ON tr.departmentID=dp.departmentID
 GROUP BY tr.departmentID, dp.department_name
 ORDER BY total_test_processed DESC;
