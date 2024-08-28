SELECT
    date_date,
    count(*) AS nb_transaction,
    SUM(revenue) AS revenue,
    SUM(revenue) / count(*) AS average_basket,
    SUM(margin) AS margin,
    SUM(operational_margin) AS operational_margin
FROM {{ref("int_orders_operational")}}
GROUP BY date_date