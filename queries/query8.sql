--8. Revenue by Payment Type
--Question: What is the revenue distribution by payment type (Cash, POS, HMO, etc.)?
-- Insight: Useful for financial planning and improving payment infrastructure.

SELECT payment_type, SUM (amount_paid) AS total_amount_paid
FROM PAYMENT
GROUP BY payment_type
ORDER by total_amount_paid DESC;