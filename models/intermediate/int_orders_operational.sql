SELECT
    om.orders_id,
    om.date_date,
    om.margin - sh.shipping_fee - sh.logcost - CAST(sh.ship_cost AS NUMERIC) AS operational_margin
FROM {{ ref("int_orders_margin") }} om
LEFT JOIN {{ ref("stg_raw__ship") }} sh
USING(orders_id)