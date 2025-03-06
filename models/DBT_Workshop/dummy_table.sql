{{
    config(
        materialized='table'
    )
}}

{{ union (['Tablee','Tablee','Tablee']) }}

select * from Tablee

