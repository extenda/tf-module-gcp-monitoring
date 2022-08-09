module "uptimechecks" {
  source = "./modules/uptime-checks"

  project_id            = var.project_id
  monitoring_project_id = var.monitoring_project_id
  uptime_checks         = var.uptime_checks
  clan_name             = var.clan_name
  uptime_check_alerts   = var.uptime_check_alerts
  notification_channels = var.notification_channels
}
