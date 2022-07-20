resource "google_monitoring_custom_service" "custom_service" {
  project      = var.monitoring_project_id
  display_name = var.display_name
}

locals {
  slo_file_paths = fileset("", "${path.module}/config/*.yaml")
  file_contents  = { for fn in local.slo_file_paths : fn => yamldecode(file(fn)) }
}

module "slo-native" {
  source   = "terraform-google-modules/slo/google//modules/slo-native"
  for_each = local.slo_file_paths
  config   = local.file_contents[each.value]
}
