-- Tutorials: Learn SQL step by step
##################################################################
###################################### (Lesson 0 SELECT basics)
##################################################################
# 1. Show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany';
  
# 2. Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

# 3. show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;
  
  
##################################################################
####################################### (Lesson 1 SELECT name)
##################################################################
# 1. Find the country that start with Y
SELECT name FROM world
  WHERE name LIKE 'Y%';
  
# 2. Find the countries that end with y
SELECT name FROM world
  WHERE name LIKE '%Y';

# 3. Find the countries that contain the letter x
SELECT name FROM world
  WHERE name LIKE '%X%';
  
# 4. Find the countries that end with land
SELECT name FROM world
  WHERE name LIKE '%LAND';
  
# 5. Find the countries that start with C and end with ia
SELECT name FROM world
  WHERE name LIKE 'C%' AND name LIKE '%IA';
  
# 6. Find the country that has oo in the name
SELECT name FROM world
  WHERE name LIKE '%OO%';
  
# 7. Find the countries that have three or more a in the name
SELECT name FROM world
  WHERE name LIKE '%A%A%A%';

# 8. Find the countries that have "t" as the second character.
SELECT name FROM world
 WHERE name LIKE '_T%'
ORDER BY name;

# 9. Find the countries that have two "o" characters separated by two others.
SELECT name FROM world
 WHERE name LIKE '%O__O%';
 
# 10. Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE name LIKE '____';

# 11. Find the country where the name is the capital city.
SELECT name
  FROM world
 WHERE name LIKE capital;

# 12. Find the country where the capital is the country plus "City".
SELECT name
  FROM world
 WHERE capital LIKE CONCAT(name, ' CITY');
 
# 13. Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%');

# 14. Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, ' %');

#15. Show the name and the extension where the capital is a proper (non-empty) extension of name of the country.
-- REPLACE(capital, name, '') ;- kisko/kise, kisse, kya
select name, replace(capital, name, '')
from world
WHERE capital LIKE CONCAT('%', name, ' %');

##################################################################
######################################### (2 SELECT from World)
##################################################################
# 1. show the name, continent and population of all countries.
SELECT name, continent, population FROM world;

# 2. Show the name for the countries that have a population of at least 200 million.
SELECT name FROM world
WHERE population >= 200000000;

# 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, GDP/population
FROM world
where population >= 200000000;

# 4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000
FROM world
where continent = 'South America';

# 5. Show the name and population for France, Germany, Italy
select name, population
from world
where name in ('France', 'Germany', 'Italy');

# 6. Show the countries which have a name that includes the word 'United'
select name
from world
where name like '%United%';

# 7. Show the countries that are big by area or big by population. Show name, population and area.
select name, population, area
from world
where area > 3000000 OR population > 250000000;

# 8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
select name, population, area
from world
where (area > 3000000 OR population > 250000000) AND NOT (area > 3000000 AND population > 250000000);

# 9. For Americas show population in millions and GDP in billions both to 2 decimal places.
select name, round(population/1000000, 2),round(GDP/1000000000, 2)
from world
where continent = 'South America';

# 10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.
select name, round(GDP/population, -3)
from world
where gdp >= 1000000000000;

# 11. Show the name and capital where the name and the capital have the same number of characters.
 SELECT name, capital
  FROM world
 WHERE LENGTH(name) =  LENGTH(capital);
 
# 12. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
where LEFT(name,1) like LEFT(capital,1) and name not like capital;

# 13. Find the country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%' AND
      name LIKE '%e%' AND
      name LIKE '%i%' AND
      name LIKE '%o%' AND
      name LIKE '%u%' AND
      name NOT LIKE '% %';

####################################################################
############################################ (3 SELECT from Nobel)
####################################################################
# 1. Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

# 2. Show who won the 1962 prize for literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature';

# 3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
  FROM nobel
where winner = 'Albert Einstein';

# 4. Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner
  FROM nobel
where subject = 'peace' and yr >= 2000; 

# 5. Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner
  FROM nobel
where subject = 'literature' and yr between 1980 and 1989;

# 6. Show all details of the presidential winners:Theodore Roosevelt, Thomas Woodrow Wilson, Jimmy Carter, Barack Obama
 SELECT yr, subject, winner
