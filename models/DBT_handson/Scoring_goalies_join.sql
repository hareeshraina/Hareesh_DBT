{% set table_Scoring %}
    {{ ref('stg_scoring')}}
{% endset %}

{% set table_master %}
    {{ ref('Stg_master')}}
{% endset %}

{% set Check_id %}
    m.Pl_id is not null
{% endset %}

{% set Points %}
    (select points from {{ ref('Team_pts_details') }})
{% endset %}

with scoring as 
(select * from {{ table_Scoring }})
,
goalies as 
(select playerid as id from {{ ref('stg_goalies')}}) ,
master as 
(select playerid as Pl_id from {{ table_master }})
select *, CASE
        WHEN pts > {{ Points }} THEN 'Good Team'
        Else  'Average Team'  END AS Team_remarks from goalies g join scoring s on g.id=s.playerid
join master m on m.pl_id=g.id
where {{ Check_id }}