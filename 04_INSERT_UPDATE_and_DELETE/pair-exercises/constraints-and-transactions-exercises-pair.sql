-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)

INSERT city (name, district, countrycode, population)
VALUES ('Smallville', 'Kansas', 'USA', 45001)

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.

INSERT countrylanguage (language, countrycode, percentage, isofficial)
VALUES ('Kryptonese', 'USA', 0.0001, 0)


-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.

UPDATE countrylanguage
	set
	language = 'Krypto-babble'
Where language = 'Kryptonese'


-- 4. Set the US captial to Smallville, Kansas in the country table.

UPDATE country
	set
	capital = 4081
Where capital = 3813


-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

DELETE city Where name = 'Smallville'

-- Did not work, id is being used in country table for capital

-- 6. Return the US captial to Washington.

UPDATE country
	set
	capital = 3813
Where capital = 4081


-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

DELETE city Where name = 'Smallville'

-- YUP!!! Because smallville's ID is no longer being used in the country table

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)

UPDATE countrylanguage 

	SET
	isofficial = ~isofficial
FROM countrylanguage cl
JOIN country co ON co.code = cl.countrycode
WHERE co.indepyear > 1800 AND co.indepyear < 1972



-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)

UPDATE city
set 
population = ROUND(population / 1000, 0)

-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to 
-- square meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)

UPDATE country 
	SET
	surfacearea = surfacearea * 1609.34
FROM country co
JOIN countrylanguage cl ON cl.countrycode = co.code
WHERE cl.language = 'French' AND cl.percentage > 20

select co.surfacearea, co.name, cl.language
from country co
JOIN countrylanguage cl ON cl.countrycode = co.code
WHERE cl.language = 'French' AND cl.percentage > 20


