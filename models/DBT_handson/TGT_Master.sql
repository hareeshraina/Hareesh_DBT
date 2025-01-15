{{ config (
    materialized= 'table',
    alias='New_Table'
)
     }}

select 'a' as atom ,* from {{ ref('Stg_master') }}