locals {
  default_timeout = "10s"
  default_period  = "60s"
}

resource "google_monitoring_uptime_check_config" "uptime_check_config" {
  for_each = { for i in var.uptime_checks : i.service_name => i }

  display_name = "[${var.project_env} - ${var.clan_name}] ${each.value.service_name} API Uptimecheck"
  timeout      = lookup(each.value, "timeout", local.default_timeout)
  period       = lookup(each.value, "period", local.default_period)

  selected_regions = lookup(each.value, "regions", []) //Global used by default

  project = var.monitoring_project_id

  dynamic "http_check" {
    for_each = (lookup(each.value, "check_type", null) != null) ? [each.value.check_type] : []
    content {
      path           = lookup(each.value, "path", "/")
      port           = (lookup(each.value, "check_type", null) == "HTTP" ? "80" : "443")
      use_ssl        = (lookup(each.value, "check_type", null) == "HTTP" ? false : true)
      validate_ssl   = (lookup(each.value, "check_type", null) == "HTTP" ? false : true)
      request_method = lookup(each.value, "request_method", "GET")
      dynamic "auth_info" {
        for_each = (lookup(each.value, "password", null) != null) ? [each.value.password] : []
        content {
          password = lookup(each.value, "password", null)
          username = lookup(each.value, "username", null)
        }
      }
      headers      = (lookup(each.value, "headers", null) != null) ? each.value.headers : null
      body         = lookup(each.value, "body", null)
      content_type = lookup(each.value, "content_type", null) 
    }
  }

  dynamic "monitored_resource" {
    for_each = (lookup(each.value, "type", null) != null) ? [each.value.type] : []
    content {
      type   = lookup(each.value, "type", "uptime_url")
      labels = {
        host       = lookup(each.value, "hostname", null)
        project_id = var.project_id
      }
    }
  }

  dynamic "content_matchers" {
    for_each = (lookup(each.value, "content", null) != null) ? [each.value.content] : []
    content {
      content = lookup(each.value, "content", null)
      matcher = lookup(each.value, "matcher", null)
      json_path_matcher {
        json_path    = lookup(each.value, "json_path", null)
        json_matcher = lookup(each.value, "json_matcher", null)
      }
    }
  }
}

resource "google_monitoring_alert_policy" "uptime_check_alert_policy" {
  for_each = (var.uptime_check_alerts != {}) ? { for i in var.uptime_check_alerts : i.service_name => i } : {}

  project               = var.monitoring_project_id
  display_name          = "[P1 ${var.project_env}] ${each.value.service_name} - Service is offline"
  notification_channels = var.notification_channels
  combiner              = "OR"
  conditions {
    display_name = "Failure of uptimecheck for ${each.value.service_name}"
    condition_threshold {
      filter = <<EOT
metric.type="monitoring.googleapis.com/uptime_check/check_passed" AND metric.label.check_id="${google_monitoring_uptime_check_config.uptime_check_config[each.value.service_name].uptime_check_id}" AND resource.type="uptime_url"
      EOT

      duration        = lookup(each.value, "uptime_duration", "300s")
      threshold_value = lookup(each.value, "threshold", 1)
      comparison      = "COMPARISON_GT"
      aggregations {
        alignment_period     = "1200s"
        cross_series_reducer = "REDUCE_COUNT_FALSE"
        per_series_aligner   = "ALIGN_NEXT_OLDER"
        group_by_fields      = ["resource.label.host"]
      }

      trigger {
        count   = 1
      }
    }
  }
  user_labels = lookup(each.value, "labels", {})

  depends_on = [google_monitoring_uptime_check_config.uptime_check_config]
}