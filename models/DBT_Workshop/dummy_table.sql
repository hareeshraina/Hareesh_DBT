{{
    config(
        materialized='table'
    )
}}

{{ generate_union (['Tablee','Tablee','Tablee']) }}

select * from Tablee