from nobel
where winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

# 7. Show the winners with first name John
SELECT winner
from nobel
where winner like 'john%';

# 8. Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT yr, subject, winner
from nobel
WHERE (subject = 'physics' and yr = 1980) OR (subject = 'chemistry' and yr = 1984);

# 9. Show the year, subject, and name of winners for 1980 excluding chemistry and medicine
SELECT yr, subject, winner
from nobel
WHERE yr = 1980 AND subject NOT IN ('chemistry', 'medicine');

# 10.Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT yr, subject, winner
from nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

# 11. Find all details of the prize won by PETER GRÜNBERG
SELECT yr, subject, winner
from nobel
WHERE Winner = 'PETER GRÜNBERG';

# 12. Find all details of the prize won by EUGENE O'NEILL
SELECT yr, subject, winner
from nobel
WHERE Winner = 'EUGENE O\'NEILL';

# 13. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject
from nobel
WHERE Winner LIKE 'Sir%'
ORDER BY yr DESC, winner asc;

# 14. Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984 
 ORDER BY 
CASE WHEN subject IN ('physics','chemistry') THEN 1 ELSE 0 END, Subject, winner;

###################################################################
######################################### (4 SELECT within SELECT)
###################################################################
# 1
/*List each country name where the population is larger than that of 'Russia'.*/
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

# 2.
/*Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.*/
SELECT name FROM world
WHERE GDP/population >
     (SELECT GDP/population FROM world
      WHERE name ='United Kingdom')
and continent = 'Europe';


# 3 
/*List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.*/
select name, continent
from world
where continent IN (SELECT continent
from world
where name = 'Argentina' OR name = 'Australia')
ORDER BY name;

# 4 
/* Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.*/
SELECT name, population
from world
where population >
(SELECT population
from world
where name = 'United Kingdom') and population <
(SELECT population
from world
where name = 'Germany');

# 5 
/*Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.*/
SELECT name,
  CONCAT(ROUND(100 * population / (SELECT population
                                   FROM world
                                   WHERE name = 'Germany')), '%') AS Percentage
FROM world
WHERE continent = 'Europe';


# 6
/*Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)*/
SELECT name
  FROM world
 WHERE gdp > ALL(SELECT GDP
                   FROM world
                   WHERE continent = 'Europe');
                   
# 7 
/*Find the largest country (by area) in each continent, show the continent, the name and the area:*/
# 1st method
SELECT continent, name, area
FROM world x
WHERE area = (
    SELECT MAX(area)
    FROM world y
    WHERE y.continent = x.continent
);

# 2nd method
SELECT w1.continent, w1.name, w1.area
FROM world w1
JOIN (
    SELECT continent, MAX(area) AS max_area
    FROM world
    GROUP BY continent
) w2
ON w1.continent = w2.continent AND w1.area = w2.max_area;

# 3rd method
WITH MaxAreaCTE AS (
  SELECT continent, MAX(area) AS max_area
  FROM world
  GROUP BY continent
)
SELECT w1.continent, w1.name, w1.area
FROM world w1
JOIN MaxAreaCTE w2
ON w1.continent = w2.continent AND w1.area = w2.max_area;



# 8.
/*List each continent and the name of the country that comes first alphabetically.*/

SELECT w1.continent, w1.name
FROM world w1
WHERE name = (
    SELECT MIN(w2.name)
    FROM world w2
    WHERE w1.continent = w2.continent);


# 2nd method using join
SELECT w1.continent, w1.name
FROM world w1
JOIN (
    SELECT continent, MIN(name) as alname
    FROM world
    GROUP BY continent
) w2 ON w1.continent = w2.continent AND w1.name = w2.alname;

# 3RD METHOD
SELECT continent, name FROM world x
  WHERE name <= ALL
    (SELECT name FROM world y
        WHERE y.continent = x.continent
       ORDER BY NAME);

# 9.
/*Find the continents where all countries have a population <= 25000000. 
Then find the names of the countries associated with these continents. Show name, continent and population.*/

SELECT w1.name, w1.continent, w1.population
FROM world w1
WHERE NOT EXISTS (
    SELECT 1
    FROM world w2
    WHERE w2.continent = w1.continent
    AND w2.population > 25000000
);
# "1" used as a convention to check for the existence of rows in the subquery that meet certain criteriaor constion 
# key purpose of that constant is to indicate that you're checking for the existence of rows in the subquery and not selecting any specific data to be displayed in the result.

