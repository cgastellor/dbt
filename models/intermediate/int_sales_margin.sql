WITH source AS (
    SELECT *
    FROM {{ref("stg_raw__sales")}}
    LEFT JOIN {{ref("stg_raw__product")}}
    ON stg_raw__product.products_id = stg_raw__sales.product_id
),
    renamed AS(
        SELECT *
        FROM source
    )

    SELECT
        orders_id,
        date_date,
        product_id,
        revenue,
        CAST(purchase_price AS NUMERIC) AS purchase_price,
        quantity,
        (CAST(purchase_price AS NUMERIC)) * quantity AS purchase_cost,
        revenue - (CAST(purchase_price AS NUMERIC)) * quantity AS margin
    FROM renamed