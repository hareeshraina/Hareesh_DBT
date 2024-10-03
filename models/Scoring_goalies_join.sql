with scoring as 
(select * from {{ ref('stg_goalies')}})
,
goalies as 
(select * from {{ ref('stg_scoring')}})
select * from goalies g join scoring s using (playerid)