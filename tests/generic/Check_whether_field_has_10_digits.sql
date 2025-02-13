{% test Check_whether_field_has_10_digits (model, column_name)  %} 


  select *
  from {{ model}} where {{ column_name }} not rlike '^\\d{4}$'


{% endtest %}
