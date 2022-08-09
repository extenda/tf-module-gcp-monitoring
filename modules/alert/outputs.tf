output alert_ids {
  description = "The id of the alerts"
  value       = {
    for k, v in google_monitoring_alert_policy.alert_policy :
    k => v.id
  }
}
