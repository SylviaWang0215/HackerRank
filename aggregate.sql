select count(id) from city
where population > 100000;


select sum(population) from city
where lower(district) = 'california';


select avg(population) from city
where lower(district) = 'california';


select ceil(avg(salary) - avg(replace(salary, '0', ''))) from employees;


select total, count(total) from (
select employee_id, months*salary as total from employee, (select max(months*salary) as total from employee)
where months*salary = total)
group by total;


select round(sum(lat_n), 4) from station
where lat_n between 38.7880 and 137.2345;


select round(long_w, 4) from station
where lat_n = (select max(lat_n) from station where lat_n < 137.2345);