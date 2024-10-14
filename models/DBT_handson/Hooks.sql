{{
    config(
        materialized='incremental',
        unique_key=['coachid','Year','stint'],
        pre_hook=[
        "DELETE FROM {{ this }} WHERE Year = 1952 "  ],
        post_hook=[
        "INSERT INTO TRAINING.DBT_HSURESH.Run_details ( run_time,ran_by) VALUES ( CURRENT_TIMESTAMP,'Hareesh')"
    ]
    )
}}

select * from {{ ref('Sample_table') }} where create_date > dateadd(day,-7,{{ conversion()}})
 