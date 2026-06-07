-- ================================================
-- Revenue Performance Analysis
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

-- 1. Total ARR and MRR
SELECT 
    ROUND(SUM(ARR), 2) AS total_arr,
    ROUND(SUM(ARR) / 12, 2) AS total_mrr,
    COUNT(*) AS total_customers,
    ROUND(AVG(ARR), 2) AS avg_arr_per_customer
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
WHERE s.churn_flag = 0;

-- 2. ARR by Plan Type and Region
SELECT 
    plan_type,
    region,
    COUNT(*) AS customers,
    ROUND(SUM(ARR), 2) AS total_arr
FROM customers
GROUP BY plan_type, region
ORDER BY total_arr DESC;

-- 3. Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', s.subscription_start_date) AS month,
    ROUND(SUM(s.mrr), 2) AS total_mrr,
    COUNT(*) AS active_customers
FROM subscriptions s
WHERE s.churn_flag = 0
GROUP BY DATE_TRUNC('month', s.subscription_start_date)
ORDER BY month;

-- 4. Net Revenue Retention
SELECT 
    ROUND(
        (SUM(CASE WHEN churn_flag = 0 THEN mrr ELSE 0 END) / 
         SUM(mrr)) * 100, 2
    ) AS net_revenue_retention_pct
FROM subscriptions;

-- 5. Revenue at Risk (At Risk Customers)
SELECT 
    ROUND(SUM(c.ARR), 2) AS arr_at_risk,
    COUNT(*) AS at_risk_customers,
    ROUND(SUM(c.ARR) / (SELECT SUM(ARR) FROM customers) * 100, 2) 
        AS pct_of_total_arr
FROM customers c
WHERE c.health_segment = 'At Risk';
