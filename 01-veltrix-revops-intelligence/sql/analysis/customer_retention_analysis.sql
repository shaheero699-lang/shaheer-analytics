-- ================================================
-- Customer Retention Analysis
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

-- 1. Overall Churn Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(AVG(churn_flag) * 100, 2) AS churn_rate_pct
FROM subscriptions;

-- 2. Churn Rate by Health Segment
SELECT 
    c.health_segment,
    COUNT(*) AS total_customers,
    SUM(s.churn_flag) AS churned,
    ROUND(AVG(s.churn_flag) * 100, 2) AS churn_rate_pct
FROM subscriptions s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.health_segment
ORDER BY churn_rate_pct DESC;

-- 3. Cohort Retention by Signup Month
SELECT 
    DATE_TRUNC('month', c.signup_date) AS cohort_month,
    COUNT(DISTINCT c.customer_id) AS cohort_size,
    SUM(CASE WHEN s.churn_flag = 0 THEN 1 ELSE 0 END) AS retained,
    ROUND(
        SUM(CASE WHEN s.churn_flag = 0 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(DISTINCT c.customer_id), 2
    ) AS retention_rate_pct
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY DATE_TRUNC('month', c.signup_date)
ORDER BY cohort_month;

-- 4. Churn Rate by Onboarding Bucket
SELECT 
    CASE 
        WHEN c.onboarding_days <= 14 THEN '7-14 Days'
        WHEN c.onboarding_days <= 21 THEN '8-21 Days'
        WHEN c.onboarding_days <= 45 THEN '22-45 Days'
        ELSE '45+ Days'
    END AS onboarding_bucket,
    COUNT(*) AS total_customers,
    ROUND(AVG(s.churn_flag) * 100, 2) AS churn_rate_pct
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY onboarding_bucket
ORDER BY churn_rate_pct DESC;

-- 5. SLA Breach vs Churn Correlation
SELECT 
    c.customer_id,
    ROUND(AVG(t.SLA_breach_flag), 4) AS avg_sla_breach_rate,
    MAX(s.churn_flag) AS churned
FROM customers c
JOIN support_tickets t ON c.customer_id = t.customer_id
JOIN subscriptions s ON c.customer_id = s.customer_id
GROUP BY c.customer_id
ORDER BY avg_sla_breach_rate DESC;
