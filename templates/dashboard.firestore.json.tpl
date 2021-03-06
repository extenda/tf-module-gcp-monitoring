{
   "displayName":"Firestore - ${clan_name} [tf]",
   "gridLayout":{
      "columns":"2",
      "widgets":[
         {
            "title":"Document reads",
            "xyChart":{
               "dataSets":[
                  {
                     "timeSeriesQuery":{
                        "timeSeriesFilter":{
                           "filter":"metric.type=\"firestore.googleapis.com/document/read_count\" resource.type=\"firestore_instance\" resource.label.\"project_id\"=\"${clan_project_id}\"",
                           "aggregation":{
                              "perSeriesAligner":"ALIGN_DELTA",
                              "crossSeriesReducer":"REDUCE_MEAN",
                              "groupByFields":[
                                 "metric.label.\"type\""
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
            "title":"Document writes",
            "xyChart":{
               "dataSets":[
                  {
                     "timeSeriesQuery":{
                        "timeSeriesFilter":{
                           "filter":"metric.type=\"firestore.googleapis.com/document/write_count\" resource.type=\"firestore_instance\" resource.label.\"project_id\"=\"${clan_project_id}\"",
                           "aggregation":{
                              "perSeriesAligner":"ALIGN_DELTA",
                              "crossSeriesReducer":"REDUCE_MEAN",
                              "groupByFields":[
                                 "metric.label.\"type\""
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
            "title":"Document deletes",
            "xyChart":{
               "dataSets":[
                  {
                     "timeSeriesQuery":{
                        "timeSeriesFilter":{
                           "filter":"metric.type=\"firestore.googleapis.com/document/delete_count\" resource.type=\"firestore_instance\" resource.label.\"project_id\"=\"${clan_project_id}\"",
                           "aggregation":{
                              "perSeriesAligner":"ALIGN_DELTA",
                              "crossSeriesReducer":"REDUCE_MEAN",
                              "groupByFields":[
                                 "metric.label.\"type\""
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
         }
      ]
   }
}
