module uptime_check {
  source = "../../modules/uptime-checks"

  project_id            = "clan-project-id"
  monitoring_project_id = "monitoring-project-id"
  project_env           = "prod"
  clan_name             = "clan"

  uptime_checks = [
    {
      service_name = "Service 1"
      timeout      = "60s"
      period       = "60s"
      check_type   = "HTTPS"
      type         = "uptime_url"
      hostname     = "service1.test.com"
      headers = {
        "foo" = "bar"
      }
    },
    {
      service_name = "Service 2"
      check_type   = "HTTP"
      timeout      = "10s"
      path         = "/healthz"
      type         = "uptime_url"
      password     = "securepassword"
      username     = "user1"
      hostname     = "service2.test1.com"
    }
  ]

  uptime_check_alerts = [
    {
      service_name    = "Service 1"
      uptime_duration = "300s"
      threshold       = 1
    }
  ]
}
