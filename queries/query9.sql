--9. Test Profitability
--Question: What is the total revenue per test type?
-- Insight:It helps find which tests are not only popular, but profitable


SELECT t.testid,t.test_name,COUNT (p.requestid)no_of_tests ,SUM (p.amount_paid)AS total_revenue
FROM Test AS t
JOIN Testrequest AS tr
on t.testid=tr.testid
JOIN payment as p
ON tr.requestID=p.requestId
GROUP BY t.testid, t.test_name
ORDER BY total_revenue DESC;
