{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}

{% macro log_model_run_time() %}
    {% for result in run_results.results %}
        {% set model_name = result.unique_id %}
        {% set start_time = result.timing[0].started_at %}
        {% set end_time = result.timing[0].completed_at %}
        {{ log("Model: " ~ model_name ~ ", Start: " ~ start_time ~ ", End: " ~ end_time, info=True) }}
    {% endfor %}
{% endmacro %}