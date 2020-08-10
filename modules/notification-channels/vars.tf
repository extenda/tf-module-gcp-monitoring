variable tribe_project_id {
  type        = string
  description = "Project ID where the Monitoring resources will be created"
}

variable clan_name {
  type        = string
  description = "The name of the clan"
}

variable clan_group_email {
  type        = string
  description = "GSuite email of the clan group"
  default     = ""
}

variable clan_slack_channel {
  type        = string
  description = "The slack channel for alerts"
  default     = ""
}

variable project_id_slack_token {
  type        = string
  description = "Project ID where an authorization token for a notification channel is stored"
  default     = ""
}
