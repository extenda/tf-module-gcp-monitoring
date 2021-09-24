{
   "displayName":"Cloud SQL - ${clan_name} [tf]",
   "gridLayout":{
      "columns":"2",
      "widgets":[
         {
            "title":"CPU utilization",
            "xyChart":{
               "dataSets":[
                  {
                     "minAlignmentPeriod":"60s",
                     "timeSeriesQuery":{
                        "timeSeriesFilter":{
                           "filter":"metric.type=\"cloudsql.googleapis.com/database/cpu/utilization\" resource.type=\"cloudsql_database\" resource.label.\"project_id\"=\"${clan_project_id}\"",
                           "aggregation":{
                              "perSeriesAligner":"ALIGN_MEAN",
                              "crossSeriesReducer":"REDUCE_MEAN",
                              "groupByFields":[
                                 "resource.label.\"database_id\""
                              ]
                           }
                        }
                     },
                     "plotType":"LINE",
                     "targetAxis":"Y1"
                  }
               ],
               "timeshiftDuration":"0s",
               "yAxis":{
                  "label":"y1Axis",
                  "scale":"LINEAR"
               }
            }
         },
         {
            "title":"Disk utilization",
            "xyChart":{
               "dataSets":[
                  {
                     "minAlignmentPeriod":"60s",
                     "timeSeriesQuery":{
                        "timeSeriesFilter":{
                           "filter":"metric.type=\"cloudsql.googleapis.com/database/disk/utilization\" resource.type=\"cloudsql_database\" resource.label.\"project_id\"=\"${clan_project_id}\"",
                           "aggregation":{
                              "perSeriesAligner":"ALIGN_MEAN",
                              "crossSeriesReducer":"REDUCE_MEAN",
                              "groupByFields":[
                                 "resource.label.\"database_id\""
                              ]
                           }
                        },
                        "unitOverride":"1"
                     },
                     "plotType":"LINE",
                     "targetAxis":"Y1"
                  }
               ],
               "timeshiftDuration":"0s",
               "yAxis":{
                  "label":"y1Axis",
                  "scale":"LINEAR"
               }
            }
         },
         {
            "title":"Memory utilization",
            "xyChart":{
               "dataSets":[
                  {
                     "minAlignmentPeriod":"60s",
                     "timeSeriesQuery":{
                        "timeSeriesFilter":{
                           "filter":"metric.type=\"cloudsql.googleapis.com/database/memory/utilization\" resource.type=\"cloudsql_database\" resource.label.\"project_id\"=\"${clan_project_id}\"",
                           "aggregation":{
                              "perSeriesAligner":"ALIGN_MEAN",
                              "crossSeriesReducer":"REDUCE_MEAN",
                              "groupByFields":[
                                 "resource.label.\"database_id\""
                              ]
                           }
                        },
                        "unitOverride":"1"
                     },
                     "plotType":"LINE",
                     "targetAxis":"Y1"
                  }
               ],
               "timeshiftDuration":"0s",
               "yAxis":{
                  "label":"y1Axis",
                  "scale":"LINEAR"
               }
            }
         }
      ]
   }
}
