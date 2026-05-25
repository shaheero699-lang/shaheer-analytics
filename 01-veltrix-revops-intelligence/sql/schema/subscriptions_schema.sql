CREATE TABLE subscriptions (
    subscription_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20),
    subscription_start_date DATE,
    renewal_date DATE,
    MRR DECIMAL(15,2),
    ARR DECIMAL(15,2),
    renewal_status VARCHAR(50),
    churn_flag BOOLEAN,
    expansion_revenue DECIMAL(15,2),
    contract_length_months INT CHECK (contract_length_months > 0),

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