# 2nd method 
SELECT w1.name, w1.continent, w1.population
FROM world w1
LEFT JOIN world w2 ON w1.continent = w2.continent AND w2.population > 25000000
WHERE w2.name IS NULL;


# 3rd method
SELECT w1.name, w1.continent, w1.population
FROM world w1
WHERE 25000000 >= ALL (
    SELECT w2.population
    FROM world w2
    WHERE w1.continent = w2.continent
);

#10.
/*
Some countries have populations more than three times that of all of their neighbours
 (in the same continent). Give the countries and continents.
*/
SELECT w1.name, w1.continent
FROM world w1
WHERE w1.population > 3 * (
    SELECT MAX(w2.population)
    FROM world w2
    WHERE w1.continent = w2.continent
      AND w1.name <> w2.name
);
-- In such cases it yould be ncessary to care w1.name <> w2.name


# Note : The HAVING clause should be always used with an aggregate function, like SUM, COUNT, AVG.. to filter the results of a GROUP BY query based on the result of that aggregation.
# for example 
SELECT continent, count(name)
from world
group by continent
having population >= 10000000;
# here we not aggregated population HAVING(population) >= 10000000, but population is not an aggregate function, so it will not work 

SELECT continent, count(name)
from world
group by continent
having max(population) >= 10000000;
-- this will work

-- Attention
SELECT x.name, x.continent
FROM world x
JOIN (
    SELECT continent, name, MAX(population) AS max_population
    FROM world
    GROUP BY continent
) AS y
ON x.continent = y.continent 
WHERE x.population > 3 * y.max_population AND x.name <> y.name ;
-- gisq.world.name' isn't in GROUP BY

##########
# Don't use aggregated function on the same column (itself) which you used for grouping
# 8 Avoid use aggregated function on same grouped column if they are not repeated
-- List each continent and the name of the country that comes first alphabetically. 
SELECT continent, MIN(name)
FROM world
GROUP BY continent
ORDER BY continent;

/*
ALL Keyword: ALL keyword in mysql used to compare all value from result set
ALL" is used as a comparison operator in combination with other comparison operators (such as =, >, <, >=, <=, etc.) to perform comparisons against a set of values
It's often used in subqueries to compare a value to all values returned by a subquery.
syntax:-
		value comparison_operator(such as =, >, <, >=, <=, etc.) ALL (subquery)
example: let's take a example and understand how 1st and 2nd queries could be diffrent
1. WHERE some_value > (SELECT value FROM another_table)"
2. WHERE some_value > ALL (SELECT value FROM another_table) diffrent ??

1st query "checks" if some_value is greater than at least one value from the subquery result.
2nd query "checks" if some_value is greater than all values from the subquery result.

WHERE some_value > (SELECT value FROM another_table): right side subquery returns a set of values from the another_table.
 The main query then compares some_value to "each individual value" in the result set of the subquery.
 The condition is true if some_value is greater than at least one of the values returned by the subquery.

If some_value is greater than any single value from the subquery result, the condition is satisfied, and the row is included in the result.
If some_value is not greater than any value from the subquery result, the condition is not satisfied, and the row is excluded from the result.

WHERE some_value > ALL (SELECT value FROM another_table): right side subquery returns a set of values from the another_table.
 The main query then compares some_value to all the values in the result set of the subquery.
 The condition is considered true only if some_value is "greater" than "every" single value in the subquery result.
The condition is satisfied only if some_value is greater than every value from the subquery result.
 If it fails to be greater than any single value, the condition is not satisfied, and the row is excluded from the result.
 
*/

######################################################################
################################################# (Nested SELECT Quiz)
#######################################################################
# 1. Select the code that shows the name, region and population of the smallest country in each region 
SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0);

#2 . Select the code that shows the countries belonging to regions with """all""" populations over 50000
 SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0);
 
#3. Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name);
 
 #4.Select the result that would be obtained from the following code:
 SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom');
         
#5. Select the code that would show the countries with a greater GDP than """"any"""" country in Africa (some countries may have NULL gdp values).
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa');
 
 
 #6. Select the code that shows the countries with population smaller than Russia but bigger than Denmark
 SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark');


