{% macro Flag(column_name1,column_name2) %}

	case when {{column_name1}} is null then 'Y'
    case when {{column_name2}} is null then 'Z'
	else 'N'
	end
{% endmacro%}

{% macro conversion() %}

current_timestamp

{% endmacro%}


{% macro DatabaseHareesh(database_name,schema_name,table_name) %}

select * from  {{database_name}}.{{schema_name}}.{{table_name}}

{% endmacro%}