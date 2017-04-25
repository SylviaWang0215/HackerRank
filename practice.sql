#revising the select query
select * from CITY
where COUNTRYCODE = 'USA' and POPULATION > 100000;

#type of triangle
select
case
   when (A+B)>C and (B+C)>A and (A+C)>B  
   then (case when A=B and B=C then 'Equilateral'
         when A <> B and B <> C and C <> A then 'Scalene'
         else 'Isosceles'
    end)
   else 'Not A Triangle'
end 
from TRIANGLES;