#7. >Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population > ALL
       (SELECT MAX(population)
          FROM bbc
         WHERE region = 'Europe')
   AND region = 'South Asia';


##########################################################################
###################################################### (5 SUM and COUNT)
##########################################################################
# 1.Show the total population of the world.
SELECT SUM(population)
FROM world;

#2.List all the continents - just once each.
SELECT DISTINCT continent
FROM world;

# 3.Give the total GDP of Africa
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

# 4.How many countries have an area of at least 1000000
SELECT COUNT(area)
FROM world
WHERE area >= 1000000;

# 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

# 6. For each continent show the continent and number of countries. 
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

# 7. For each continent show the continent and number of countries with populations of at least 10 million.
-- 1ST method
SELECT continent, COUNT(name) AS num_countries
FROM world
GROUP BY continent
HAVING MIN(population) >= 10000000;

-- 2nd method more faster and efficient
SELECT continent, COUNT(name) AS num_countries
FROM world
WHERE population >= 10000000
GROUP BY continent;

# 8. List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;

################################################################################
# ----------------------------------------------------------------------- #
# ---------------------------------# (# Nobel Prizes: Aggregate functions)
# The nobel table can be used to practice more SUM and COUNT functions.

# 1.Show the total number of prizes awarded. 
SELECT COUNT(winner) FROM nobel ;

# 2.List each subject - just once 
SELECT DISTINCT subject
FROM nobel ;

# Or
SELECT subject
FROM nobel
GROUP BY subject ;

# 3.Show the total number of prizes awarded for Physics. 
SELECT COUNT(winner)
FROM nobel
WHERE subject = 'Physics' ;

# 4.For each subject show the subject and the number of prizes. 
SELECT subject, COUNT(winner)
FROM nobel
GROUP BY subject;

# 5.For each subject show the first year that the prize was awarded.
SELECT subject, yr
FROM nobel
GROUP BY subject
HAVING MIN(yr) ;

# 6.For each subject show the number of prizes awarded in the year 2000. 
SELECT subject, COUNT(winner)
FROM nobel
WHERE yr = 2000
GROUP BY subject;

# 7.Show the number of different winners for each subject. Be aware that Frederick Sanger has won the chemistry prize twice - he should only be counted once.
SELECT subject, COUNT(DISTINCT winner)
FROM nobel
GROUP BY subject ;

# 8.For each subject show how many years have had prizes awarded. 
SELECT subject, COUNT(DISTINCT yr)
FROM nobel
GROUP BY subject ;

# 9.Show the years in which three prizes were given for Physics.
SELECT yr
FROM nobel
WHERE subject = 'Physics'
GROUP BY yr
HAVING COUNT(winner) = 3;

# 10. Show winners who have won more than once. 
SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(winner) > 1;

# 11. Show winners who have won more than one subject. 
SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(DISTINCT subject) > 1;

# 12. Show winners who have won more than one subject. 
SELECT yr, subject
FROM nobel
WHERE yr >= 2000
GROUP BY yr, subject
HAVING COUNT(winner) = 3;



###############################################################
###############################################################
################################################# (6 JOIN)
##############################################################

/* 1.show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER' */
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';
  
/* 2.Show id, stadium, team1, team2 for just game 1012 */
SELECT id,stadium,team1,team2
  FROM game G
WHERE ID = 1012;

/* 3.show the player, teamid, stadium and mdate for every German goal. */
SELECT player, teamid, stadium, mdate
  FROM game
JOIN goal ON (game.id=goal.matchid)
WHERE teamid = 'GER';

/* 4.Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%' */
SELECT team1, team2, player
  FROM game
JOIN goal ON (game.id=goal.matchid)
WHERE player LIKE 'Mario%';

/* 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10 */
SELECT player, teamid, coach, gtime
  FROM goal
JOIN eteam 
  ON goal.teamid=eteam.id
WHERE gtime <=10;

/* 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach. */
SELECT mdate, teamname
  FROM game
JOIN eteam ON (team1=eteam.id) 
WHERE coach = 'Fernando Santos';

/* 7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw' */
SELECT player
  FROM game
