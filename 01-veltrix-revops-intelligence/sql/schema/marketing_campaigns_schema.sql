CREATE TABLE marketing_campaigns (
    campaign_id VARCHAR(20) PRIMARY KEY,
    channel VARCHAR(100),
    campaign_type VARCHAR(100),
    spend DECIMAL(15,2),
    impressions INT CHECK (impressions >= 0),
    clicks INT CHECK (clicks >= 0),
    leads_generated INT CHECK (leads_generated >= 0),
    conversions INT CHECK (conversions >= 0),
    CAC DECIMAL(15,2),
    ROI DECIMAL(8,2),
    campaign_date DATE NOT NULL
);
