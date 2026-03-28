create database HA_project;
use ha_project;

SELECT 
    SUM(capacity) AS Total_Capacity
FROM fact_aggregated_bookings;


SELECT 
    check_in_date,
    SUM(capacity) AS Total_Capacity
FROM fact_aggregated_bookings
GROUP BY check_in_date
ORDER BY check_in_date;

SELECT 
    SUM(revenue_realized) AS Total_Revenue
FROM fact_bookings;


SELECT 
    CONCAT(
        ROUND(SUM(successful_bookings) * 100.0 / SUM(capacity), 2),
        '%'
    ) AS Occupancy_Percentage
FROM fact_aggregated_bookings;

SELECT 
    CONCAT(
        ROUND(
            SUM(CASE 
                    WHEN booking_status = 'Cancelled' THEN 1 
                    ELSE 0 
                END) * 100.0 / COUNT(*),
        2),
        '%'
    ) AS Cancellation_Rate
FROM fact_bookings;






