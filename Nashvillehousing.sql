create database Nashville;

#Active database
USE Nashville;

#call the columns to understand 
SELECT *
FROM nashville_housing_data_2013_2016
;

SELECT distinct `Land Use`
FROM nashville_housing_data_2013_2016
;

-- This code will select landuse and aggregate soldAsVacant to know 
-- the number sold as vacant and it will give a condition to confirm only the once sold(Yes).
-- sorting the highest number on top
SELECT `Land Use`,  count(`Sold As Vacant`) As NumberSold
FROM nashville_housing_data_2013_2016
where `Sold As Vacant` = 'Yes' 
group by `Land Use`
order by NumberSold Desc;
 
select `Land Use`,count(`Sold As Vacant`) As NumberSold
FROM nashville_housing_data_2013_2016
where `Sold As Vacant` = 'No' 
group by `Land Use`
order by NumberSold Desc;

-- This code uses 'with' to join two queries 
/* the first query (This code will select landuse and aggregate soldAsVacant to know 
-- the number sold as vacant and it will give a condition to confirm only the once sold(Yes).
-- sorting the highest number on top*/ 
WITH group1 AS (
  SELECT `Land Use`,  count(`Sold As Vacant`) As YesSold
FROM nashville_housing_data_2013_2016
where `Sold As Vacant` = 'Yes' 
group by `Land Use`
order by YesSold Desc
),
/* the second query (This code will select landuse and aggregate soldAsVacant to know 
-- the number sold as not vacant and it will give a condition to confirm only the once sold(No).
-- sorting the highest number on top*/ 
group2 AS (
  select count(`Sold As Vacant`) As NotSoldAsVacant, `Land Use` As LandUse
FROM nashville_housing_data_2013_2016
where `Sold As Vacant` = 'No' 
group by landUse
order by NotSoldAsVacant Desc
)
-- select all the columns from the above SQL and join them
SELECT *
  FROM group1
  JOIN group2 
  ON group1.`Land Use` = group2.LandUse;
  
SELECT `Land Use`, Bedrooms, `Full Bath`,`Half Bath`, `Sale Price`
FROM nashville_housing_data_2013_2016
WHERE `Land Use`= 'Single family' and bedrooms >= 1
order by 5 desc;
  
 SELECT `Land Use`, Bedrooms, `Full Bath`,`Half Bath`, `Sale Price`
FROM nashville_housing_data_2013_2016
WHERE `Land Use`= 'Residential condo' 
order by 5 desc;

SELECT `Land Use`, Bedrooms, `Full Bath`,`Half Bath`, `Sale Price`
FROM nashville_housing_data_2013_2016
WHERE `Land Use`= 'vacant res land' and bedrooms >= 1
order by 5 desc;

 SELECT `Land Use`, Bedrooms, `Full Bath`,`Half Bath`, `Sale Price`
FROM nashville_housing_data_2013_2016
WHERE `Land Use`= 'duplex' and bedrooms >= 1
order by 5 desc;

SELECT `Land Use`, Bedrooms, `Full Bath`,`Half Bath`, `Sale Price`
FROM nashville_housing_data_2013_2016
WHERE `Land Use`= 'zero lot line' and bedrooms >= 1
order by 5 desc;


  -- This Code outputs the sale price of a bedroom when the exterior wall is Brick
  SELECT `Sale Price`, Bedrooms
  FROM nashville_housing_data_2013_2016
  WHERE `Exterior Wall`= 'BRICK'
  ORDER BY `Sale Price`DESC;
  
  -- This Code outputs the sale price of a bedroom when the exterior wall is frame
  SELECT `Sale Price`, Bedrooms
  FROM nashville_housing_data_2013_2016
  WHERE `Exterior Wall`= 'frame'
  ORDER BY `Sale Price`DESC;

-- create a View
CREATE VIEW Nashvillahouse_soldasvacant AS
WITH group1 AS (
  SELECT `Land Use`,  count(`Sold As Vacant`) As YesSold
FROM nashville_housing_data_2013_2016
where `Sold As Vacant` = 'Yes' 
group by `Land Use`
order by YesSold Desc
),
/* the second query (This code will select landuse and aggregate soldAsVacant to know 
-- the number sold as not vacant and it will give a condition to confirm only the once sold(No).
-- sorting the highest number on top*/ 
group2 AS (
  select count(`Sold As Vacant`) As NotSoldAsVacant, `Land Use` As LandUse
FROM nashville_housing_data_2013_2016
where `Sold As Vacant` = 'No' 
group by LandUse
order by NotSoldAsVacant Desc
)
-- select all the columns from the above SQL and join them
SELECT *
  FROM group1
  JOIN group2 
  ON group1.`Land Use` = group2.LandUse;
  
  
  Error Code: 1060. Duplicate column name 'Land Use'
