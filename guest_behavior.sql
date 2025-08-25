/*
Project: Hotel Booking Cancellations
Query: Average cancellation rate by total of special requests and booking changes made by guests
Author: Frank Sacco
Date: August 2025

Description: Query #1 aims to determine if the number of special requests made by the guest in their reservation is a catalyst for
lower cancellation rates. By contrast, query #2 aims to confirm if a higher number of booking changes is a driver of higher cancellation rates.
Business Goal: Determine if certain guest behavior drives higher cancellation rates.
*/

-- Gather cancellation percentage of reservations by number of special guest requests
SELECT total_of_special_requests, AVG(is_canceled) * 100 AS cancel_rate
FROM hotel_bookings
GROUP BY total_of_special_requests
ORDER BY AVG(is_canceled) * 100 DESC;

-- Gather cancellation percentage by number of booking changes to reservation
SELECT booking_changes, AVG(is_canceled) * 100 AS cancel_rate
FROM hotel_bookings
GROUP BY booking_changes
ORDER BY AVG(is_canceled) * 100 DESC;