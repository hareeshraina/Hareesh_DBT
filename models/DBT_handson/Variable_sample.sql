select * from {{ source('DBT_Sources', 'SCORING') }}
where year = '{{ var("Year") }}'


