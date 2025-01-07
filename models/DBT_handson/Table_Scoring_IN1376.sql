
select * from {{ source('DBT_Sources', 'GOALIES') }}


{{Flag ('dbt_valid_to','dbt_valid_from')}}

{{ Flag('dbt_valid_to') }} 