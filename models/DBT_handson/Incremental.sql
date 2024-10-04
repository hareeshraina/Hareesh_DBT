{{
    config(
        materialized='incremental',
        unique_key=('playerid')
    )
}}

select * from training.dbt_HSuresh.master 



