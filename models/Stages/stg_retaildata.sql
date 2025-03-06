{{
    config(
        materialized='table',
        tags= ["External_model"]
    )
}}

select nvl(customerid,'UNK') as customerid,
age,
nvl(gender,'UNK') as gender,
nvl(annualincome,'####') as annualincome,
spendingscore,
productcategory,
productprice,
storeid,
storelocation,
paymentmethod,
discountapplied,
discountpercent,
productcost,
profit,
foottraffic,
inventorylevel,
marketingexpenditure,
competitorprice,
current_timestamp as update_date 
from {{ source('external', 'retail_data') }}


