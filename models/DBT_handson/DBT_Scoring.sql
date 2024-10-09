select nvl(playerid,'NA') as playerid,year,nvl(pos,'NA')pos,nvl(gp,0)gp
from {{ source('DBT_Sources', 'SCORING') }}