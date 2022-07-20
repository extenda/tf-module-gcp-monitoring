resource "google_monitoring_custom_service" custom_service {
  project      = var.monitoring_project_id
  display_name = var.display_name
}

module slo-native {
  source   = "terraform-google-modules/slo/google//modules/slo-native"
  for_each = var.slo_configs
  config   = each.value

  slo_configs = { for fn in fileset("", "${path.module}/configs/*.yaml") : fn => yamldecode(file(fn)) }
}
