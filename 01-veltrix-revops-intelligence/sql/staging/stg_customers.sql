-- ================================================
-- Staging: Customers Cleaning & Transformation
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

CREATE TABLE stg_customers AS
SELECT
    customer_id,
    TRIM(company_name)                    AS company_name,
    COALESCE(industry, 'Unknown')         AS industry,
    COALESCE(company_size, 'Unknown')     AS company_size,
    UPPER(region)                         AS region,
    LOWER(plan_type)                      AS plan_type,
    ROUND(ARR, 2)                         AS ARR,
    CAST(signup_date AS DATE)             AS signup_date,
    COALESCE(onboarding_days, 0)          AS onboarding_days,
    ROUND(customer_health_score, 2)       AS customer_health_score,
    CASE
        WHEN customer_health_score >= 75 THEN 'Healthy'
        WHEN customer_health_score >= 50 THEN 'Moderate'
        ELSE 'At Risk'
    END                                   AS health_segment
FROM customers
WHERE customer_id IS NOT NULL
  AND ARR > 0;
