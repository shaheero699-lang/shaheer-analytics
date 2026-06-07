-- ================================================
-- Staging: Sales Pipeline Cleaning & Transformation
-- ================================================

CREATE TABLE stg_sales_pipeline AS
SELECT
    deal_id,
    customer_id,
    TRIM(sales_rep)                              AS sales_rep,
    LOWER(deal_stage)                            AS deal_stage,
    ROUND(pipeline_value, 2)                     AS pipeline_value,
    ROUND(close_probability, 4)                  AS close_probability,
    ROUND(pipeline_value * close_probability, 2) AS weighted_pipeline,
    CAST(expected_close_date AS DATE)            AS expected_close_date,
    UPPER(region)                                AS region,
    LOWER(plan_type)                             AS plan_type
FROM sales_pipeline
WHERE deal_id IS NOT NULL
  AND pipeline_value > 0;
