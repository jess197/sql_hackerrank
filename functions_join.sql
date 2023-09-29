/*
You are given a table, Functions, containing two columns: X and Y.

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

 */

WITH func as (
SELECT X,Y,
ROW_NUMBER() OVER (ORDER BY X) as row_num
  FROM FUNCTIONS
    ) 
SELECT a.x, a.y
  FROM func a
 INNER JOIN func b ON a.x = b.y AND a.y = b.x
 WHERE a.x <= a.y 
   AND a.row_num < b.row_num
 ORDER BY a.x ASC