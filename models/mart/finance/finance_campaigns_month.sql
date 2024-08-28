SELECT 
    DATE_TRUNC(date_date, MONTH) AS datemonth,
    SUM(ads_margin) AS ads_margin,
    SUM(average_basket) AS average_basket,
    SUM(operational_margin) AS operational_margin
FROM {{ ref('finance_campaigns_day') }}
GROUP BY datemonth
ORDER BY datemonth DESC