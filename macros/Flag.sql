{% macro Flag(column_name) %}

	case when {{column_name}} is null then 'Y'
	else 'N'
	end
{% endmacro%}

{% macro conversion() %}

current_timestamp

{% endmacro%}


{% macro Databasehockey(database_name,schema_name,table_name) %}

select * from  {{database_name}}.{{schema_name}}.{{table_name}}

{% endmacro%}