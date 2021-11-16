resource "google_monitoring_dashboard" "pub_sub_dashboard" {
  count = var.pubsub_monitoring ? 1 : 0

  project = var.tribe_project_id
  dashboard_json = templatefile("${path.module}/templates/dashboard.pubsub.json.tpl", {
    clan_project_id = var.clan_project_id
    clan_name       = var.clan_name
  })
}

resource "google_monitoring_alert_policy" "pub_sub_alert_policy" {
  count = var.pubsub_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = [var.notification_channels[0]]
  display_name          = "Pub/Sub DLQ Alert Policy - ${var.clan_name}"
  combiner              = "AND"
  conditions {
    display_name = "DLQ messages count"
    condition_threshold {
      threshold_value = "0"
      filter          = "metric.type=\"pubsub.googleapis.com/subscription/dead_letter_message_count\" resource.type=\"pubsub_subscription\" resource.label.\"project_id\"=\"${var.clan_project_id}\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
        group_by_fields    = ["resource.label.subscription_id"]
      }
    }
  }
  user_labels = var.user_labels
}

resource "google_monitoring_alert_policy" "pub_sub_alert_policy_acknowledgment" {
  count = var.pubsub_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = [var.notification_channels[0]]
  display_name          = "Messages acknowledgment - ${var.clan_name}"
  combiner              = "AND"
  conditions {
    display_name = "Messages acknowledgment"
    condition_threshold {
      threshold_value = "1"
      filter          = "metric.type=\"pubsub.googleapis.com/subscription/num_undelivered_messages\" resource.type=\"pubsub_subscription\" resource.label.\"project_id\"=\"${var.clan_project_id}\""
      duration        = "1800s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
        group_by_fields    = ["resource.label.subscription_id"]
      }
    }
  }
  user_labels = var.user_labels
}

resource "google_monitoring_alert_policy" "pub_sub_alert_policy_push_latency" {
  count = var.pubsub_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = [var.notification_channels[0]]
  display_name          = "Push subscription latency - ${var.clan_name}"
  combiner              = "AND"
  conditions {
    display_name = "Push subscription latency"
    condition_threshold {
      threshold_value = "3000000"
      filter          = "metric.type=\"pubsub.googleapis.com/subscription/push_request_latencies\" resource.type=\"pubsub_subscription\" resource.label.\"project_id\"=\"${var.clan_project_id}\""
      duration        = "120s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_PERCENTILE_95"
        group_by_fields      = ["resource.label.subscription_id"]
      }
    }
  }
  user_labels = var.user_labels
}

resource "google_monitoring_alert_policy" "pub_sub_alert_policy_response_status" {
  count = var.pubsub_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = [var.notification_channels[0]]
  display_name          = "Response status codes 5xx - ${var.clan_name}"
  combiner              = "AND"
  conditions {
    display_name = "Response status codes 5xx"
    condition_threshold {
      threshold_value = "0"
      filter          = "metric.type=\"pubsub.googleapis.com/subscription/push_request_count\" resource.type=\"pubsub_subscription\" metric.label.\"response_class\"=\"remote_server_5xx\" metric.label.\"response_code\"!=\"unreachable_5xx_error_502\" resource.label.\"project_id\"=\"${var.clan_project_id}\""
      duration        = "120s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period     = "60s"
        cross_series_reducer = "REDUCE_PERCENTILE_05"
        per_series_aligner   = "ALIGN_RATE"
        group_by_fields      = ["resource.label.subscription_id", "metric.label.response_code"]
      }
    }
  }
  user_labels = var.user_labels
}

resource "google_monitoring_dashboard" "firestore_dashboard" {
  count = var.firestore_monitoring ? 1 : 0

  project = var.tribe_project_id
  dashboard_json = templatefile("${path.module}/templates/dashboard.firestore.json.tpl", {
    clan_project_id = var.clan_project_id
    clan_name       = var.clan_name
  })
}

resource "google_monitoring_dashboard" "cloudrun_dashboard" {
  count = var.cloudrun_monitoring ? 1 : 0

  project = var.tribe_project_id
  dashboard_json = templatefile("${path.module}/templates/dashboard.cloudrun.json.tpl", {
    clan_project_id = var.clan_project_id
    clan_name       = var.clan_name
  })
}

