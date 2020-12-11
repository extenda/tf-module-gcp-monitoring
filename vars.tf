variable tribe_project_id {
  type        = string
  description = "Project ID where the Monitoring resources will be created"
}

variable clan_project_id {
  type        = string
  description = "Clan Project ID"
}

variable clan_name {
  type        = string
  description = "The name of the clan"
}

variable notification_channels {
  type        = list
  description = "List of notificaton channel IDs"
  default     = []
}

variable pubsub_monitoring {
    type        = bool
    description = "If the Pub/Sub dashboards and alerts should be created"
    default     = false
}

variable cloudrun_monitoring {
    type        = bool
    description = "If the Cloud Run dashboards and alerts should be created"
    default     = false
}

variable firestore_monitoring {
    type        = bool
    description = "If the Firestore dashboards and alerts should be created"
    default     = false
}

variable cloudfunction_monitoring {
    type        = bool
    description = "If the Cloud Function dashboards and alerts should be created"
    default     = false
}

variable cloudsql_monitoring {
    type        = bool
    description = "If the Cloud SQL dashboards and alerts should be created"
    default     = false
}
