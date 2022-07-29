## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.18 |
| google | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| google | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|

## Outputs

| Name | Description |
|------|-------------|

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.18 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_alert_policy.alert_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_monitoring_project_id"></a> [monitoring\_project\_id](#input\_monitoring\_project\_id) | Project ID to create monitoring resources in | `string` | `"hiiretail-monitoring-prod-6500"` | no |
| <a name="input_notification_channels"></a> [notification\_channels](#input\_notification\_channels) | List of notificaton channel IDs | `list(any)` | `[]` | no |
| <a name="input_user_labels"></a> [user\_labels](#input\_user\_labels) | Project ID to create monitoring resources in | `map(any)` | `{}` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | The list of alert policies configurations | `any` | n/a | yes |

### **policies** supported attributes

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **service\_name** | The name of the service for which uptimecheck will be created | string | n/a | **yes** |
| **enabled** | Whether or not the policy is enabled. | bool | true | no |
| **combiner** | How to combine the results of multiple conditions to determine if an incident should be opened. Possible values are AND, OR, and AND_WITH_MATCHING_RESOURCE. | string | OR | no |
| **documentation** | Object containing configuration for the documentation. Documentation that is included with notifications and incidents related to this policy. Best practice is for the documentation to include information to help responders understand, mitigate, escalate, and correct the underlying problems detected by the alerting policy. Notification channels that have limited capacity might not show this documentation. | object(any) | n/a | no|
| **alert_strategy** | Object containing configuration for the alertstrategy that's controlling how this alert policy's notification channels are notified.  | object(any) | n/a | no |
| **conditions** | Object containing configuration for the condition/s  | object(any) | n/a | **yes** |

### **policies.alert_strategy** supported attributes

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **auto_close** | If an alert policy that was active has no data for this long, any open incidents will close. | string | 0s | no |

### **policies.documentation** supported attributes

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **content** | The text of the documentation, interpreted according to mimeType. The content may not exceed 8,192 Unicode characters and may not exceed more than 10,240 bytes when encoded in UTF-8 format, whichever is smaller. | string | n/a | no |
| **mime_type** | mime_type - (Optional) The format of the content field. Presently, only the value "text/markdown" is supported. | string | "text/markdown" | no |

### **policies.conditions** supported attributes

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **display_name** | A short name or phrase used to identify the condition in dashboards, notifications, and incidents. To avoid confusion, don't use the same display name for multiple conditions in the same policy. | string | n/a | **yes** |
| **condition_threshold** | Object containing configuration for the condition threshold/s  | object(any) | n/a | **yes** |

### **policies.conditions.condition_threshold** supported attributes

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **comparison** | The comparison to apply between the time series (indicated by filter and aggregation) and the threshold (indicated by threshold_value). The comparison is applied on each time series, with the time series on the left-hand side and the threshold on the right-hand side. Only COMPARISON_LT and COMPARISON_GT are supported currently. Possible values are COMPARISON_GT, COMPARISON_GE, COMPARISON_LT, COMPARISON_LE, COMPARISON_EQ, and COMPARISON_NE. | string |  | **yes** |
| **threshold_value** | A value against which to compare the time series. | number |  | **yes** |
| **filter** | A filter that identifies which time series should be compared with the threshold.The filter is similar to the one that is specified in the MetricService.ListTimeSeries request (that call is useful to verify the time series that will be retrieved / processed) and must specify the metric type and optionally may contain restrictions on resource type, resource labels, and metric labels. This field may not exceed 2048 Unicode characters in length. | string |  | **yes** |
| **duration** | The amount of time that a time series must violate the threshold to be considered failing. Currently, only values that are a multiple of a minute--e.g., 0, 60, 120, or 300 seconds--are supported. If an invalid value is given, an error will be returned. When choosing a duration, it is useful to keep in mind the frequency of the underlying time series data (which may also be affected by any alignments specified in the aggregations field); a good duration is long enough so that a single outlier does not generate spurious alerts, but short enough that unhealthy states are detected and alerted on quickly. | string | 0s | **yes** |
| **trigger** | Object containing configuration for the trigger that is the number/percent of time series for which the comparison must hold in order for the condition to trigger. If unspecified, then the condition will trigger if the comparison is true for any of the time series that have been identified by filter and aggregations, or by the ratio, if denominator_filter and denominator_aggregations are specified  | object(any) | n/a | no |
| **denominator_filter** | A filter that identifies a time series that should be used as the denominator of a ratio that will be compared with the threshold. If a denominator_filter is specified, the time series specified by the filter field will be used as the numerator.The filter is similar to the one that is specified in the MetricService.ListTimeSeries request (that call is useful to verify the time series that will be retrieved / processed) and must specify the metric type and optionally may contain restrictions on resource type, resource labels, and metric labels. This field may not exceed 2048 Unicode characters in length. | string |  | no |
| **denominator_aggregations** | Object containing configuration for the denominator aggregations  | object(any) | n/a | no |
| **aggregations** | Object containing configuration for the trigger, that specifies the alignment of data points in individual time series selected by denominator_filter as well as how to combine the retrieved time series together (such as when aggregating multiple streams on each resource to a single stream for each resource or when aggregating streams across all members of a group of resources).When computing ratios, the aggregations and denominator_aggregations fields must use the same alignment period and produce time series that have the same periodicity and labels.This field is similar to the one in the MetricService.ListTimeSeries request. It is advisable to use the ListTimeSeries method when debugging this field.  | object(any) | n/a | **yes** |

### **policies.conditions.aggregations** & **policies.conditions.denominator_aggregations** supported attributes

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **alignment_period** |  The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. After per-time series alignment, each time series will contain data points only on the period boundaries. If perSeriesAligner is not specified or equals ALIGN_NONE, then this field is ignored. If perSeriesAligner is specified and does not equal ALIGN_NONE, then this field must be defined; otherwise an error is returned.  | string |  | no |
| **per_series_aligner** |  The approach to be used to align individual time series. Not all alignment functions may be applied to all time series, depending on the metric type and value type of the original time series. Alignment may change the metric type or the value type of the time series.Time series data must be aligned in order to perform cross- time series reduction. If crossSeriesReducer is specified, then perSeriesAligner must be specified and not equal ALIGN_NONE and alignmentPeriod must be specified; otherwise, an error is returned. Possible values are ALIGN_NONE, ALIGN_DELTA, ALIGN_RATE, ALIGN_INTERPOLATE, ALIGN_NEXT_OLDER, ALIGN_MIN, ALIGN_MAX, ALIGN_MEAN, ALIGN_COUNT, ALIGN_SUM, ALIGN_STDDEV, ALIGN_COUNT_TRUE, ALIGN_COUNT_FALSE, ALIGN_FRACTION_TRUE, ALIGN_PERCENTILE_99, ALIGN_PERCENTILE_95, ALIGN_PERCENTILE_50, ALIGN_PERCENTILE_05, and ALIGN_PERCENT_CHANGE. | string | x | no |
| **group_by_fields** | The set of fields to preserve when crossSeriesReducer is specified. The groupByFields determine how the time series are partitioned into subsets prior to applying the aggregation function. Each subset contains time series that have the same value for each of the grouping fields. Each individual time series is a member of exactly one subset. The crossSeriesReducer is applied to each subset of time series. It is not possible to reduce across different resource types, so this field implicitly contains resource.type. Fields not specified in groupByFields are aggregated away. If groupByFields is not specified and all the time series have the same resource type, then the time series are aggregated into a single output time series. If crossSeriesReducer is not defined, this field is ignored. | list(string) |  | no |
| **cross_series_reducer** | The approach to be used to combine time series. Not all reducer functions may be applied to all time series, depending on the metric type and the value type of the original time series. Reduction may change the metric type of value type of the time series.Time series data must be aligned in order to perform cross- time series reduction. If crossSeriesReducer is specified, then perSeriesAligner must be specified and not equal ALIGN_NONE and alignmentPeriod must be specified; otherwise, an error is returned. Possible values are REDUCE_NONE, REDUCE_MEAN, REDUCE_MIN, REDUCE_MAX, REDUCE_SUM, REDUCE_STDDEV, REDUCE_COUNT, REDUCE_COUNT_TRUE, REDUCE_COUNT_FALSE, REDUCE_FRACTION_TRUE, REDUCE_PERCENTILE_99, REDUCE_PERCENTILE_95, REDUCE_PERCENTILE_50, and REDUCE_PERCENTILE_05. | string |  | no |

### **policies.conditions.trigger** supported attributes

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **percent** | The percentage of time series that must fail the predicate for the condition to be triggered. | number |  | no |
| **count** | The absolute number of time series that must fail the predicate for the condition to be triggered. | number |  | no |

## Outputs

| Name | Description |
|------|-------------|
| alert_ids | The id of the alerts |
