-- ================================================
-- Forecasting Analysis
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

-- 1. Monthly Churn Rate Trend
SELECT 
    DATE_TRUNC('month', subscription_end_date) AS churn_month,
    COUNT(*) AS churned_customers,
    ROUND(AVG(mrr), 2) AS avg_churned_mrr
FROM subscriptions
WHERE churn_flag = 1
GROUP BY churn_month
ORDER BY churn_month;

-- 2. Revenue Forecast (Base Case)
WITH current_metrics AS (
    SELECT 
        ROUND(AVG(churn_flag) * 100, 2) AS churn_rate,
        ROUND(SUM(mrr), 2) AS current_mrr
    FROM subscriptions
)
SELECT 
    current_mrr,
    churn_rate,
    ROUND(current_mrr * (1 - churn_rate/100), 2) AS forecast_mrr_base,
    ROUND(current_mrr * (1 - (churn_rate * 0.8)/100), 2) AS forecast_mrr_best,
    ROUND(current_mrr * (1 - (churn_rate * 1.2)/100), 2) AS forecast_mrr_worst
FROM current_metrics;

-- 3. Customer Growth Trend
SELECT 
    DATE_TRUNC('month', signup_date) AS signup_month,
    COUNT(*) AS new_customers,
    SUM(COUNT(*)) OVER (ORDER BY DATE_TRUNC('month', signup_date)) 
        AS cumulative_customers
FROM customers
GROUP BY signup_month
ORDER BY signup_month;
