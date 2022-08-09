module "uptime-check" {
  source                = "../../modules/uptime-check"
  monitoring_project_id = "monitoring-project-id"
  uptime_checks         = yamldecode(file("uptime-checks.yaml"))
  labels = {
    clan = "sre",
    cc   = "1337"
  }
}
