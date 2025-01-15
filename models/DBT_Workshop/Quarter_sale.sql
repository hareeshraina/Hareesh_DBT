WITH Quarter_sales AS (
    SELECT
        storeid,
        EXTRACT(YEAR, purchasedate) AS year,
        SUM({{ quarter_expenditure('purchasedate', 'productcost', 1) }}) AS Q1_Sales,
        SUM({{ quarter_expenditure('purchasedate', 'productcost', 2) }}) AS Q2_Sales,
        SUM({{ quarter_expenditure('purchasedate', 'productcost', 3) }}) AS Q3_Sales,
        SUM({{ quarter_expenditure('purchasedate', 'productcost', 4) }}) AS Q4_Sales
    FROM
        {{ ref('Retail_data') }}  
    GROUP BY
        storeid, EXTRACT(YEAR, purchasedate)
)

SELECT
    year,
    storeid,
    Q1_Sales,
    Q2_Sales,
    Q3_Sales,
    Q4_Sales
FROM
    Quarter_sales
ORDER BY
    year, storeid;
