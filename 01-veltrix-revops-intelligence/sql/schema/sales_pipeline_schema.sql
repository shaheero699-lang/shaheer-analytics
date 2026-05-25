CREATE TABLE sales_pipeline (
    opportunity_id VARCHAR(20) PRIMARY KEY,
    sales_rep VARCHAR(100) NOT NULL,
    region VARCHAR(50),
    deal_stage VARCHAR(100),
    pipeline_value DECIMAL(15,2) CHECK (pipeline_value >= 0),
    close_probability DECIMAL(5,2) CHECK (close_probability BETWEEN 0 AND 1),
    source_channel VARCHAR(100),
    deal_created_date DATE NOT NULL,
    expected_close_date DATE
);
