{{
    config(
        materialized='incremental',
        unique_key=['coachid','Year','stint'],
    )
}}

select * from {{ ref('Sample_table') }} where create_date > dateadd(day,-7,{{ conversion()}})
 