---7. HMO Value Analysis
--Question: Which HMOs brought in the most test volume and revenue?
--Insight:  showing which HMOs contribute most to the business.

SELECT h.hmo_name,h.hmoid,count (p.paymentID) as HMOVolume, sum(p.amount_paid) as total_paid
from HMO h
JOIN Payment p
ON h.hmoID=p.hmo_id
GROUP BY h.hmoid, h.hmo_name
ORDER BY total_paid DESC;
