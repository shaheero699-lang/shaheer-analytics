-- ================================================
-- Customer Segmentation Analysis
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

-- 1. Customer Distribution by Health Segment
SELECT 
    health_segment,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct_of_total
FROM customers
GROUP BY health_segment
ORDER BY customer_count DESC;

-- 2. ARR by Plan Type
SELECT 
    plan_type,
    COUNT(*) AS customer_count,
    ROUND(SUM(ARR), 2) AS total_arr,
    ROUND(AVG(ARR), 2) AS avg_arr
FROM customers
GROUP BY plan_type
ORDER BY total_arr DESC;

-- 3. Feature Adoption Rate by Plan Type
SELECT 
    c.plan_type,
    ROUND(AVG(p.feature_adoption_rate) * 100, 2) AS avg_adoption_rate,
    ROUND(AVG(p.feature_usage_score), 2) AS avg_usage_score
FROM customers c
JOIN product_usage p ON c.customer_id = p.customer_id
GROUP BY c.plan_type
ORDER BY avg_adoption_rate DESC;

-- 4. Customer Health Score Distribution
SELECT 
    CASE 
        WHEN customer_health_score >= 75 THEN 'Healthy'
        WHEN customer_health_score >= 50 THEN 'Moderate'
        ELSE 'At Risk'
    END AS segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(ARR), 2) AS avg_arr,
    ROUND(AVG(customer_health_score), 2) AS avg_health_score
FROM customers
GROUP BY segment
ORDER BY avg_health_score DESC;

-- 5. Top At-Risk Customers by ARR
SELECT 
    c.customer_id,
    c.company_name,
    c.health_segment,
    c.customer_health_score,
    c.ARR,
    c.plan_type
FROM customers c
WHERE c.health_segment = 'At Risk'
ORDER BY c.ARR DESC
LIMIT 20;
