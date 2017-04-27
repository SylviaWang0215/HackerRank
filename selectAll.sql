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


