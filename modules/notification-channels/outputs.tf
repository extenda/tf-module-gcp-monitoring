output notification_channels {
  description = "The list of notification channels"
  value       = flatten([google_monitoring_notification_channel.clan_email.*.id, google_monitoring_notification_channel.clan_slack_channel.*.id])
}
