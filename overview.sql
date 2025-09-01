/*
Project: Hotel Booking Cancellations
Query: Cancellation percentage by total bookings and hotel type
Author: Frank Sacco
Date: August 2025

Description: These queries calculate the percentage of cancellations vs. non-cancellations out of all bookings, as well as calculate cancellation percentage by hotel type (Resort/City)
Business Goal: Determine which hotel type is more susceptible to cancellation
*/

SELECT COUNT(*) AS cancel_count, is_canceled,
(COUNT(*) * 100.0) / (SELECT COUNT(*) FROM hotel_bookings) AS percentage
FROM hotel_bookings
GROUP BY is_canceled
ORDER BY COUNT(*) DESC;

SELECT AVG(is_canceled) * 100 AS cancel_rate, hotel
FROM hotel_bookings
GROUP BY hotel
ORDER BY cancel_rate DESC
