module "alert" {
  source                = "/Users/user/Desktop/gcp-monitoring/tf-module-gcp-monitoring/modules/alert"
  monitoring_project_id = "hiiretail-monitoring-prod-6500"
  policies              = yamldecode(file("alerts.yaml"))
}