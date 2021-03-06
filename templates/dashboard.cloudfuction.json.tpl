{
   "displayName":"Cloud Function - ${clan_name} [tf]",
   "gridLayout":{
      "columns":"2",
      "widgets":[
         {
            "title":"Executions",
            "xyChart":{
               "dataSets":[
                  {
                     "timeSeriesQuery":{
                        "timeSeriesFilter":{
                           "filter":"metric.type=\"cloudfunctions.googleapis.com/function/execution_count\" resource.type=\"cloud_function\"",
                           "aggregation":{
                              "perSeriesAligner":"ALIGN_DELTA",
                              "crossSeriesReducer":"REDUCE_COUNT",
                              "groupByFields":[
                                 "metric.label.\"status\"",
                                 "resource.label.\"function_name\""
                              ]
                           }
                        },
                        "unitOverride":"1"
                     },
                     "plotType":"LINE"
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
            "title":"Memory usage",
            "xyChart":{
               "dataSets":[
                  {
                     "timeSeriesQuery":{
                        "timeSeriesFilter":{
                           "filter":"metric.type=\"cloudfunctions.googleapis.com/function/user_memory_bytes\" resource.type=\"cloud_function\"",
                           "aggregation":{
                              "perSeriesAligner":"ALIGN_DELTA",
                              "crossSeriesReducer":"REDUCE_PERCENTILE_99",
                              "groupByFields":[
                                 "metric.label.\"status\"",
                                 "resource.label.\"function_name\""
                              ]
                           }
                        },
                        "unitOverride":"By"
                     },
                     "plotType":"LINE",
                     "minAlignmentPeriod":"60s"
                  }
               ],
               "chartOptions":{
                  "mode":"COLOR"
               },
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
