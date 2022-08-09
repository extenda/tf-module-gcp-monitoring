resource "google_monitoring_custom_service" "custom_service" {
  project      = var.monitoring_project_id
  display_name = var.service_name
}

resource "google_monitoring_slo" "slo" {
  for_each = { for i in var.slos : i.slo_id => i }

  service             = google_monitoring_custom_service.custom_service.service_id
  project             = var.project_id
  slo_id              = each.value.slo_id
  display_name        = each.value.display_name
  goal                = each.value.goal
  calendar_period     = lookup(each.value, "calendar_period", null)
  rolling_period_days = lookup(each.value, "rolling_period_days", null)

  dynamic "basic_sli" {
    for_each = lookup(each.value, "type") == "basic_sli" ? ["yes"] : []
    content {
      latency {
        threshold = lookup(each.value, "latency_threshold", null)
      }
    }
  }

  dynamic "request_based_sli" {
    for_each = lookup(each.value, "type") == "request_based_sli" ? ["yes"] : []
    content {

      dynamic "distribution_cut" {
        for_each = lookup(each.value, "method", null) == "distribution_cut" ? ["yes"] : []
        content {
          distribution_filter = lookup(each.value, "metric_filter", null)
          range {
            min = lookup(each.value, "range_min", null)
            max = lookup(each.value, "range_max", null)
          }
        }
      }

      dynamic "good_total_ratio" {
        for_each = lookup(each.value, "method", null) == "good_total_ratio" ? ["yes"] : []
        content {
          good_service_filter  = lookup(each.value, "good_service_filter", null)
          bad_service_filter   = lookup(each.value, "bad_service_filter", null)
          total_service_filter = lookup(each.value, "total_service_filter", null)
        }
      }
    }
  }

  dynamic "windows_based_sli" {
    for_each = lookup(each.value, "type") == "windows_based_sli" ? ["yes"] : []
    content {
      window_period = lookup(each.value, "window_period", null)

      good_bad_metric_filter = lookup(each.value, "method", null) == "boolean_filter" ? lookup(each.value, "metric_filter", null) : null

      dynamic "good_total_ratio_threshold" {
        for_each = lookup(each.value, "method", null) == "performance_window" ? ["yes"] : []
        content {
          threshold = lookup(each.value, "threshold", null)

          dynamic "performance" {
            for_each = lookup(each.value, "method_performance", null) == "good_total_ratio" || lookup(each.value, "method_performance", null) == "distribution_cut" ? ["yes"] : []
            content {
              dynamic "good_total_ratio" {
                for_each = lookup(each.value, "method_performance", null) == "good_total_ratio" ? ["yes"] : []
                content {
                  good_service_filter  = lookup(each.value, "good_service_filter", null)
                  bad_service_filter   = lookup(each.value, "bad_service_filter", null)
                  total_service_filter = lookup(each.value, "total_service_filter", null)
                }
              }
              dynamic "distribution_cut" {
                for_each = lookup(each.value, "method_performance", null) == "distribution_cut" ? ["yes"] : []
                content {
                  distribution_filter = lookup(each.value, "metric_filter", null)
                  range {
                    min = lookup(each.value, "range_min", null)
                    max = lookup(each.value, "range_max", null)
                  }
                }
              }
            }
          }

          dynamic "basic_sli_performance" {
            for_each = lookup(each.value, "method_performance", null) == "basic_sli_performance" ? ["yes"] : []
            content {
              method   = lookup(each.value, "api_method", null)
              location = lookup(each.value, "api_location", null)
              version  = lookup(each.value, "api_version", null)
              latency {
                threshold = lookup(each.value, "latency_threshold", null)
              }
            }
          }
        }
      }

      dynamic "metric_mean_in_range" {
        for_each = lookup(each.value, "method", null) == "metric_mean_in_range" ? ["yes"] : []
        content {
          time_series = lookup(each.value, "metric_filter", null)
          range {
            min = lookup(each.value, "range_min", null)
            max = lookup(each.value, "range_max", null)
          }
        }
      }

      dynamic "metric_sum_in_range" {
        for_each = lookup(each.value, "method", null) == "metric_sum_in_range" ? ["yes"] : []
        content {
          time_series = lookup(each.value, "metric_filter", null)
          range {
            min = lookup(each.value, "range_min", null)
            max = lookup(each.value, "range_max", null)
          }
        }
      }
    }
  }
}
