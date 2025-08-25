/*
Project: Hotel Booking Cancellations
Query: Cancellation rate using geographical data, per country and domestic vs international visitors
Author: Frank Sacco
Date: August 2025

Description: These queries aim to determine if more domestic or foreign guests have a higher cancellation rate, as well as what foreign guests
are most likely to cancel.
Business Goal: Determine highest cancellation rates amongst certain guest demographics.
*/

-- #1
SELECT AVG(is_canceled) * 100 AS cancel_rate, COUNT(*) AS total_bookings,
CASE
WHEN country = 'PRT' THEN 'Portugal'
ELSE 'international'
END AS visitor_type
    FROM hotel_bookings
    WHERE country IS NOT NULL
    GROUP BY visitor_type
    HAVING COUNT(*) > 100;

-- #2
WITH cancel_by_country AS (
SELECT ROUND(AVG(is_canceled) * 100, 3) AS cancel_rate, COUNT(*) AS total_bookings, country
FROM hotel_bookings
GROUP BY country
HAVING COUNT(*) > 100
)

SELECT *,
RANK() OVER (ORDER BY cancel_rate DESC) AS country_ranking
FROM cancel_by_country;