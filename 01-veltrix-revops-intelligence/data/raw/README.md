# Raw Data

Six synthetic datasets generated with realistic B2B SaaS 
business logic for the Veltrix AI RevOps platform.

| File | Rows | Description |
|---|---|---|
| customers.csv | 5,000 | Customer profiles, health scores, plan types |
| subscriptions.csv | 5,000 | MRR, churn flags, contract details |
| support_tickets.csv | 15,000 | SLA breaches, ticket resolution data |
| product_usage.csv | 25,000 | Feature adoption rates, usage scores |
| sales_pipeline.csv | 8,000 | Deal stages, pipeline values, win rates |
| marketing_campaigns.csv | 3,000 | Campaign performance, CAC, attribution |

All data is synthetically generated. Business logic embedded:
- Churn correlates with health scores (r = 0.71)
- SLA breaches correlate with churn (r = 0.68)
- Feature adoption varies by plan tier
- Onboarding delay correlates with churn rate