JOIN goal ON (game.id=goal.matchid) 
WHERE stadium = 'National Stadium, Warsaw';

/* 8.Instead show the name of all players who scored a goal against Germany. */
SELECT DISTINCT Player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1 ='GER' OR team2 ='GER') AND teamid != 'GER';
    
/* 9.Show teamname and the total number of goals scored. */
SELECT teamname, COUNT(gtime)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
 ORDER BY teamname;

/* 10. Show the stadium and the number of goals scored in each stadium. */
SELECT stadium, count(gtime)
FROM game
JOIN goal on id = matchid
GROUP BY stadium;

/* 11. Show the stadium and the number of goals scored in each stadium. */
SELECT matchid, mdate, COUNT(gtime)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid;

/* 12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'. */
SELECT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
GROUP BY matchid;

/* 13.List every match with the goals scored by each team as shown. */
SELECT mdate,
       team1,
       IFNULL(SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END), 0) AS score1,
       team2,
       IFNULL(SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END),0) AS score2
FROM game
LEFT JOIN goal ON matchid = id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;

/* Quiz */
#. Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'));
   
################################################################################
# ----------------------------------------------------------------------- #
# ----------------------------------------------- # (#Old JOIN Tutorial)

# 1.Show the athelete (who) and the country name for medal winners in 2000. 
SELECT who, country.name
  FROM ttms JOIN country
         ON (ttms.country=country.id)
 WHERE games = 2000;
 
# 2.Show the who and the color of the medal for the medal winners from 'Sweden'. 
SELECT who, color
 FROM ttms
JOIN country ON ttms.country = country.id
WHERE country.name = 'Sweden';

# 3.Show the years in which 'China' won a 'gold' medal 
SELECT games
 FROM ttms
JOIN country ON ttms.country = country.id
WHERE country.name = 'china' and color = 'gold';

# 4.Show who won medals in the 'Barcelona' games. 
SELECT who
  FROM ttws JOIN games
            ON (ttws.games=games.yr)
  WHERE city = 'Barcelona';
  
# 5.Show which city 'Jing Chen' won medals. Show the city and the medal color. 
SELECT games.city, color
  FROM ttws JOIN games
            ON (ttws.games=games.yr)
  WHERE who = 'Jing Chen';

# 6.Show who won the gold medal and the city. */
SELECT ttws.who, games.city
  FROM ttws JOIN games
            ON (ttws.games=games.yr)
  WHERE color = 'gold' ;

# 7.Show the games and color of the medal won by the team that includes 'Yan Sen'. 
SELECT games, color
FROM ttmd join team on ttmd.team = team.id
WHERE team.name = 'Yan Sen' ;

# 8. Show the 'gold' medal winners in 2004. 
SELECT team.name
FROM ttmd join team on ttmd.team = team.id
WHERE ttmd.games = 2004 and ttmd.color = 'gold' ;

# 9. Show the name of each medal winner country 'FRA'.
SELECT team.name
FROM ttmd join team on ttmd.team = team.id
WHERE ttmd.country = 'FRA' ;


################################################################################
# ----------------------------------------------------------------------- #
# ----------------------------------------------- # (Music Tutorial)
# 1. Find the title and artist who recorded the song 'Alison'.
SELECT album.title, album.artist
  FROM album JOIN track
         ON (album.asin=track.album)
 WHERE song = 'Alison' ;
 
 # 2. Which artist recorded the song 'Exodus'.
 SELECT  album.artist
  FROM album JOIN track
         ON (album.asin=track.album)
 WHERE song = 'Exodus' ;
 
  # 3. Show the song for each track on the album 'Blur'
select song
FROM album JOIN track
         ON (album.asin=track.album)
where album.title = 'Blur' ;

# 4. For each album show the title and the total number of track.
SELECT album.title, COUNT(*)
  FROM album JOIN track ON (asin=album)
 GROUP BY album.title ;
 
# 5.For each album show the title and the total number of tracks containing the word 'Heart' (albums with no such tracks need not be shown).
select album.title, count(track.song)
 from album JOIN track ON (asin=album)
WHERE track.song LIKE '%Heart%'
GROUP BY album.title ;

# 6.A "title track" is where the song is the same as the title. Find the title tracks.
select track.song
 from album JOIN track ON (asin=album)
