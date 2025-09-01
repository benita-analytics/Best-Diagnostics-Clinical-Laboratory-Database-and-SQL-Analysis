--11. Doctor Performance
--Question: Which doctors referred the most patients or generated the most revenue?
-- Insight: Supports referral based incentives and partnership strategy.

SELECT d.doctorname, 
	COUNT (tq.requestID) no_of_reffered_px,
	SUM(p.amount_paid) revenue_generated
FROM Doctor d
LEFT JOIN TestRequest tq
ON d.doctorID =tq.doctorID
LEFT JOIN Payment p 
ON tq.requestID = p.requestID
GROUP BY d.doctorname
ORDER BY revenue_generated DESC;
