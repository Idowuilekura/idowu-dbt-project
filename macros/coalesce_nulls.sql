{% macro coalesce_nulls_function(sr_flag) -%}
CAST(COALESCE({{sr_flag}},'0' ) AS INTEGER)
{%- endmacro %}