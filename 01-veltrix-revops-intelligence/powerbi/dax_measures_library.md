# Veltrix RevOps Intelligence - DAX Measures Library

## Revenue Metrics

### Total Revenue

```DAX
Total Revenue =
SUM(subscriptions[revenue])
```

### Average Deal Size

```DAX
Average Deal Size =
AVERAGE(sales_pipeline[deal_value])
```

## Customer Metrics

### Customer Count

```DAX
Customer Count =
DISTINCTCOUNT(customers[customer_id])
```

### Churn Rate %

```DAX
Churn Rate % =
DIVIDE(
    SUM(subscriptions[churn_flag]),
    COUNTROWS(subscriptions)
) * 100
```

## Retention Metrics

### Retention Rate %

```DAX
Retention Rate % =
DIVIDE(
    CALCULATE(
        COUNTROWS(subscriptions),
        subscriptions[churn_flag] = 0
    ),
    COUNTROWS(subscriptions)
) * 100
```

## Forecasting Metrics

### Forecast Accuracy %

```DAX
Forecast Accuracy % =
1 -
DIVIDE(
    ABS([Forecast Revenue] - [Actual Revenue]),
    [Actual Revenue]
)
```
