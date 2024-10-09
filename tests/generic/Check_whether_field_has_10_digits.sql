{% test Check_whether_field_has_10_digits (model, column_name)  %} 


  select {{ column_name }} 
  from {{ model}} where {{ column_name }} not rlike '^\\d{4}$'


{% endtest %}



