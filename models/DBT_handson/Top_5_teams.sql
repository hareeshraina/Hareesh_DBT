{{
    config(
        materialized='table'
    )
}}

select top 5 t.name as Team_name,s.year,sum(s.g)No_of_goal
from HOCKEYDB.HOCKEY.TEAMS t join HOCKEYDB.HOCKEY.SCORING s
on t.tmid=s.tmid and t.year=s.year
where s.year=2011
group by 1,2
order by No_of_goal desc