{
  "displayName": "Cloud Run - ${clan_name} [tf]",
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "Cloud Run CPU Utilization",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "targetAxis":"Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "perSeriesAligner": "ALIGN_MEAN"
                  },
                  "filter": "metric.type=\"kubernetes.io/container/cpu/limit_utilization\" resource.type=\"k8s_container\" metadata.user_labels.\"service_project_id\"=\"${clan_project_id}\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "percent"
              }
            }
          ],
          "thresholds": [
            {
              "label": "label",
              "value": 0.8500000238418579
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Cloud Run Memory Utilization",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "targetAxis":"Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "perSeriesAligner": "ALIGN_MEAN"
                  },
                  "filter": "metric.type=\"kubernetes.io/container/memory/limit_utilization\" resource.type=\"k8s_container\" metadata.user_labels.\"service_project_id\"=\"${clan_project_id}\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "percent"
              }
            }
          ],
          "thresholds": [
            {
              "label": "label",
              "value": 0.8500000238418579
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Cloud Run Number of Pods",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "targetAxis":"Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [
                      "resource.label.\"service_name\""
                    ],
                    "perSeriesAligner": "ALIGN_MEAN"
                  },
                  "filter": "metric.type=\"knative.dev/serving/autoscaler/actual_pods\" resource.type=\"knative_revision\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "1"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Cloud Run Requests Count",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "targetAxis":"Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [
                      "resource.label.\"service_name\"",
                      "metric.label.\"response_code_class\""
                    ],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"knative.dev/serving/revision/request_count\" resource.type=\"knative_revision\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "1"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      }
    ]
  }
}
