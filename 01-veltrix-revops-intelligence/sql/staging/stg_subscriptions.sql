-- ================================================
-- Staging: Subscriptions Cleaning & Transformation
-- ================================================

CREATE TABLE stg_subscriptions AS
SELECT
    subscription_id,
    customer_id,
    LOWER(plan_type)                      AS plan_type,
    ROUND(mrr, 2)                         AS mrr,
    ROUND(mrr * 12, 2)                    AS arr,
    CAST(subscription_start_date AS DATE) AS subscription_start_date,
    CAST(subscription_end_date AS DATE)   AS subscription_end_date,
    COALESCE(churn_flag, 0)               AS churn_flag,
    COALESCE(churn_reason, 'Active')      AS churn_reason,
    contract_length_months,
    DATEDIFF(
        subscription_end_date,
        subscription_start_date
    )                                     AS days_active
FROM subscriptions
WHERE subscription_id IS NOT NULL
  AND customer_id IS NOT NULL
  AND mrr > 0;
