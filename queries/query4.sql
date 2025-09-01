
--4. Inactive Assets
--Question: Which doctors are in the system but never referred patients?
--Insight: This is useful for internal HR discussions and identifying underutilized referrers.

SELECT doc.doctorname , 
COUNT (TR.doctorID) as  no_of_requests 
FROM DOCTOR doc
LEFT JOIN testrequest tr
ON doc.doctorID =tr.doctorID
GROUP BY doc.doctorname
HAVING COUNT (TR.doctorID) =0;
