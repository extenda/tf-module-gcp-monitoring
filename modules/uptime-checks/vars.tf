variable project_id {
  type        = string
  description = "Project ID to associate with uptime check"
}

variable monitoring_project_id {
  type        = string
  description = "Project ID to create monitoring resources in"
}

variable uptime_checks {
  type        = any
  description = "The list of uptime checks configurations"
}

# After we update to terraform v1.3.0 we'll be able to use the structure below 
# variable uptime_checks {
#   type = list(object({
#     service_name = string
#     timeout = optional(string) // must be between 1 and 60 seconds
#     period = optional(string) // supported 60s, 300s, 600s, 900s
#     check_type = string // HTTP, HTTPS
#     type = string // uptime_url
#     hostname = string
#     headers = optional(map(string))
#     body = optional(string)
#     content_type = optional(string) // TYPE_UNSPECIFIED and URL_ENCODED.
#     path = string
#     password = optional(string)
#     username = optional(string)
#     request_method = optional(string) //METHOD_UNSPECIFIED, GET, and POST.
#     port = optional(string)
#     use_ssl = optional(bool)
#     validate_ssl = optional(bool)
#     regions = optional(list(string))
#     content = optional(string)
#     matcher = optional(string) // CONTAINS_STRING, NOT_CONTAINS_STRING, MATCHES_REGEX, NOT_MATCHES_REGEX, MATCHES_JSON_PATH, and NOT_MATCHES_JSON_PATH
#     json_path = optional(string)
#     json_matcher = optional(string) // EXACT_MATCH and REGEX_MATCH
#   }))
#   description = "The list of uptime checks configurations"
# }

variable project_env {
  type        = string
  description = "Project environment associated with uptime check"
  default     = ""
}

variable uptime_check_alerts {
  type        = any
  description = "Configuration for uptime check alerts"
  default     = []
}

# After we update to terraform v1.3.0 we'll be able to use the structure below 
# variable uptime_check_alerts {
#   type = list(object({
#     service_name = string
#     uptime_duration = string
#     threshold = optional(number)
#     labels = map(strings)
#   }))
#   description = "Configuration for uptime check alerts"
# }

variable notification_channels {
  type        = list
  description = "List of notificaton channel IDs"
  default     = []
}

variable clan_name {
  type        = string
  description = "The name of the clan"
  default     = ""
}
