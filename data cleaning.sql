--creating a view that will contain the cleaned data i'm going to work with,
CREATE VIEW clean_merged_data AS
WITH clean_data AS 
(
SELECT ride_id, rideable_type, start_station_name, end_station_name,
		CAST(started_at AS date) AS started_at, CAST(ended_at AS date) AS ended_at,
		FORMAT(started_at, 'hh:mm:ss') AS start_time, FORMAT(ended_at, 'hh:mm:ss') AS end_time,
		DATENAME(month, started_at) as Month,
		CASE DATEPART(WEEKDAY, started_at)
			WHEN 1 THEN 'Sun'
			WHEN 2 THEN 'Mon'
			WHEN 3 THEN 'Tue'
			WHEN 4 THEN 'Wed'
			WHEN 5 THEN 'Thur'
			WHEN 6 THEN 'Fri'
			WHEN 7 THEN 'Sat'
			END AS day_of_week,
		DATEDIFF(minute, started_at, ended_at) AS ride_length,
		DATEPART(hour, started_at) AS start_hour,
		start_lat, start_lng, end_lat, end_lng, member_casual
FROM dbo.[[2022]]]
)
SELECT * 
FROM clean_data 
WHERE  start_station_name IS NOT NULL AND
    end_station_name IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL AND
    ride_length > 1 AND ride_length < 1440

SELECT *
FROM clean_merged_data		--returns 4,263,288 rows. thus, 1,404,429 rows were deleted.

