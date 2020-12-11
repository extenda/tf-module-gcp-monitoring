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
        group_by_fields    = ["resource.labels.name"]
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
