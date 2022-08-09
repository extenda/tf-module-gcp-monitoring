variable "project_id" {
  type        = string
  description = "Project ID to associate with monitoring resource"
}

variable "monitoring_project_id" {
  type        = string
  description = "Project ID to create monitoring resources in"
  default     = "hiiretail-monitoring-prod-6500"
}

variable "uptime_checks" {
  type        = any
  description = "The list of uptime checks configurations"
}

variable "uptime_check_alerts" {
  type        = any
  description = "Configuration for uptime check alerts"
  default     = []
}

variable "notification_channels" {
  type        = list(any)
  description = "List of notification channel IDs"
  default     = []
}

variable "clan_name" {
  type        = string
  description = "The name of the clan"
  default     = ""
}
