{% macro quarter_expenditure(date_col, amount_col, quarter) %}
    CASE WHEN({{ quarter }} = 1 AND EXTRACT(MONTH, {{ date_col }}) BETWEEN 1 AND 3)
        OR
    ({{ quarter }} = 2 AND EXTRACT(MONTH, {{ date_col }}) BETWEEN 4 AND 6)
        OR
    ({{ quarter }} = 3 AND EXTRACT(MONTH, {{ date_col }}) BETWEEN 7 AND 9)
        OR
    ({{ quarter }} = 4 AND EXTRACT(MONTH, {{ date_col }}) BETWEEN 10 AND 12)
        THEN {{ amount_col }} 
        ELSE 0
    END
{% endmacro %}


{% macro databasemacro(val)%}

{% if val==DEV %}
  {% set val=target.name %}
  {% if val=='DEV' %} {% set val='INI' %} {% endif %}
  {% do return("TRA"~val~"NG")  %}
{% endif  %}

{% endmacro %}


{% macro audit_column()%}

( {{ created_by()}} ) Created_by,
current_date as Created_Date,
( {{ created_by()}} ) as Updated_by,
current_date as Updated_Date

{% endmacro %}
