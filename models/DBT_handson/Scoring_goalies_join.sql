with scoring as 
(select * from {{ ref('stg_goalies')}})
,
goalies as 
(select playerid as id from {{ ref('stg_scoring')}}),
master as 
(select playerid as Pl_id from {{ ref('Stg_master')}})
select * from goalies g join scoring s on g.id=s.playerid
join master m on m.pl_id=g.id