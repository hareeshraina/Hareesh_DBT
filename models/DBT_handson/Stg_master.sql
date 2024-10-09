select playerid,concat(substring(firstname,1,1),lastname) as name,height,weight,birthyear from {{ source('DBT_Sources', 'MASTER') }}
