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
  notification_channels = var.notification_channels
  display_name          = "Pub/Sub DLQ Alert Policy"
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
}

resource "google_monitoring_alert_policy" "pub_sub_alert_policy_acknowledgment" {
  count = var.pubsub_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = var.notification_channels
  display_name          = "Messages acknowledgment"
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
}

resource "google_monitoring_alert_policy" "pub_sub_alert_policy_push_latency" {
  count = var.pubsub_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = var.notification_channels
  display_name          = "Push subscription latency"
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
}

resource "google_monitoring_alert_policy" "pub_sub_alert_policy_response_status" {
  count = var.pubsub_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = var.notification_channels
  display_name          = "Response status codes 5xx"
  combiner              = "AND"
  conditions {
    display_name = "Response status codes 5xx"
    condition_threshold {
      threshold_value = "5"
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

resource "google_monitoring_alert_policy" "cloudrun_alert_policy" {
  count = var.cloudrun_monitoring ? 1 : 0

  project               = var.tribe_project_id
  notification_channels = var.notification_channels
  display_name          = "CloudRun 5xx Errors"
  combiner              = "AND"
  conditions {
    display_name = "5xx errors appears"
    condition_threshold {
      threshold_value = "0"
      filter          = "metric.type=\"knative.dev/serving/revision/request_count\" resource.type=\"knative_revision\" metric.label.\"response_code_class\"=\"5xx\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
        group_by_fields    = ["resource.label.service_name"]
      }
    }
  }
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
  notification_channels = var.notification_channels
  display_name          = "Cloud Function errors policy"
  combiner              = "AND"
  conditions {
    display_name = "Error messages count"
    condition_threshold {
      threshold_value = "0"
      filter          = "metric.type=\"cloudfunctions.googleapis.com/function/execution_count\" resource.type=\"cloud_function\" metric.label.\"status\"!=\"ok\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
        group_by_fields    = ["metric.label.status", "resource.label.function_name"]
      }
    }
  }
}

resource "google_monitoring_dashboard" "cloudsql_dashboard" {
  count = var.cloudsql_monitoring ? 1 : 0

  project = var.tribe_project_id
  dashboard_json = templatefile("${path.module}/templates/dashboard.cloudsql.json.tpl", {
    clan_project_id = var.clan_project_id
    clan_name       = var.clan_name
  })
}
