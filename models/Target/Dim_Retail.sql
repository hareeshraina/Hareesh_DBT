{{
    config(
        materialized='table',
        tags=["Extl_tgt"]
    )
}}

select * from {{ ref('int_Retail') }}