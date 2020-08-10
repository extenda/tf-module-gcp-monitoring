data "google_secret_manager_secret_version" "monitoring_slack_token" {
  project = var.project_id_slack_token
  secret  = "monitoring-slack-token"
}

resource "google_monitoring_notification_channel" "clan_email" {
  count        = var.clan_group_email != "" ? 1 : 0
  project      = var.tribe_project_id
  display_name = "Notification Email channel for ${var.clan_name} clan"
  type         = "email"
  labels = {
    email_address = var.clan_group_email
  }
}

resource "google_monitoring_notification_channel" "clan_slack_channel" {
  count        = var.clan_slack_channel != "" ? 1 : 0
  project      = var.tribe_project_id
  display_name = "Notification Slack channel for ${var.clan_name} clan"
  type         = "slack"
  labels = {
    channel_name = var.clan_slack_channel
  }
  sensitive_labels {
    auth_token = data.google_secret_manager_secret_version.monitoring_slack_token.secret_data
  }
}
