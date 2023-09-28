/* SQL Query to check if a City name begins and ends with a vowel  

Exercise

Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, 
and u) as both their first and last characters. Your result cannot contain duplicates.
*/

SELECT DISTINCT city
  FROM STATION
  where LEFT(city,1) in ('a','e','i','o','u')
    and RIGHT(city,1) in ('a','e','i','o','u')

