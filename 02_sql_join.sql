# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
select * from world.city where Name like ("ping%") order by population; 
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM world.city where name like ("ran%") order by Population desc;
#
#
# 3: Count all cities
select count(id) from world.city;
#
# 4: Get the average population of all cities
select avg (population) from world.city;
#
#
# 5: Get the biggest population found in any of the cities
select max(Population) from world.city; 
#
#
# 6: Get the smallest population found in any of the cities
select min(Population) from world.city;
#
#
# 7: Sum the population of all cities with a population below 10000
select sum(population) from world.city where population < 10000;
#
#
# 8: Count the cities with the countrycodes MOZ and VNM
select count(*) from world.city where CountryCode in ('MOZ', 'VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
select CountryCode, count(*) from world.city where countrycode in ('MOZ', 'VNM') group by CountryCode; 
#
# 10: Get average population of cities in MOZ and VNM
select countrycode, avg(population) from world.city where CountryCode in ('MOZ', 'VNM') group by CountryCode;
#
#
# 11: Get the countrycodes with more than 200 cities
SELECT city.CountryCode,count(CountryCode) AS CityCount 
FROM world.city 
#JOIN country 
#ON City.CountryCode=country.Code 
GROUP BY city.CountryCode 
HAVING CityCount>200; 

#
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
select city.countrycode, count(*) as citycount from world.city group by CountryCode having citycount > 200 order by citycount desc; 
#
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT city.name, language
FROM world.city
JOIN world.countrylanguage  
WHERE population BETWEEN 400 AND 500 limit 1;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT city.name, language 
FROM world.city
JOIN world.countrylanguage  
WHERE population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
select city.name 
from world.city 
where Population = 122199
or (CountryCode IN (SELECT CountryCode FROM world.city WHERE population = 122199));
#

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
select city.name 
from world.city 
where CountryCode = (select CountryCode FROM world.city WHERE population = 122199)
and population != 122199;

# 17: What are the city names in the country where Luanda is capital?
select city.name, Capital
from world.city
JOIN world.country  
where Code = (select Code from world.country where Capital = "Luanda");

#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT capital, Region
FROM world.country
JOIN region  ON world.country = region
WHERE region = (SELECT region FROM world.country WHERE city.name = 'Yaren');

#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
select language, Region
from world.countrylanguage
join world.country
join region 
WHERE region = (SELECT region FROM cities WHERE city.name = 'Riga');

#
# 20: Get the name of the most populous city
select city.name
from world.city
order by Population desc
limit 1;
#