WHERE track.song LIKE album.title ;

# 7 An "eponymous" album is one where the title is the same as the artist (for example the album 'Blur' by the band 'Blur'). Show the eponymous albums.
select DISTINCT album.title
 from album JOIN track ON (asin=album)
WHERE album.title LIKE album.artist;

# Or
select DISTINCT title
 from album
WHERE title LIKE artist ;

# 8 An "eponymous" album is one where the title is the same as the artist (for example the album 'Blur' by the band 'Blur'). Show the eponymous albums.
select track.song, COUNT(DISTINCT album.title)
 from album JOIN track ON (asin=album)
GROUP BY track.song
HAVING COUNT(DISTINCT album.title) > 2 ;

# 9 A "good value" album is one where the price per track is less than 50 pence. Find the good value album - show the title, the price and the number of tracks.


#######################################################################
############################################# (7 More JOIN operations)
#######################################################################

/*1.  List the films where the yr is 1962 [Show id, title] */
SELECT id, title
 FROM movie
 WHERE yr=1962;
 
/*2. Give year of 'Citizen Kane'. */
SELECT yr
 FROM movie
 WHERE title = 'Citizen Kane';
 
/* 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. */
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

/* 4.What id number does the actor 'Glenn Close' have? */
SELECT id
FROM actor
WHERE name = 'Glenn Close';

/* 5.What is the id of the film 'Casablanca' */
SELECT id
FROM movie
WHERE title = 'Casablanca';

/* 6.Obtain the cast list for 'Casablanca'. */
SELECT name
FROM actor
JOIN casting 
  ON actor.id = casting.actorid
WHERE movieid=11768;

/* 7.Obtain the cast list for the film 'Alien'. */
SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movie.title = 'Alien';

/* 8. List the films in which 'Harrison Ford' has appeared */
SELECT title
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford';

/* 9. List the films where 'Harrison Ford' has appeared - but not in the starring role.
 [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] */
SELECT title
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE name = 'Harrison Ford' AND ord <> 1;

/* 10. List the films together with the leading star for all 1962 films. */
SELECT title, name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE yr = 1962 AND ord = 1;

/* 11. Which were the busiest years for 'Rock Hudson',
 show the year and the number of movies he made each year for any year in which he made more than 2 movies. */
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

/* 12.List the film title and the leading actor for all of the films 'Julie Andrews' played in. */
SELECT m.title AS film_title, a.name AS leading_actor
FROM movie AS m
JOIN casting AS c ON m.id = c.movieid
JOIN actor AS a ON c.actorid = a.id
WHERE m.id IN (
    SELECT DISTINCT movieid
    FROM casting
    WHERE actorid = (SELECT id FROM actor WHERE name = 'Julie Andrews')
) AND c.ord = 1;


/* 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles. */
SELECT a.name
FROM actor a
JOIN casting c ON a.id = c.actorid
WHERE c.ord = 1
GROUP BY a.name
HAVING COUNT(c.ord) >= 15
ORDER BY a.name;

/* 14 List the films released in the year 1978 ordered by the number of actors in the cast, then by title. */
SELECT m.title, COUNT(c.actorid) AS actor_count
FROM movie m
JOIN casting c ON m.id = c.movieid
WHERE m.yr = 1978
GROUP BY m.title
ORDER BY actor_count DESC, m.title;

/* 15 List the films released in the year 1978 ordered by the number of actors in the cast, then by title. */
SELECT m.title, COUNT(c.actorid) AS actor_count
FROM movie m
JOIN casting c ON m.id = c.movieid
WHERE m.yr = 1978
GROUP BY m.title
ORDER BY actor_count DESC, m.title;

/* 15 List all the people who have worked with 'Art Garfunkel' */
SELECT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid IN (
    SELECT casting.movieid
    FROM actor
    JOIN casting ON actor.id = casting.actorid
    WHERE actor.name = 'Art Garfunkel'
)
AND actor.name <> 'Art Garfunkel';   # Notes often we forget to exclude such result


####################################################################
################################################### ( 8 Using Null )
####################################################################


/* 1.List the teachers who have NULL for their department */
SELECT teacher.name
 FROM teacher
LEFT join dept ON teacher.dept = dept.id
where teacher.dept IS null;

