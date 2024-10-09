select playerid,coachid,firstname,lastname,height,weight,birthyear from
{{ ref('Master') }}
