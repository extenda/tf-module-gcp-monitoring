resource "google_monitoring_alert_policy" "alert_policy" {
  for_each = { for alert in var.policies : alert.display_name => alert }

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
        comparison         = conditions.value.condition_threshold["comparison"]
        filter             = conditions.value.condition_threshold["filter"]
        threshold_value    = conditions.value.condition_threshold["threshold_value"]
        duration           = lookup(conditions.value.condition_threshold, "duration", "0s")
        denominator_filter = lookup(conditions.value, "denominator_filter", "")

        dynamic "aggregations" {
          for_each = lookup(conditions.value, "condition_threshold.aggregations", [])
          content {
            alignment_period     = lookup(aggregations.value, "alignment_period", null)
            per_series_aligner   = lookup(aggregations.value, "per_series_aligner", null)
            cross_series_reducer = lookup(aggregations.value, "cross_series_reducer", null)
            group_by_fields      = lookup(aggregations.value, "group_by_fields", [])
          }
        }

        dynamic "denominator_aggregations" {
          for_each = lookup(conditions.value, "condition_threshold.denominator_aggregations", [])
          content {
            alignment_period     = lookup(denominator_aggregations.value, "alignment_period", null)
            per_series_aligner   = lookup(denominator_aggregations.value, "per_series_aligner", null)
            cross_series_reducer = lookup(denominator_aggregations.value, "cross_series_reducer", null)
            group_by_fields      = lookup(denominator_aggregations.value, "group_by_fields", [])
          }
        }

        trigger {
          count   = lookup(conditions.value.condition_threshold, "trigger.count", null)
          percent = lookup(conditions.value.condition_threshold, "trigger.percent", null)
        }
      }
    }
  }


  alert_strategy {
    auto_close = lookup(each.value, "alert_strategy.auto_close", null)
  }

  documentation {
    mime_type = lookup(each.value, "documentation.mime_type", "text/markdown")
    content   = lookup(each.value, "documentation.content", "")
  }

}
