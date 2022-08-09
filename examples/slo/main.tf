module "slo" {
  source                = "../../modules/slo"
  monitoring_project_id = "monitoring-project-id"
  service_name          = "my-awesome-service"
  slos                  = yamldecode(file("slos.yaml"))
}
