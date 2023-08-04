


  #--1 

SELECT 
    SUM(new_cases) AS total_cases,
    SUM(new_deaths) AS total_deaths,
    (SUM(new_deaths) / SUM(new_cases)) * 100 AS DeathPercentage
FROM
    `Covid.DeathsTable`
WHERE
    continent IS NOT NULL;
    
#--2 

SELECT
  location,
  SUM(total_deaths) AS TotalDeathCount 
FROM
  `Covid.DeathsTable`
WHERE
  continent IS NULL
  AND location NOT IN ('World',
    'European Union',
    'International')
  AND location NOT LIKE '%income'
GROUP BY
  location
ORDER BY
  TotalDeathCount DESC;


#--3 

SELECT
  location,
  population,
  MAX(total_cases) AS HighestInfectCount,
  MAX((total_cases/population))*100 AS InfectionRate
FROM
  `Covid.DeathsTable`
GROUP BY
  location,
  population
ORDER BY
  InfectionRate DESC;
  
  #--4
  SELECT
  location,
  population,
  date,
  MAX(total_cases) AS HighestInfectCount,
  MAX((total_cases/population))*100 AS InfectionRate
FROM
  `Covid.DeathsTable`
GROUP BY
  location,
  population,
  date
ORDER BY
  InfectionRate DESC;