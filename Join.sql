select s.name from 
(students s left join friends f on s.id = f.id left join packages p1 on p1.id = s.id left join packages p2 on p2.id = f.friend_id)
where p2.salary > p1.salary
order by p2.salary;



select x, y from functions f1
    where exists(select * from functions f2 where f2.y=f1.x
    and f2.x=f1.y and f2.x>f1.x) and (x!=y)
union
select x, y from functions f1 where x=y and
    ((select count(*) from functions where x=f1.x and y=f1.x)>1)
order by x;