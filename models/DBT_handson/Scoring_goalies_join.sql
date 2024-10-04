with scoring as 
(select * from {{ ref('stg_goalies')}})
,
goalies as 
(select playerid as id from {{ ref('stg_scoring')}})
select * from goalies g join scoring s on g.id=s.playerid