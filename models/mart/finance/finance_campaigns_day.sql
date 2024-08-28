SELECT
    fd.*,
    operational_margin - ads_cost AS ads_margin
FROM {{ref("finance_days")}} fd
LEFT JOIN {{ref("int_campaigns_day")}} cd
USING(date_date)
ORDER BY date_date DESC