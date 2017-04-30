select Name||'('||substr(Occupation, 1, 1)||')' as output from OCCUPATIONS order by Name;

select 'There are total '||count(Occupation)||' '||lower(Occupation)||'s.' as sentence from Occupations group by occupation order by count(Occupation) asc , occupation;
