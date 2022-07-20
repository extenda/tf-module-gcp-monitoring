output custom_service {
  description = "The custom service"
  value       = google_monitoring_custom_service.custom_service
}

output slos {
  description = "The SLOs"
  value = {
    for k, v in module.slo-native :
    k => v.name
  }
}
