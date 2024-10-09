select  t.name as Team_name,avg(s.g)No_of_goal
from HOCKEYDB.HOCKEY.TEAMS t join HOCKEYDB.HOCKEY.SCORING s
on t.tmid=s.tmid 
group by 1