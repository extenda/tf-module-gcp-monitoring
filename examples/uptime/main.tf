module "uptime-check" {
  source                = "/Users/user/Desktop/gcp-monitoring/tf-module-gcp-monitoring/modules/uptime-check"
  monitoring_project_id = "monitoring-project-id"

  uptime_checks = [
    {
      service_name = "sre.my-app",
      hostname     = "my-app.com",
    },
    {
      service_name = "sre.example",
      hostname     = "example.com",
      path         = "/healthz",
    },
  ]
  labels = {
    clan = "sre",
    cc   = "1337"
  }
}