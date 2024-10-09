{{
    config(
        materialized='incremental',
        unique_key=['coachid','Year','stint'],
    )
}}

select * from HOCKEYDB.HOCKEY.COACHES 



