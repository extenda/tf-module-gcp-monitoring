# NOTE! to run the example move config folder to modules/slos/ folder!

module slos {
  source = "../../modules/slos"

  display_name          = "my-service"
  monitoring_project_id = "monitoring-project-id"

  slo_config = [
    {
      slo_id = "month-latency"
      project_id = "hiiretail-monitoring-prod-6500"
      service = "sre.exdash-test"
      display_name = "Month | Latency"
      goal = "0.95"
      calendar_period = "MONTH"
      type = "request_based_sli"
      method = "distribution_cut"
      metric_filter = <<EOF
metric.type="knative.dev/serving/revision/request_latencies"
resource.type="knative_revision"
resource.labels.service_name="exdash-test"
EOF
      range_min = "0"
      range_max = "100"
    },
    {
      slo_id = "month-error-rate"
      project_id = "hiiretail-monitoring-prod-6500"
      service = "sre.exdash-test"
      display_name = "Month | Error rate"
      goal = "0.999"
      calendar_period = "MONTH"
      type = "request_based_sli"
      method = "good_total_ratio"
      bad_service_filter = <<EOF
metric.type="knative.dev/serving/revision/request_count"
resource.type="knative_revision"
metric.labels.response_code_class="5xx"
resource.labels.service_name="exdash-test"
EOF
      total_service_filter = <<EOF
metric.type="knative.dev/serving/revision/request_count"
resource.type="knative_revision"
resource.labels.service_name="exdash-test"
EOF
    }
  ]
}
