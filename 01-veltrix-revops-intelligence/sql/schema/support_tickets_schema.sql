CREATE TABLE support_tickets (
    ticket_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) NOT NULL,
    issue_type VARCHAR(100),
    priority VARCHAR(50),
    created_date DATE NOT NULL,
    resolution_time_hours DECIMAL(8,2),
    SLA_breach_flag BOOLEAN,
    CSAT_score DECIMAL(3,2) CHECK (CSAT_score BETWEEN 0 AND 5),
    escalation_flag BOOLEAN,

    CONSTRAINT fk_ticket_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
