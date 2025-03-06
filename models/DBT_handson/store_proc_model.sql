{{ config(
    post_hook="call deletee()"
) }}


WITH my_data AS (
  SELECT * FROM hooks
)SELECT * FROM my_data
-- Call the stored procedure after the model runs


