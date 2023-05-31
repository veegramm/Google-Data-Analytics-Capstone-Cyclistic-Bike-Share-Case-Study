--checking for the number of null values in each column
SELECT COUNT(*)-COUNT(ride_id) as ride_id,	--0 null columns
COUNT(*)-COUNT(rideable_type) as rideable_type,	--0 null columns
COUNT(*)-COUNT(started_at) as started_at,	--0 null columns
COUNT(*)-COUNT(ended_at) as ended_at,	--0 null columns
COUNT(*)-COUNT(start_station_name) as start_station_name,	--833064 null columns
COUNT(*)-COUNT(start_station_id) as start_station_id,	--833064 null columns
COUNT(*)-COUNT(end_station_name) as end_station_name,	--892742 null columns
COUNT(*)-COUNT(end_station_id) as end_station_id,	--1582850 null columns
COUNT(*)-COUNT(start_lat) as start_lat,	--0 null columns
COUNT(*)-COUNT(start_lng) as start_lng,	--0 null columns
COUNT(*)-COUNT(end_lat) as end_lat,	--5866 null columns
COUNT(*)-COUNT(end_lng) as end_lng,	--5866 null columns
COUNT(*)-COUNT(member_casual) as member_casual	--0 null columns
FROM dbo.[[2022]]]

--Analysing each column, ride_id
SELECT LEN(ride_id), COUNT(*)
FROM dbo.[[2022]]]
GROUP BY LEN(ride_id)

SELECT DISTINCT (ride_id)
FROM dbo.[[2022]]]	-- The ride_id is 16 characters long, and there are no null rows.

-- rideable_type
SELECT DISTINCT (rideable_type), COUNT(rideable_type) as no_of_rides
FROM dbo.[[2022]]]
GROUP BY rideable_type	--three types of bikes are used;classic_bike with 2889029 rides, electric_bike with 2601214 rides, docked_bike with 177474 rides.

SELECT COUNT(ride_id) AS rows_with_null_rideable_type
FROM dbo.[[2022]]]
WHERE rideable_type IS NULL		--returns 0 rows.

-- started_at, ended_at
SELECT TOP (10) started_at, ended_at
FROM dbo.[[2022]]]

SELECT COUNT(*) AS longer_than_a_day
FROM dbo.[[2022]]]
WHERE (
		DATEDIFF(hour, started_at, ended_at) * 60 +
		DATEDIFF(minute, started_at, ended_at) +
		DATEDIFF(second, started_at, ended_at) /60) >= 1440	--there are 8688 rides are longer than a day.

SELECT COUNT(*) AS less_than_a_minute
FROM dbo.[[2022]]]
WHERE (
		DATEDIFF(hour, started_at, ended_at) * 60 +
		DATEDIFF(minute, started_at, ended_at) +
		DATEDIFF(second, started_at, ended_at) /60) <= 1	--there are 120294 rides less than a minute

-- start_station_name, start_station_id
SELECT DISTINCT start_station_name
FROM dbo.[[2022]]]
ORDER BY start_station_name --there are 1674 start stations with nulls

SELECT COUNT(ride_id) AS rows_with_null_start_station          
FROM dbo.[[2022]]]
WHERE start_station_name IS NULL OR start_station_id IS NULL	--returns 833064 rows

SELECT start_station_name, COUNT (start_station_name) AS no_trips_per_station
FROM dbo.[[2022]]]
GROUP BY start_station_name
ORDER BY no_trips_per_station DESC  --the station with the highest number of start trips is Streeter Dr & Grand Ave with 75,237 start trips

--end_station_name, end_station_id: 
SELECT DISTINCT end_station_name
FROM dbo.[[2022]]]
ORDER BY end_station_name	--there are 1692 end stations with nulls

SELECT COUNT(ride_id) AS rows_with_null_end_station          
FROM dbo.[[2022]]]
WHERE end_station_name IS NULL OR end_station_id IS NULL		--returns 1,582,850 rows.

--start_lat, start_lng
SELECT COUNT(ride_id) AS rows_with_null_start_lat
FROM dbo.[[2022]]]
WHERE start_lat IS NULL OR start_lng IS NULL		--returns 0 rows

--end_lat, end_lng
SELECT COUNT(ride_id) AS rows_with_null_end_lat
FROM dbo.[[2022]]]
WHERE end_lat IS NULL OR end_lng IS NULL		--returns 5866 rows

--member_casual
SELECT DISTINCT (member_casual)
FROM dbo.[[2022]]]
GROUP BY member_casual		--there are two types of riders, casual and member.


