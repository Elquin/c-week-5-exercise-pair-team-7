-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
-- (36 rows)
SELECT c.name AS 'City', co.name AS 'Country', c.population AS 'Population'
FROM country co
JOIN city c ON c.countrycode = co.code
WHERE c.population > 1000000 AND co.continent = 'Europe'

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)
SELECT c.name AS 'City', co.name AS 'Country', c.population AS 'Population'
FROM country co
JOIN city c ON c.countrycode = co.code
JOIN countrylanguage cl ON cl.countrycode = co.code
WHERE language = 'French' AND isofficial = 1 AND c.population > 1000000

-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)
SELECT co.name AS 'Country', co.continent AS 'Continent'
FROM country co
JOIN countrylanguage cl ON cl.countrycode = co.code
WHERE language = 'Javanese'

-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)
SELECT co.name AS 'Country'
FROM country co
JOIN countrylanguage cl ON cl.countrycode = co.code
WHERE  co.continent = 'Africa' AND cl.language = 'French' AND cl.isofficial = 1

-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)
SELECT AVG(c.population) AS 'Avg pop'
FROM city c
JOIN country co ON c.countrycode = co.code
WHERE co.continent = 'Europe'

-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)
SELECT AVG(c.population) AS 'Avg pop'
FROM city c
JOIN country co ON c.countrycode = co.code
WHERE co.continent = 'Asia'

-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)
SELECT count(*) AS 'English Cities'
FROM city c
JOIN country co ON c.countrycode = co.code
JOIN countrylanguage cl on cl.countrycode = co.code
WHERE cl.language = 'English' AND cl.isofficial = 1

-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)
SELECT AVG(c.population)
FROM city c
JOIN country co ON c.countrycode = co.code
JOIN countrylanguage cl on cl.countrycode = co.code
WHERE cl.language = 'English' AND cl.isofficial = 1

-- 9. The names of all of the continents and the population of the continent’s largest city
-- (6 rows, largest population for North America: 8,591,309)
SELECT DISTINCT(co.continent), MAX(c.population)
FROM country co
JOIN city c ON c.countrycode = co.code
GROUP BY co.continent


-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
-- (29 rows)
SELECT c.name AS 'City', cl.language AS 'Official Language'
FROM city c
JOIN country co ON c.countrycode = co.code
JOIN countrylanguage cl ON cl.countrycode = co.code
WHERE co.continent = 'South America' AND c.population > 1000000 AND cl.isofficial = 1