-- Total number of rides per bike.
SELECT member_casual, rideable_type, COUNT(*) AS no_rides_per_bike
FROM clean_merged_data
GROUP BY member_casual, rideable_type		 
											
											

-- Number of trips per month
SELECT month,member_casual, COUNT(ride_id) AS rides_per_month
FROM clean_merged_data
GROUP BY month, member_casual
ORDER BY month  DESC, member_casual

--Number of trips per week
SELECT day_of_week, member_casual, COUNT(ride_id) AS rides_per_week
FROM clean_merged_data
GROUP BY day_of_week, member_casual
ORDER BY day_of_week DESC

--Number of trips per hour
SELECT start_hour, member_casual, COUNT(ride_id) AS rides_per_hour
FROM clean_merged_data
GROUP BY start_hour, member_casual

--Average ride length per month
SELECT month, AVG(ride_length) AS avg_ride_length 
FROM clean_merged_data
GROUP BY month		--	result is in minutes

--Average ride length per week
SELECT day_of_week, AVG(ride_length) AS avg_ride_length
FROM clean_merged_data
GROUP BY day_of_week		--	result is in minutes

--Average ride length per hour
SELECT start_hour, AVG(ride_length) AS avg_ride_length
FROM clean_merged_data
GROUP BY start_hour		--	result is in minutes

-- Month with most rides
SELECT Month, COUNT(ride_length) as monthly_trips
FROM clean_merged_data
GROUP BY Month
ORDER BY monthly_trips DESC		

-- what time of the day did most trips start?
SELECT DATEPART(hour, start_time) as start_hour, COUNT(*) as NumTrips
FROM clean_merged_data
GROUP BY DATEPART(hour, start_time)
ORDER BY NumTrips DESC

--what time of the day did most trips end?
SELECT DATEPART(hour, end_time) as end_hour, COUNT(*) as NumTrips
FROM clean_merged_data
GROUP BY DATEPART(hour, end_time)
ORDER BY NumTrips DESC



--Desciptive Statistics on the ride length: Maximum, average, minimum, ride length(trip duration) in minutes (Max:1493 , Min:2 ,Avg:17 ) 
SELECT MIN(ride_length) as min_ride_length,
		MAX(ride_length) as max_ride_length,
		AVG(ride_length) as avg_ride_length
FROM clean_merged_data

--To get the percentile ride length,
SELECT DISTINCT(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY ride_length) OVER()) AS q1_length,
		 PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY ride_length) OVER() AS median,
		PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY ride_length) OVER() AS q3_length,
		(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY ride_length) OVER() - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY ride_length) OVER())  AS q4
FROM clean_merged_data
GROUP BY ride_length

--Total number of trips by member and casual riders.
SELECT member_casual, COUNT(*) as num_of_trips
FROM clean_merged_data
GROUP BY member_casual

--To identify which start station is most used among casual riders and members
SELECT start_station_name, COUNT(*)  as num_of_trips
FROM clean_merged_data
GROUP BY start_station_name
ORDER BY num_of_trips DESC		--Streeter Dr & Grand Ave is the most used start station.

--For stations most used as end stations,
SELECT end_station_name, COUNT(*) AS num_of_trips
FROM clean_merged_data
GROUP BY end_station_name
ORDER BY num_of_trips DESC	--Streeter Dr & Grand Ave is the most used end station.






