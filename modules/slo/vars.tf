variable monitoring_project_id {
  type        = string
  description = "Project ID to create monitoring resources in"
  default     = "hiiretail-monitoring-prod-6500"
}

variable service_name {
  type        = string
  description = "Display name of the custom service"
}

variable project_id {
  description = "Project ID to create SLOs in"
  type        = string
  default     = "hiiretail-monitoring-prod-6500"
}

variable slos {
  description = "Configuration for SLO"
  type        = any
}
