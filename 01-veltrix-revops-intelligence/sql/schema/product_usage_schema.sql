-- ================================================
-- Product Usage Table Schema
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

CREATE TABLE product_usage (
    usage_id              VARCHAR(20) PRIMARY KEY,
    customer_id           VARCHAR(20) NOT NULL,
    feature_adoption_rate DECIMAL(5,4),
    feature_usage_score   DECIMAL(6,2),
    last_login_date       DATE,
    monthly_active_days   INT,
    FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id)
);

CREATE INDEX idx_usage_customer 
    ON product_usage(customer_id);
