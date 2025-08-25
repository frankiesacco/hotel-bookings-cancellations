SELECT CONCAT('$', FORMAT(SUM(adr * (stays_in_week_nights + stays_in_weekend_nights)), 0)) AS cancel_loss_by_country,
country
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY country
ORDER BY SUM(adr * (stays_in_week_nights + stays_in_weekend_nights)) DESC;

SELECT CONCAT('$', FORMAT(SUM(adr * (stays_in_week_nights + stays_in_weekend_nights)), 0)) AS cancel_loss_by_hotel,
hotel
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY hotel
ORDER BY SUM(adr * (stays_in_week_nights + stays_in_weekend_nights)) DESC;

SELECT CONCAT('$', FORMAT(SUM(adr * (stays_in_week_nights + stays_in_weekend_nights)), 0)) AS cancel_loss_by_month,
arrival_date_month
FROM hotel_bookings
WHERE is_canceled = 1
GROUP BY arrival_date_month
ORDER BY SUM(adr * (stays_in_week_nights + stays_in_weekend_nights)) DESC;