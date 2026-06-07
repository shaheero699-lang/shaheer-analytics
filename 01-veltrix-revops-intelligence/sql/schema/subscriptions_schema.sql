-- ================================================
-- Subscriptions Table Schema
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

CREATE TABLE subscriptions (
    subscription_id         VARCHAR(20) PRIMARY KEY,
    customer_id             VARCHAR(20) NOT NULL,
    plan_type               VARCHAR(20),
    mrr                     DECIMAL(10,2),
    arr                     DECIMAL(12,2),
    subscription_start_date DATE,
    subscription_end_date   DATE,
    churn_flag              INT DEFAULT 0,
    churn_reason            VARCHAR(100),
    renewal_date            DATE,
    contract_length_months  INT,
    FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id)
);

CREATE INDEX idx_subscriptions_customer 
    ON subscriptions(customer_id);
CREATE INDEX idx_subscriptions_churn 
    ON subscriptions(churn_flag);