resource "google_monitoring_dashboard" "cloudfunction_dashboard" {
  count = var.cloudfunction_monitoring ? 1 : 0

  project = var.tribe_project_id
  dashboard_json = templatefile("${path.module}/templates/dashboard.cloudfuction.json.tpl", {
    clan_name = var.clan_name
  })
}

resource "google_monitoring_alert_policy" "cloudfunction_alert_policy" {
  count = var.cloudfunction_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = [var.notification_channels[0]]
  display_name          = "Cloud Function errors policy - ${var.clan_name}"
  combiner              = "AND"
  conditions {
    display_name = "Error messages count"
    condition_threshold {
      threshold_value = "0"
      filter          = "metric.type=\"cloudfunctions.googleapis.com/function/execution_count\" resource.type=\"cloud_function\" metric.label.\"status\"!=\"ok\" resource.label.\"project_id\"=\"${var.clan_project_id}\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
        group_by_fields    = ["metric.label.status", "resource.label.function_name"]
      }
    }
  }
  user_labels = var.user_labels
}

resource "google_monitoring_dashboard" "cloudsql_dashboard" {
  count = var.cloudsql_monitoring ? 1 : 0

  project = var.tribe_project_id
  dashboard_json = templatefile("${path.module}/templates/dashboard.cloudsql.json.tpl", {
    clan_project_id = var.clan_project_id
    clan_name       = var.clan_name
  })
}

resource "google_monitoring_alert_policy" "dataflow_alert_policy" {
  count = var.dataflow_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = [var.notification_channels[0]]
  display_name          = "Dataflow latency - ${var.clan_name}"
  combiner              = "OR"
  conditions {
    display_name = "System lag exceeds 30 seconds for 2 minutes"
    condition_threshold {
      threshold_value = 30.0
      filter          = "metric.type=\"dataflow.googleapis.com/job/system_lag\" resource.type=\"dataflow_job\" resource.label.\"project_id\"=\"${var.clan_project_id}\""
      duration        = "180s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.label.job_name"]
      }
      trigger {
        count = 1
      }
    }
  }
  conditions {
    display_name = "Data watermark lag exceeds 60 seconds for 5 minutes"
    condition_threshold {
      threshold_value = 60.0
      filter          = "metric.type=\"dataflow.googleapis.com/job/data_watermark_age\" resource.type=\"dataflow_job\" resource.label.\"project_id\"=\"${var.clan_project_id}\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.label.job_name"]
      }
      trigger {
        count = 1
      }
    }
  }
  conditions {
    display_name = "System lag increases by 70% over a 1 minute period"
    condition_threshold {
      threshold_value = 70.0
      filter          = "metric.type=\"dataflow.googleapis.com/job/system_lag\" resource.type=\"dataflow_job\" resource.label.\"project_id\"=\"${var.clan_project_id}\""
      duration        = "0s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period     = "60s"
        cross_series_reducer = "REDUCE_MEAN"
        per_series_aligner   = "ALIGN_MEAN"
        group_by_fields      = ["resource.label.job_name"]
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_PERCENT_CHANGE"
      }
      trigger {
        count = 1
      }
    }
  }
  user_labels = var.user_labels
}

resource "google_monitoring_dashboard" "dataflow_dashboard" {
  count = var.dataflow_monitoring ? 1 : 0

  project = var.tribe_project_id
  dashboard_json = templatefile("${path.module}/templates/dashboard.dataflow.json.tpl", {
    clan_project_id = var.clan_project_id
    clan_name       = var.clan_name
  })
}

resource "google_monitoring_alert_policy" "memorystore_alert_policy" {
  count = var.memorystore_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = [var.notification_channels[0]]
  display_name          = "Memory usage ratio - ${var.clan_name}"
  combiner              = "AND"
  conditions {
    display_name = "Memory usage ratio"
    condition_threshold {
      threshold_value = "0.8"
      filter          = "metric.type=\"redis.googleapis.com/stats/memory/usage_ratio\" resource.type=\"redis_instance\" resource.label.\"project_id\"=\"${var.clan_project_id}\""
      duration        = "120s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
        group_by_fields    = ["resource.label.instance_id"]
      }
    }
  }
  user_labels = var.user_labels
}

resource "google_monitoring_dashboard" "memorystore_dashboard" {
  count = var.memorystore_monitoring ? 1 : 0

  project = var.tribe_project_id
  dashboard_json = templatefile("${path.module}/templates/dashboard.memorystore.json.tpl", {
    clan_project_id = var.clan_project_id
    clan_name       = var.clan_name
  })
}
