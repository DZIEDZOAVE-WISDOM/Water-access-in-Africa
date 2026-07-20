-- AXIA FINAL PROJECT
-- IMPORTING THE DATA
CREATE DATABASE water_access_and_sanitation_in_africa;
SELECT*
FROM water_supply_sanitation_africa;


-- Q1.  Write an SQL query to calculate the average water availability (liters per capita per day) for each country
SELECT country,
       ROUND(AVG(Water_Availability_liters_per_capita_per_day),3) AS 'Average water availability (liters per capita per day)'
FROM water_supply_sanitation_africa
GROUP BY country;

-- Q2. Write an SQL query to retrieve details of communities where at least one water point is non-functional
SELECT*
FROM water_supply_sanitation_africa
WHERE number_of_non_functional_water_points >=1;

-- Q3. Please retrieve the information for the top five communities with the highest annual sanitation maintenance costs
SELECT*
FROM water_supply_sanitation_africa
ORDER BY annual_maintenance_cost_usd DESC
LIMIT 5;

-- Q4. Calculate the total number of functional and non-functional water points per country
SELECT SUM(Number_of_Functional_Water_Points) AS 'Total number of functional water points',
       SUM(Number_of_Non_Functional_Water_Points) AS 'Total number of Non-functional water points'
FROM water_supply_sanitation_africa;

-- Q5. Identify communities with a high incidence of waterborne diseases (>20%)
SELECT Community_Name AS community,
	   Waterborne_Diseases_Incidence_Rate_percentage
FROM water_supply_sanitation_africa
WHERE Waterborne_Diseases_Incidence_Rate_percentage>20
ORDER BY Waterborne_Diseases_Incidence_Rate_percentage DESC;

-- Q6. Find the average distance to the water source per region
SELECT Region,
       ROUND(AVG(Average_Distance_to_Water_Source_km),3) AS 'Average distance to water source(km)'
FROM water_supply_sanitation_africa
GROUP BY Region
ORDER BY ROUND(AVG(Average_Distance_to_Water_Source_km),3) DESC;

-- Q7. List the communities that receive both government and NGO support 
SELECT DISTINCT( Community_Name) AS 'Communities that receive both government and NGO support'
FROM water_supply_sanitation_africa
WHERE Government_Support='Yes' AND NGO_Support='Yes';

-- Q8.  Identify the community with the highest population per country
SELECT Country, Community_Name, Population
FROM (
    SELECT Country, Community_Name, Population,
           RANK() OVER (PARTITION BY Country ORDER BY Population DESC) AS rnk
    FROM water_supply_sanitation_africa
) ranked
WHERE rnk = 1;


-- OTHER RESEEARCH QUESTIONS
-- 	Q1. whats the average cost of maintenance for a sanitation facility
SELECT DISTINCT Sanitation_Facility_Type,
                AVG(Annual_Maintenance_Cost_USD) AS 'Average maintenance cost'
FROM water_supply_sanitation_africa
GROUP BY Sanitation_Facility_Type;

-- 	Q2. does communities who receive both government and NGO support have less incidence of waterborne diseases (<=20%)?
SELECT DISTINCT ( Community_Name) AS 'Communities that receive both government and NGO support'
FROM water_supply_sanitation_africa
WHERE Government_Support='Yes' AND NGO_Support='Yes' AND Waterborne_Diseases_Incidence_Rate_percentage<=20 ;





