/*
Project: Hotel Booking Cancellations
Query: Cancellation rates per monthly bookings and seasonal bookings
Author: Frank Sacco
Date: August 2025

Description: These queries provide insight into the times of year that are most popular, and that are most prone to cancellations.
Business Goal: Determine what months and times of year are most susceptible to cancellations in order to support staffing, pricing, 
and risk-management decisions.
*/

WITH monthly_cancellations AS (
SELECT arrival_date_month,
COUNT(*) AS total_bookings,
SUM(is_canceled) AS cancellations,
ROUND(CAST(SUM(is_canceled) AS FLOAT) / COUNT(*), 2) AS cancel_rate
FROM hotel_bookings
GROUP BY arrival_date_month
),

ranked_months AS (
SELECT *,
DENSE_RANK() OVER (ORDER BY cancel_rate DESC) AS cancel_rank
FROM monthly_cancellations
)

SELECT *
FROM ranked_months
WHERE cancel_rank <= 3
ORDER BY cancel_rate DESC;

SELECT CASE
WHEN arrival_date_month IN ("December", "January", "February") THEN "Winter"
WHEN arrival_date_month IN ("March", "April", "May") THEN "Spring"
WHEN arrival_date_month IN ("June", "July", "August") THEN "Summer"
WHEN arrival_date_month IN ("September", "October", "November") THEN "Autumn"
END AS seasons,
AVG(is_canceled) * 100 AS cancel_rate,
COUNT(*) AS seasonal_bookings
FROM hotel_bookings
GROUP BY seasons
ORDER BY cancel_rate DESC