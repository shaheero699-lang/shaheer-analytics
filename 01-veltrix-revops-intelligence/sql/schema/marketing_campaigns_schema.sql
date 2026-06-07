-- ================================================
-- Marketing Campaigns Table Schema
-- Veltrix AI RevOps Intelligence Platform
-- ================================================

CREATE TABLE marketing_campaigns (
    campaign_id         VARCHAR(20) PRIMARY KEY,
    campaign_name       VARCHAR(100),
    campaign_type       VARCHAR(50),
    start_date          DATE,
    end_date            DATE,
    budget              DECIMAL(10,2),
    leads_generated     INT,
    conversions         INT,
    revenue_attributed  DECIMAL(12,2),
    cac                 DECIMAL(10,2),
    region              VARCHAR(50)
);

CREATE INDEX idx_campaigns_type 
    ON marketing_campaigns(campaign_type);
