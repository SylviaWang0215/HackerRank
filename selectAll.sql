select * from CITY;



select * from CITY
where ID = 1661;



select * from CITY
where COUNTRYCODE = 'JPN';



select NAME from CITY
where COUNTRYCODE = 'JPN';



select CITY, STATE from STATION;



select distinct CITY from STATION
where MOD(ID, 2) = 0;



select N - M from 
(select count(CITY) as N from STATION), (select count(CITY) as M from (select distinct CITY from STATION));



select CITY, a FROM 
(select max(len) as a from (select LENGTH(CITY) as len from STATION)), (select * from STATION order by CITY)
where length(CITY) = a
and rownum <= 1
UNION
select CITY, b FROM 
(select min(len) as b from (select LENGTH(CITY) as len from STATION)), (select CITY from STATION order by CITY)
where length(CITY) = b
and rownum <= 1
;


select distinct CITY from STATION
where lower(CITY) like 'a%'
or lower(CITY) like 'e%'
or lower(CITY) like 'i%'
or lower(CITY) like 'o%'
or lower(CITY) like 'u%';


select distinct CITY from STATION
where lower(CITY) like '%a'
or lower(CITY) like '%e'
or lower(CITY) like '%i'
or lower(CITY) like '%o'
or lower(CITY) like '%u';


select distinct CITY from STATION
where substr(lower(CITY), 1, 1) in ('e', 'a', 'i', 'o', 'u') 
and substr(lower(CITY), -1) in ('e', 'a', 'i', 'o', 'u');


select distinct CITY from STATION
where substr(lower(CITY), 1, 1) not in ('e', 'a', 'i', 'o', 'u');

select distinct CITY from STATION 
where substr(lower(CITY), -1) not in ('a', 'e', 'i', 'o', 'u');


select distinct CITY from STATION 
where substr(lower(CITY), -1, 1) not in ('a', 'e', 'i', 'o', 'u')
or substr(lower(CITY), 1, 1) not in ('a', 'e', 'i', 'o', 'u');


select Name from STUDENTS
where Marks > 75
order by substr(Name, -3, 3) asc, ID asc;


select name from Employee
where salary > 2000 and months < 10
order by employee_id asc;


select COUNTRY.CONTINENT as continent, floor(avg(CITY.POPULATION)) as avg_population
from COUNTRY inner join CITY
on CITY.COUNTRYCODE = COUNTRY.CODE
group by COUNTRY.CONTINENT;


select case 
when Grade >= 8 then Name
else 'NULL' end as name, Grade, Marks from 
Students inner join Grades on Marks between Min_Mark and Max_Mark
Order by Grade desc,
case when Grade >= 8 Then Grade end desc,
case when Grade >= 8 Then Name end asc,
case when Grade < 8 then Marks end asc;


select h.hacker_id, h.name from 
(select s.hacker_id as hacker_id, count(submission_id) as sub_num 
from Submissions s, Challenges c, Difficulty d 
where s.challenge_id = c.challenge_id
and c.difficulty_level = d.difficulty_level
and s.score = d.score
group by s.hacker_id having count(submission_id) > 1) a, Hackers h
where a.hacker_id = h.hacker_id
order by sub_num desc, h.hacker_id asc;


select w.id, p.age, w.coins_needed, t.power
from
(select age, power, min(coins_needed) as min_coin from Wands w, Wands_Property p 
 where w.code = p.code and is_evil = 0 
 group by age, power) t, Wands w, Wands_Property p
where t.age = p.age
and p.code = w.code
and w.coins_needed = t.min_coin
order by t.power desc, p.age desc;



select h.hacker_id, h.name, t.count_challenge from(
select count_challenge, count(count_challenge) from
(select hacker_id, count(challenge_id) as count_challenge from Challenges group by hacker_id)
group by count_challenge
having count_challenge = max(count_challenge)
or count(count_challenge) = 1) t, (select hacker_id as hacker_id, count(challenge_id) as count_challenge from Challenges group by hacker_id) m , Hackers h
where t.count_challenge = m.count_challenge
and m.hacker_id = h.hacker_id
order by t.count_challenge desc, hacker_id;




select h.hacker_id, name, t.num from
(select num from (select num, count(num) as count_num from (select hacker_id, count(challenge_id) as num from Challenges group by hacker_id) group by num)
where num = (select max(num) from (select hacker_id, count(challenge_id) as num from Challenges group by hacker_id))
or count_num = 1) t, (select hacker_id, count(challenge_id) as num from Challenges group by hacker_id) m, Hackers h
where m.num = t.num 
and h.hacker_id = m.hacker_id
order by t.num desc, hacker_id;



select t.hacker_id, name, total_score from
(select hacker_id, sum(score) as total_score from 
(select hacker_id, challenge_id, max(score) as score from Submissions group by hacker_id, challenge_id)
group by hacker_id)t, Hackers h
where t.hacker_id = h.hacker_id
and total_score ^= 0
order by total_score desc, hacker_id asc;



select Name||'('||substr(Occupation, 1, 1)||')' as output from OCCUPATIONS order by Name;

select 'There are total '||count(Occupation)||' '||lower(Occupation)||'s.' as sentence from Occupations group by occupation order by count(Occupation) asc , occupation;




