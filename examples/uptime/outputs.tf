output uptime_check_names {
  description = "A unique resource name for UptimeCheckConfig"
  value       = module.uptime_check.uptime_check_names
}

output uptime_check_ids {
  description = "The id of the uptime check"
  value       = module.uptime_check.uptime_check_ids
}
