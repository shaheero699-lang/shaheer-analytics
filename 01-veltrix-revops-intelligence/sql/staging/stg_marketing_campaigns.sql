-- ================================================
-- Staging: Marketing Campaigns Transformation
-- ================================================

CREATE TABLE stg_marketing_campaigns AS
SELECT
    campaign_id,
    TRIM(campaign_name)                   AS campaign_name,
    LOWER(campaign_type)                  AS campaign_type,
    CAST(start_date AS DATE)              AS start_date,
    CAST(end_date AS DATE)                AS end_date,
    ROUND(budget, 2)                      AS budget,
    COALESCE(leads_generated, 0)          AS leads_generated,
    COALESCE(conversions, 0)              AS conversions,
    ROUND(revenue_attributed, 2)          AS revenue_attributed,
    ROUND(cac, 2)                         AS cac,
    CASE
        WHEN conversions > 0
        THEN ROUND(leads_generated * 1.0 / conversions, 2)
        ELSE 0
    END                                   AS lead_to_conversion_ratio,
    UPPER(region)                         AS region
FROM marketing_campaigns
WHERE campaign_id IS NOT NULL;