/* 2.the teachers with no department and the departments with no teacher.*/
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id);
           
/* 3.Use a different JOIN so that all teachers are listed.*/
SELECT teacher.name, dept.name
 FROM teacher LEFT OUTER JOIN dept
           ON (teacher.dept=dept.id);
           
/* 4.Use a different JOIN so that all teachers are listed.*/
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id);
           
/* 5.Show teacher name and mobile number or '07986 444 2266'.*/
SELECT name, COALESCE(mobile,  '07986 444 2266')
FROM teacher ;

/* 6.Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.*/
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT OUTER JOIN dept
 ON teacher.dept = dept.id;

/* 7.Use COUNT to show the number of teachers and the number of mobile phones....*/
SELECT COUNT(name), COUNT(mobile)
FROM teacher;

/* 8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed. */
SELECT dept.name, COUNT(teacher.name)
FROM dept
LEFT OUTER JOIN teacher
 ON teacher.dept = dept.id
GROUP BY dept.name;

/* 9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise. */
SELECT  
  name,
  CASE 
    WHEN dept IN (1,2) THEN 'Sci'
    ELSE 'Art' 
  END AS name
FROM teacher;

/* 10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise... */
SELECT  
  name,
  CASE 
    WHEN dept IN (1,2) THEN 'Sci'
    WHEN dept = 3  THEN 'Art'
    ELSE 'None'
  END AS name
FROM teacher;

################################################################################
# ----------------------------------------------------------------------- #
# ---------------------------------------------# (# Scottish Parliament)
# Dealing with NULL

/*

*/

/* 1.One MSP was kicked out of the Labour party and has no party. Find him. */
SELECT name
FROM msp
WHERE Party IS NULL ;

/* Obtain a list of all parties and leaders. */
SELECT name, leader
FROM party;

/* 3.Give the party and the leader for the parties which have leaders. */
SELECT name, leader
FROM party
WHERE leader IS NOT NULL;

/* 4.Obtain a list of all parties which have at least one MSP. */
SELECT DISTINCT party.name
FROM msp
JOIN party ON msp.party = party.code ;

# Outer JOIN 
/* 5. Obtain a list of all MSPs by name, give the name of the MSP and the name of the party where available.
 Be sure that Canavan MSP, Dennis is in the list. Use ORDER BY msp.name to sort your output by MSP. */
SELECT msp.name, party.name
FROM msp
LEFT JOIN party ON  msp.Party = party.Code
ORDER BY msp.name ;

/* 6. Obtain a list of parties which have MSPs, include the number of MSPs. */
SELECT party.name, COUNT(msp.name)
FROM msp
JOIN party ON  msp.Party = party.Code
GROUP BY party.name ;

/* 7.A list of parties with the number of MSPs; include parties with no MSPs. */
SELECT party.name, COUNT(msp.name)
FROM msp
RIGHT JOIN party ON  msp.Party = party.Code
GROUP BY party.name ;




# --------------------------------------------------------------------#
# ---------------------------------------------------------------#
#################################################### (Self JOIN)
/*
stops(id, name)
route(num, company, pos, stop)
*/

/* 1. How many stops are in the database. */
#1st method
SELECT COUNT(DISTINCT stop) FROM route;


/* 2. Find the id value for the stop 'Craiglockhart' */
SELECT DISTINCT id
FROM route
JOIN stops
 ON route.num = stops.id
WHERE stops.name = 'Craiglockhart';

/* 3. Give the id and the name for the stops on the '4' 'LRT' service. */
SELECT stops.id, stops.name
FROM stops
JOIN route ON stops.id = route.stop
WHERE route.num = '4' AND route.company = 'LRT';

/* 4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53).
 Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes. */
 SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

/* 5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart,
 without changing routes. Change the query so that it shows the services from Craiglockhart to London Road. */
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop= 53 AND b.stop = 149 ;

/* 6. The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number.
 Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross' */
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road' ;

 
/* 7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith') */
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop= 115 AND b.stop = 137 ;


/* 8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross' */
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'Tollcross';

 
# --------------------------------------------------------------------#
# ---------------------------------------------------------------#
########################################### (Self JOIN QUIZ)
# 1. Select the code that would show it is possible to get from Craiglockhart to Haymarket
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket' ;
 
