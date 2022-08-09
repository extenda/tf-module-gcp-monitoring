output uptime_check_names {
  description = "A unique resource name for UptimeCheckConfig"
  value       = {
    for k, v in google_monitoring_uptime_check_config.uptime_check_config :
    k => v.name
  }
}

output uptime_check_ids {
  description = "The id of the uptime check"
  value       = {
    for k, v in google_monitoring_uptime_check_config.uptime_check_config :
    k => v.uptime_check_id
  }
}
