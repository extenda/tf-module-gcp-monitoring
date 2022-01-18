variable tribe_project_id {
  type        = string
  description = "Project ID where the Monitoring resources will be created"
}

variable clan_project_id {
  type        = string
  description = "Clan Project ID"
}

variable clan_name {
  type        = string
  description = "The name of the clan"
}

variable notification_channels {
  type        = list
  description = "List of notificaton channel IDs"
  default     = []
}

variable pubsub_monitoring {
  type        = bool
  description = "If the Pub/Sub dashboards and alerts should be created"
  default     = false
}

variable cloudrun_monitoring {
  type        = bool
  description = "If the Cloud Run dashboards and alerts should be created"
  default     = false
}

variable firestore_monitoring {
  type        = bool
  description = "If the Firestore dashboards and alerts should be created"
  default     = false
}

variable cloudfunction_monitoring {
  type        = bool
  description = "If the Cloud Function dashboards and alerts should be created"
  default     = false
}

variable cloudsql_monitoring {
  type        = bool
  description = "If the Cloud SQL dashboards and alerts should be created"
  default     = false
}

variable dataflow_monitoring {
  type        = bool
  description = "If the Dataflow dashboards and alerts should be created"
  default     = false
}

variable memorystore_monitoring {
  type        = bool
  description = "If the Memorystore dashboards and alerts should be created"
  default     = false
}

variable user_labels {
  type        = map
  description = "User labels for AlertPolicy objects"
  default     = {}
}

### Pub/Sub configurations DLQ count
variable dlq_count_threshold_value {
  type        = string
  description = "A value against which to compare the time series for DLQ messages count alert"
  default     = "0"
}

variable dlq_count_duration {
  type        = string
  description = "The amount of time that a time series must violate the threshold to be considered failing for DLQ messages count alert"
  default     = "60s"
}

variable dlq_count_comparison {
  type        = string
  description = "The comparison to apply between the time series and the threshold. Only COMPARISON_LT and COMPARISON_GT are supported currently."
  default     = "COMPARISON_GT"
}

variable dlq_count_alignment_period {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds."
  default     = "60s"
}

variable dlq_count_per_series_aligner {
  type        = string
  description = "The approach to be used to align individual time series."
  default     = "ALIGN_COUNT"
}

### Pub/Sub configurations Messages acknowledgment
variable msg_ack_threshold_value {
  type        = string
  description = "A value against which to compare the time series."
  default     = "1"
}

variable msg_ack_duration {
  type        = string
  description = "The amount of time that a time series must violate the threshold to be considered failing."
  default     = "1800s"
}

variable msg_ack_comparison {
  type        = string
  description = "The comparison to apply between the time series and the threshold. Only COMPARISON_LT and COMPARISON_GT are supported currently."
  default     = "COMPARISON_GT"
}

variable msg_ack_alignment_period {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds."
  default     = "60s"
}

variable msg_ack_per_series_aligner {
  type        = string
  description = "The approach to be used to align individual time series."
  default     = "ALIGN_COUNT"
}

### Pub/Sub configurations Push subscription latency
variable push_latency_threshold_value {
  type        = string
  description = "A value against which to compare the time series."
  default     = "3000000"
}

variable push_latency_duration {
  type        = string
  description = "The amount of time that a time series must violate the threshold to be considered failing."
  default     = "120s"
}

variable push_latency_comparison {
  type        = string
  description = "The comparison to apply between the time series and the threshold. Only COMPARISON_LT and COMPARISON_GT are supported currently."
  default     = "COMPARISON_GT"
}

variable push_latency_alignment_period {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds."
  default     = "60s"
}

variable push_latency_per_series_aligner {
  type        = string
  description = "The approach to be used to align individual time series."
  default     = "ALIGN_DELTA"
}

variable push_latency_cross_series_reducer {
  type        = string
  description = "The approach to be used to combine time series."
  default     = "REDUCE_PERCENTILE_95"
}

### Pub/Sub configurations Response status codes 5xx
variable reponse_code_threshold_value {
  type        = string
  description = "A value against which to compare the time series."
  default     = "0"
}

variable reponse_code_duration {
  type        = string
  description = "The amount of time that a time series must violate the threshold to be considered failing."
  default     = "120s"
}

variable reponse_code_comparison {
  type        = string
  description = "The comparison to apply between the time series and the threshold. Only COMPARISON_LT and COMPARISON_GT are supported currently."
  default     = "COMPARISON_GT"
}

variable reponse_code_alignment_period {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds."
  default     = "60s"
}

variable reponse_code_per_series_aligner {
  type        = string
  description = "The approach to be used to align individual time series."
  default     = "ALIGN_RATE"
}

