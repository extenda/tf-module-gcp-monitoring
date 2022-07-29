module "alerts" {
  source                = "../../modules/alerts"
  monitoring_project_id = "monitoring-project-id"

  # Note: looks cleaner when reading input from a file instead.
  policies = [
    {
      display_name = "CPU utilization over 90%"
      conditions = [
        {
          display_name = "Cloud SQL Database - CPU utilization"
          condition_threshold = {
            comparison      = "COMPARISON_GE"
            threshold_value = 0.90
            filter          = <<EOF
resource.type = "cloudsql_database" AND
resource.labels.database_id ="my-db" AND
metric.type = "cloudsql.googleapis.com/database/cpu/utilization"
EOF
          }
        }
      ]
    }
  ]
}
