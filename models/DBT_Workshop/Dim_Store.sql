


select cast (seq_store.nextval as int) as store_key,
cast(storeid as int) storeid,
cast (storelocation as varchar(50)) as storelocation,
( {{ created_by()}} ) Created_by,
current_date as Created_Date,
( {{ created_by()}} ) as Updated_by,
current_date as Updated_Date   
from {{ source('DBT_Workshop', 'RETAIL_DATA') }}
