-- ================================================
-- Customers Table Schema
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

CREATE TABLE customers (
    customer_id         VARCHAR(20) PRIMARY KEY,
    company_name        VARCHAR(100) NOT NULL,
    industry            VARCHAR(50),
    company_size        VARCHAR(20),
    region              VARCHAR(50),
    plan_type           VARCHAR(20),
    ARR                 DECIMAL(12,2),
    signup_date         DATE,
    onboarding_days     INT,
    customer_health_score DECIMAL(5,2),
    health_segment      VARCHAR(20),
    account_manager     VARCHAR(50),
    acquisition_channel VARCHAR(50)
);

-- Indexes
CREATE INDEX idx_customers_plan_type 
    ON customers(plan_type);
CREATE INDEX idx_customers_health_segment 
    ON customers(health_segment);
CREATE INDEX idx_customers_region 
    ON customers(region);
