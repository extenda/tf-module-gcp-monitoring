output custom_service {
  description = "The custom service"
  value       = google_monitoring_custom_service.custom_service.id
}

output slos {
  description = "The SLOs"
  value = {
    for k, v in google_monitoring_slo.slo :
    k => v.id
  }
}
