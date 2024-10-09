select playerid,
coachid,
hofid,
firstname,
lastname,
height,
weight,
dbt_scd_id,
dbt_updated_at,
dbt_valid_from,
dbt_valid_to,
{{ conversion()  }} as create_date ,
{{ Flag('dbt_valid_to') }} as flag,
 from TRAINING.DBT_HSURESH.HAREESH_SNAPSHOT




