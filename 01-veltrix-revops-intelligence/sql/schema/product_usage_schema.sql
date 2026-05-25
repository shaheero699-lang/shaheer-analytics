CREATE TABLE product_usage (
    usage_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    usage_date DATE NOT NULL,
    login_frequency INT CHECK (login_frequency >= 0),
    feature_usage_score DECIMAL(5,2),
    session_duration_minutes DECIMAL(8,2),
    active_days INT CHECK (active_days >= 0),
    feature_adoption_rate DECIMAL(5,2),

    CONSTRAINT fk_usage_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
