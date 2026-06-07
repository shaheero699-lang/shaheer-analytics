-- ================================================
-- Sales Pipeline Table Schema
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

CREATE TABLE sales_pipeline (
    deal_id             VARCHAR(20) PRIMARY KEY,
    customer_id         VARCHAR(20),
    sales_rep           VARCHAR(50),
    deal_stage          VARCHAR(30),
    pipeline_value      DECIMAL(12,2),
    close_probability   DECIMAL(5,2),
    expected_close_date DATE,
    region              VARCHAR(50),
    plan_type           VARCHAR(20),
    FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id)
);

CREATE INDEX idx_pipeline_stage 
    ON sales_pipeline(deal_stage);
CREATE INDEX idx_pipeline_rep 
    ON sales_pipeline(sales_rep);