variable reponse_code_cross_series_reducer {
  type        = string
  description = "The approach to be used to combine time series."
  default     = "REDUCE_PERCENTILE_05"
}

### Cloud Function Error messages count
variable func_message_count_threshold_value {
  type        = string
  description = "A value against which to compare the time series."
  default     = "0"
}

variable func_message_count_duration {
  type        = string
  description = "The amount of time that a time series must violate the threshold to be considered failing."
  default     = "60s"
}

variable func_message_count_comparison {
  type        = string
  description = "The comparison to apply between the time series and the threshold. Only COMPARISON_LT and COMPARISON_GT are supported currently."
  default     = "COMPARISON_GT"
}

variable func_message_count_alignment_period {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds."
  default     = "60s"
}

variable func_message_count_per_series_aligner {
  type        = string
  description = "The approach to be used to align individual time series."
  default     = "ALIGN_COUNT"
}

### Dataflow System lag exceeds 30 seconds for 2 minutes
variable system_lag_exceeds_threshold_value {
  type        = string
  description = "A value against which to compare the time series."
  default     = "30.0"
}

variable system_lag_exceeds_duration {
  type        = string
  description = "The amount of time that a time series must violate the threshold to be considered failing."
  default     = "180s"
}

variable system_lag_exceeds_comparison {
  type        = string
  description = "The comparison to apply between the time series and the threshold. Only COMPARISON_LT and COMPARISON_GT are supported currently."
  default     = "COMPARISON_GT"
}

variable system_lag_exceeds_alignment_period {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds."
  default     = "60s"
}

variable system_lag_exceeds_per_series_aligner {
  type        = string
  description = "The approach to be used to align individual time series."
  default     = "ALIGN_MEAN"
}

variable system_lag_exceeds_cross_series_reducer {
  type        = string
  description = "The approach to be used to combine time series."
  default     = "REDUCE_MEAN"
}

### Dataflow Data watermark lag exceeds 60 seconds for 5 minutes
variable watermark_lag_threshold_value {
  type        = string
  description = "A value against which to compare the time series."
  default     = "60.0"
}

variable watermark_lag_duration {
  type        = string
  description = "The amount of time that a time series must violate the threshold to be considered failing."
  default     = "300s"
}

variable watermark_lag_comparison {
  type        = string
  description = "The comparison to apply between the time series and the threshold. Only COMPARISON_LT and COMPARISON_GT are supported currently."
  default     = "COMPARISON_GT"
}

variable watermark_lag_alignment_period {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds."
  default     = "60s"
}

variable watermark_lag_per_series_aligner {
  type        = string
  description = "The approach to be used to align individual time series."
  default     = "ALIGN_MEAN"
}

variable watermark_lag_cross_series_reducer {
  type        = string
  description = "The approach to be used to combine time series."
  default     = "REDUCE_MEAN"
}

### Dataflow System lag increases by 70% over a 1 minute period
variable system_lag_increases_threshold_value {
  type        = string
  description = "A value against which to compare the time series."
  default     = "70.0"
}

variable system_lag_increases_duration {
  type        = string
  description = "The amount of time that a time series must violate the threshold to be considered failing."
  default     = "0s"
}

variable system_lag_increases_comparison {
  type        = string
  description = "The comparison to apply between the time series and the threshold. Only COMPARISON_LT and COMPARISON_GT are supported currently."
  default     = "COMPARISON_GT"
}

variable system_lag_increases_alignment_period {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds."
  default     = "60s"
}

variable system_lag_increases_per_series_aligner {
  type        = string
  description = "The approach to be used to align individual time series."
  default     = "ALIGN_MEAN"
}

variable system_lag_increases_cross_series_reducer {
  type        = string
  description = "The approach to be used to combine time series."
  default     = "REDUCE_MEAN"
}

### Memorystore Memory usage ratio
variable memory_usage_threshold_value {
  type        = string
  description = "A value against which to compare the time series."
  default     = "0.8"
}

variable memory_usage_duration {
  type        = string
  description = "The amount of time that a time series must violate the threshold to be considered failing."
  default     = "120s"
}

variable memory_usage_comparison {
  type        = string
  description = "The comparison to apply between the time series and the threshold. Only COMPARISON_LT and COMPARISON_GT are supported currently."
  default     = "COMPARISON_GT"
}

variable memory_usage_alignment_period {
  type        = string
  description = "The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds."
  default     = "60s"
}

variable memory_usage_per_series_aligner {
  type        = string
  description = "The approach to be used to align individual time series."
  default     = "ALIGN_MEAN"
}
