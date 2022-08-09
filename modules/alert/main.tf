resource "google_monitoring_alert_policy" "alert_policy" {
  for_each = { for alert in var.policies : alert.display_name => alert }

  project               = var.monitoring_project_id
  display_name          = each.value["display_name"]
  user_labels           = var.user_labels
  notification_channels = var.notification_channels
  enabled               = lookup(each.value, "enabled", "true")
  combiner              = lookup(each.value, "combiner", "OR")

  dynamic "conditions" {
    for_each = each.value["conditions"]
    content {
      display_name = conditions.value["display_name"]
      condition_threshold {
        comparison         = lookup(conditions.value.condition_threshold, "comparison", "COMPARISON_GT")
        filter             = lookup(conditions.value.condition_threshold, "filter")
        threshold_value    = lookup(conditions.value.condition_threshold, "threshold_value")
        duration           = lookup(conditions.value.condition_threshold, "duration", "0s")
        denominator_filter = lookup(conditions.value.condition_threshold, "denominator_filter", "")

        dynamic "aggregations" {
          for_each = lookup(conditions.value.condition_threshold, "aggregations")
          content {
            alignment_period     = lookup(aggregations.value, "alignment_period", null)
            per_series_aligner   = lookup(aggregations.value, "per_series_aligner", null)
            cross_series_reducer = lookup(aggregations.value, "cross_series_reducer", null)
            group_by_fields      = lookup(aggregations.value, "group_by_fields", [])
          }
        }

        dynamic "denominator_aggregations" {
          for_each = lookup(conditions.value.condition_threshold, "denominator_aggregations", [])
          content {
            alignment_period     = lookup(denominator_aggregations.value, "alignment_period", null)
            per_series_aligner   = lookup(denominator_aggregations.value, "per_series_aligner", null)
            cross_series_reducer = lookup(denominator_aggregations.value, "cross_series_reducer", null)
            group_by_fields      = lookup(denominator_aggregations.value, "group_by_fields", [])
          }
        }

        trigger {
          count   = lookup(lookup(conditions.value.condition_threshold, "trigger", {}), "count", null)
          percent = lookup(lookup(conditions.value.condition_threshold, "trigger", {}), "percent", null)
        }
      }

      dynamic "condition_monitoring_query_language" {
        for_each = lookup(conditions.value, "condition_monitoring_query_language", [])
        content {
          query                   = lookup(conditions.value, "query", "")
          duration                = lookup(conditions.value, "duration", "")
          evaluation_missing_data = lookup(conditions.value, "evaluation_missing_data", null)
        }
      }

      dynamic "condition_matched_log" {
        for_each = lookup(conditions.value, "condition_matched_log", [])
        content {
          filter           = lookup(condition_matched_log.value, "filter", "")
          label_extractors = lookup(condition_matched_log.value, "label_extractors", null)
        }
      }
    }
  }

  alert_strategy {
    auto_close = lookup(lookup(each.value, "alert_strategy", {}), "auto_close", null)
  }

  documentation {
    mime_type = lookup(lookup(each.value, "documentation", {}), "mime_type", "text/markdown")
    content   = lookup(lookup(each.value, "documentation", {}), "content", "Generated with terraform")
  }
}
