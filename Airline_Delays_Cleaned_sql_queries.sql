SELECT TOP (1000) [Flight_ID]
      ,[Airline]
      ,[Distance_km]
      ,[Departure_Delay_min]
      ,[Arrival_Delay_min]
      ,[Delay_Status]
      ,[Delay_Difference]
      ,[Distance_Category]
      ,[Performance_Label]
  FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned]


--Working On the Insight On Airline Delay Performance And Operational Efficiency 

---Questions And Answers


---1. Which Airline Performs Better 

  Select Airline,
        AVG(Arrival_Delay_Min) AS
        Avg_Arrival_Delay
   FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned]
   GROUP BY Airline
   ORDER BY Avg_Arrival_Delay desc


   select Airline, count(*) as total_flights
 FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned]
group by Airline 
order by total_flights

--Answer: Delta demonstrated the strongest operational efficiency with 100% on_time performance, While Lufthanse recorded the lowest performance at 97%, Indicating
--relatively higher delay occurrence compared to other airlines


---2. Which Airlines Struggle With Punctuality?

SELECT 
    Airline,
    COUNT(*) AS Delayed_Flights
 FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned]
 WHERE Delay_Status = 'Delayed'
 GROUP BY Airline
 ORDER BY Delayed_Flights DESC

 --Answer: Based on the count of delayed flight, Emirates recorded the hightest number of delays[1,968], Indicating greater punctuality challenges compared to the other airline in the dataset.
 --Lufthansa recorded flights [1,852], suggesting comparatively better punctuality performance.


---3. Does Distance Affect Delays?

SELECT Distance_Category,
    AVG(Arrival_Delay_min) AS Avg_delay
 FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned]
 GROUP BY Distance_Category

 --Answer: Based on the analysis of average performance across distance categories, Short haul flight recorded the hightest performance score (100), followed by Medium Haul (99) and long haul
 --(98).This result indicate only a slight variation between the categories,suggesting that flight distancehas a minimal impact on delays within the dataset.


 ---4.Which Flights Recovered Delay?

 SELECT
     Flight_ID,
     Airline,
     Departure_Delay_min,
     Arrival_Delay_min,
     Delay_Difference
 FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned]
WHERE Delay_Difference < 0



 SELECT
     Flight_ID,
     Airline,
     Departure_Delay_min,
     Arrival_Delay_min,
     Arrival_Delay_min - Departure_Delay_min AS Delay_Difference
 FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned]
WHERE Arrival_Delay_min < Departure_Delay_min


 SELECT *
 FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned]
WHERE Arrival_Delay_min < Departure_Delay_min  

--Answer: The analysis identified multiple flights with a negative Delay difference, indicating that they successfully recovered time during the journey.


---5. Which Flights Are Operationally Inefficient?

SELECT *
 FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned]
WHERE Arrival_Delay_min > 120
  
--Answer: The analysis identified operationally inefficient flight as those with arrival delays exceeding 120 minutes. These flight experienced significant disruptions and failed to maintain acceptable schedule performance.


---6.Average Delay Across All Flights

SELECT 
AVG(Arrival_Delay_min) AS Overall_avg_delay
 FROM [ Airline_Delays].[dbo].[Airline_Delay_Cleaned] 

--Answer: The analysis revealed an overall average arrival delay of 99 minutes across all flight in the dataset. This indicates that the typical flight experienced a delay of approximately 1hour and 39 mins beyond it scheduled arrival time.



