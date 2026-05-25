CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    company_size VARCHAR(50),
    industry VARCHAR(100),
    signup_date DATE,
    region VARCHAR(50),
    ARR DECIMAL(15,2),
    plan_type VARCHAR(50),
    onboarding_completion_days INT,
    customer_health_score INT CHECK (customer_health_score BETWEEN 0 AND 100),
    acquisition_channel VARCHAR(100),
    account_manager VARCHAR(100)
);
