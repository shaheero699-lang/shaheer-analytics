# Power BI Layer

## Dashboard: Veltrix AI Revenue Operations Intelligence Platform

4-page enterprise BI dashboard built in Power BI Desktop.

## Pages

| Page | Purpose | Key Visuals |
|---|---|---|
| Executive Command Center | Board-level KPI overview | MRR trend, health distribution, ARR by plan |
| Revenue Operations Intelligence | Sales pipeline analytics | Funnel, rep performance, weighted pipeline |
| Customer Health & Retention | CS and churn analytics | Cohort heatmap, health segment churn, onboarding impact |
| Forecasting & Predictive Intelligence | Forward-looking revenue | Scenario forecasting, MAPE tracking, MRR components |

## Data Model
- Star schema with 1 fact table (subscriptions) 
- 5 dimension tables
- 40+ DAX measures
- Row-level security configured by region

## Files
- `veltrix_revops_intelligence_dashboard.pbix` — Main dashboard file
- `dax_measures_library.md` — All DAX measures documented
