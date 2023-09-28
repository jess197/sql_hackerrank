/*You are given three tables: Students, Friends and Packages. 
Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend).
Packages contains two columns: ID and Salary (offered salary in $ thousands per month). 

Write a query to output the names of those students whose best friends got offered a higher salary than them.
Names must be ordered by the salary amount offered to the best friends. 
It is guaranteed that no two students got same salary offer.

*/

with salary_friend as ( 
SELECT f.id as student_id 
     , p.salary
  FROM friends f 
  JOIN packages p on p.id = f.friend_id 
)
SELECT name
  FROM students s 
  JOIN packages p on p.id = s.id
  JOIN salary_friend sf on s.id = sf.student_id
  WHERE sf.salary > p.salary 
  order by sf.salary 

/* I used a CTE, and what is a CTE? 
A common table expression, or CTE, is a temporary named result set created from a 
simple SELECT statement that can be used in a subsequent SELECT statement.

It's like a subquery (have their differences), but much more organized.
 */