variable monitoring_project_id {
  type        = string
  description = "Project ID to create monitoring resources in"
  default     = "hiiretail-monitoring-prod-6500"
}

variable display_name {
  type        = string
  description = "Display name of the custom service"
}

variable project_id {
  description = "Project ID to create SLOs in"
  type        = string
  default     = "hiiretail-monitoring-prod-6500"
}

variable slo_config {
  description = "Configuration for SLO"
  type        = any
}
