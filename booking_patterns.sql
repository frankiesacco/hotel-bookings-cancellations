/*
Project: Hotel Booking Cancellations
Query: Cancellation rate percentage by lead time and guest deposit type
Author: Frank Sacco
Date: August 2025

Description: Query #1 calculates average lead time for canceled vs non-canceled bookings and compares cancellation percentages across different
lead time buckets. Query #2 aims to calculate the average cancellation percentage of different deposit types that are made by guests.
Business Goal: Determine whether long-term bookings are more likely to cancel, and what deposit type has the highest cancellation rate.
*/

-- #1
SELECT ROUND(AVG(lead_time), 2) AS avg_lead_time, is_canceled
FROM hotel_bookings
GROUP BY is_canceled
ORDER BY AVG(lead_time) DESC;

-- #2
SELECT deposit_type, AVG(is_canceled) * 100 AS cancel_rate
FROM hotel_bookings
GROUP BY deposit_type;