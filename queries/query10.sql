--10. Department Utilization
--Question: Are there departments in the database that received zero requests?
-- Insight: It helps identify inactive departments and opportunities for restructuring.

SELECT d.departmentID, d.department_name, count (tq.requestID) AS count_per_dpartment
FROM department d
LEFT JOIN TestResult tr
ON d.departmentID = tr.departmentID
LEFT JOIN TestRequest tq
ON tr.requestID =tq.requestID
GROUP BY d.departmentID, d.department_name
HAVING  count (tq.requestID) = 0;
