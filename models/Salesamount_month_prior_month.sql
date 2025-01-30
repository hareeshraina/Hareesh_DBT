with date_calculation(
    select date_trunc
)

select * from {{ source('DBT_Workshop', 'RETAIL_DATA') }}