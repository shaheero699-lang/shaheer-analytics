-- ================================================
-- Support Tickets Table Schema
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

CREATE TABLE support_tickets (
    ticket_id           VARCHAR(20) PRIMARY KEY,
    customer_id         VARCHAR(20) NOT NULL,
    created_date        DATE,
    issue_type          VARCHAR(50),
    priority            VARCHAR(20),
    resolution_time     DECIMAL(6,2),
    SLA_breach_flag     INT DEFAULT 0,
    escalation_flag     INT DEFAULT 0,
    CSAT_score          DECIMAL(3,1),
    FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id)
);

CREATE INDEX idx_tickets_customer 
    ON support_tickets(customer_id);
CREATE INDEX idx_tickets_sla 
    ON support_tickets(SLA_breach_flag);