# 2. Select the code that shows the stops that are on route.num '2A' which can be reached with one bus from Haymarket?
 SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A' ;
   
# 3. Select the code that shows the services available from Tollcross?
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross' ;
 

 
####################################################################
###############################################################
#################################### ( 8+ Numeric Examples )



####################################################################
###############################################################
#################################### (9-Window functions)
/*1. Show the lastName, party and votes for the constituency 'S14000024' in 2017. */
SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC;

/* 2. Show the party and RANK for constituency S14000024 in 2017. List the output by party */
SELECT
    party,
    RANK() OVER (PARTITION BY constituency, yr ORDER BY votes DESC) AS candidate_rank
FROM ge 
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party;


/* 3. Use PARTITION to show the ranking of each party in S14000021 in each year. Include yr, party, votes and ranking (the party with the most votes is 1).*/
SELECT
    yr,
    party,
    votes,
    RANK() OVER (PARTITION BY yr ORDER BY votes DESC) AS party_rank
FROM ge
WHERE constituency = 'S14000021'
ORDER BY yr, party_rank;


/* 4. Use PARTITION BY constituency to show the ranking of each party in Edinburgh in 2017. Order your results so the winners are shown first, then ordered by constituency. */
SELECT constituency,
       party,
       votes,
       RANK() OVER (PARTITION BY constituency and ORDER BY votes DESC) as rn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026' AND yr  = 2017
ORDER BY party_rank, constituency;

/* 5.Show the parties that won for each Edinburgh constituency in 2017. */
SELECT
    yr,
    constituency,
    party
FROM (
    SELECT
        yr,
        constituency,
        party,
        RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS party_rank
    FROM ge
    WHERE yr = 2017 AND constituency BETWEEN 'S14000021' AND 'S14000026') AS ranked_data
WHERE party_rank = 1;

/* 6 Show how many seats for each party in Scotland in 2017. */
SELECT
    party,
    COUNT(*) AS seats
FROM ge
WHERE yr = 2017 AND constituency LIKE 'S%'
GROUP BY party;

####################################################################
###############################################################
#################################### (9+ COVID 19)
#  Window Function The SQL Window functions include LAG, LEAD, RANK and NTILE. These functions operate over a "window" of rows - typically these are rows in the table that are in some sense adjacent.
/* 1.show data from Spain */
SELECT name, DAY(whn),
 confirmed, deaths, recovered
 FROM covid
WHERE name = 'Spain' AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn ;

/*
 The LAG function is used to show data from the preceding row or the table. When lining up rows the data is partitioned
 by country name and ordered by the data whn. That means that only data from Italy is considered.
 
 2.Modify the query to show confirmed for the day before.
 */
SELECT name, DAY(whn), confirmed,
   LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn ;

/* 3. Show the number of new cases for each day, for Italy, for March. */
SELECT name,
       DAY(whn),
       confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS conf
FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn ;

/* 4. Show the number of new cases in Italy for each week in 2020 - show Monday only. */
SELECT name,
 DATE_FORMAT(whn,'%Y-%m-%d'),
 confirmed - LAG(confirmed) OVER (Partition BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND WEEKDAY(whn) = 0 AND YEAR(whn) = 2020
ORDER BY whn ;

/* 5. 


/* 6. Add a column to show the ranking for the number of deaths due to COVID.. */
SELECT 
   name,
   confirmed,
   RANK() OVER (ORDER BY confirmed DESC) rc1,
   deaths,
   RANK() OVER (ORDER BY deaths DESC) rc2
  FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC ;

/* 7. Infection rate
Add a column to show the ranking for the number of deaths due to COVID..
Show the infection rate ranking for each country. Only include countries with a population of at least 10 million.  */
SELECT 
   world.name,
   ROUND(100000*confirmed/population,2),
   RANK() OVER (Partition By YEAR(whn) ORDER BY (100000*confirmed/population))
  FROM covid JOIN world ON covid.name=world.name
WHERE whn = '2020-04-20' AND population > 10000000
ORDER BY population DESC ; 


/* 8. Turning the corner
For each country that has had at last 1000 new cases in a single day, show the date of the peak number of new cases. */