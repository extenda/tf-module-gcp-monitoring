# tf-module-gcp-monitoring

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.18 |
| google | >= 3.8 |
| google-beta | >= 3.8 |

## Providers

| Name | Version |
|------|---------|
| google | >= 3.8 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| clan\_name | The name of the clan | `string` | n/a | yes |
| clan\_project\_id | Clan Project ID | `string` | n/a | yes |
| cloudfunction\_monitoring | If the Cloud Function dashboards and alerts should be created | `bool` | `false` | no |
| cloudrun\_monitoring | If the Cloud Run dashboards and alerts should be created | `bool` | `false` | no |
| cloudsql\_monitoring | If the Cloud SQL dashboards and alerts should be created | `bool` | `false` | no |
| dataflow\_monitoring | If the Dataflow dashboards and alerts should be created | `bool` | `false` | no |
| dlq\_count\_alignment\_period | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | `"60s"` | no |
| dlq\_count\_comparison | The comparison to apply between the time series and the threshold. Only COMPARISON\_LT and COMPARISON\_GT are supported currently. | `string` | `"COMPARISON_GT"` | no |
| dlq\_count\_duration | The amount of time that a time series must violate the threshold to be considered failing for DLQ messages count alert | `string` | `"60s"` | no |
| dlq\_count\_per\_series\_aligner | The approach to be used to align individual time series. | `string` | `"ALIGN_COUNT"` | no |
| dlq\_count\_threshold\_value | A value against which to compare the time series for DLQ messages count alert | `string` | `"0"` | no |
| firestore\_monitoring | If the Firestore dashboards and alerts should be created | `bool` | `false` | no |
| func\_message\_count\_alignment\_period | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | `"60s"` | no |
| func\_message\_count\_comparison | The comparison to apply between the time series and the threshold. Only COMPARISON\_LT and COMPARISON\_GT are supported currently. | `string` | `"COMPARISON_GT"` | no |
| func\_message\_count\_duration | The amount of time that a time series must violate the threshold to be considered failing. | `string` | `"60s"` | no |
| func\_message\_count\_per\_series\_aligner | The approach to be used to align individual time series. | `string` | `"ALIGN_COUNT"` | no |
| func\_message\_count\_threshold\_value | A value against which to compare the time series. | `string` | `"0"` | no |
| memory\_usage\_alignment\_period | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | `"60s"` | no |
| memory\_usage\_comparison | The comparison to apply between the time series and the threshold. Only COMPARISON\_LT and COMPARISON\_GT are supported currently. | `string` | `"COMPARISON_GT"` | no |
| memory\_usage\_duration | The amount of time that a time series must violate the threshold to be considered failing. | `string` | `"120s"` | no |
| memory\_usage\_per\_series\_aligner | The approach to be used to align individual time series. | `string` | `"ALIGN_MEAN"` | no |
| memory\_usage\_threshold\_value | A value against which to compare the time series. | `string` | `"0.8"` | no |
| memorystore\_monitoring | If the Memorystore dashboards and alerts should be created | `bool` | `false` | no |
| msg\_ack\_alignment\_period | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | `"60s"` | no |
| msg\_ack\_comparison | The comparison to apply between the time series and the threshold. Only COMPARISON\_LT and COMPARISON\_GT are supported currently. | `string` | `"COMPARISON_GT"` | no |
| msg\_ack\_duration | The amount of time that a time series must violate the threshold to be considered failing. | `string` | `"1800s"` | no |
| msg\_ack\_per\_series\_aligner | The approach to be used to align individual time series. | `string` | `"ALIGN_COUNT"` | no |
| msg\_ack\_threshold\_value | A value against which to compare the time series. | `string` | `"1"` | no |
| notification\_channels | List of notificaton channel IDs | `list` | `[]` | no |
| pubsub\_monitoring | If the Pub/Sub dashboards and alerts should be created | `bool` | `false` | no |
| push\_latency\_alignment\_period | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | `"60s"` | no |
| push\_latency\_comparison | The comparison to apply between the time series and the threshold. Only COMPARISON\_LT and COMPARISON\_GT are supported currently. | `string` | `"COMPARISON_GT"` | no |
| push\_latency\_cross\_series\_reducer | The approach to be used to combine time series. | `string` | `"REDUCE_PERCENTILE_95"` | no |
| push\_latency\_duration | The amount of time that a time series must violate the threshold to be considered failing. | `string` | `"120s"` | no |
| push\_latency\_per\_series\_aligner | The approach to be used to align individual time series. | `string` | `"ALIGN_DELTA"` | no |
| push\_latency\_threshold\_value | A value against which to compare the time series. | `string` | `"3000000"` | no |
| reponse\_code\_alignment\_period | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | `"60s"` | no |
| reponse\_code\_comparison | The comparison to apply between the time series and the threshold. Only COMPARISON\_LT and COMPARISON\_GT are supported currently. | `string` | `"COMPARISON_GT"` | no |
| reponse\_code\_cross\_series\_reducer | The approach to be used to combine time series. | `string` | `"REDUCE_PERCENTILE_05"` | no |
| reponse\_code\_duration | The amount of time that a time series must violate the threshold to be considered failing. | `string` | `"120s"` | no |
| reponse\_code\_per\_series\_aligner | The approach to be used to align individual time series. | `string` | `"ALIGN_RATE"` | no |
| reponse\_code\_threshold\_value | A value against which to compare the time series. | `string` | `"0"` | no |
| system\_lag\_exceeds\_alignment\_period | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | `"60s"` | no |
| system\_lag\_exceeds\_comparison | The comparison to apply between the time series and the threshold. Only COMPARISON\_LT and COMPARISON\_GT are supported currently. | `string` | `"COMPARISON_GT"` | no |
| system\_lag\_exceeds\_cross\_series\_reducer | The approach to be used to combine time series. | `string` | `"REDUCE_MEAN"` | no |
| system\_lag\_exceeds\_duration | The amount of time that a time series must violate the threshold to be considered failing. | `string` | `"180s"` | no |
| system\_lag\_exceeds\_per\_series\_aligner | The approach to be used to align individual time series. | `string` | `"ALIGN_MEAN"` | no |
| system\_lag\_exceeds\_threshold\_value | A value against which to compare the time series. | `string` | `"30.0"` | no |
| system\_lag\_increases\_alignment\_period | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | `"60s"` | no |
| system\_lag\_increases\_comparison | The comparison to apply between the time series and the threshold. Only COMPARISON\_LT and COMPARISON\_GT are supported currently. | `string` | `"COMPARISON_GT"` | no |
| system\_lag\_increases\_cross\_series\_reducer | The approach to be used to combine time series. | `string` | `"REDUCE_MEAN"` | no |
| system\_lag\_increases\_duration | The amount of time that a time series must violate the threshold to be considered failing. | `string` | `"0s"` | no |
| system\_lag\_increases\_per\_series\_aligner | The approach to be used to align individual time series. | `string` | `"ALIGN_MEAN"` | no |
| system\_lag\_increases\_threshold\_value | A value against which to compare the time series. | `string` | `"70.0"` | no |
| tribe\_project\_id | Project ID where the Monitoring resources will be created | `string` | n/a | yes |
| user\_labels | User labels for AlertPolicy objects | `map` | `{}` | no |
| watermark\_lag\_alignment\_period | The alignment period for per-time series alignment. If present, alignmentPeriod must be at least 60 seconds. | `string` | `"60s"` | no |
| watermark\_lag\_comparison | The comparison to apply between the time series and the threshold. Only COMPARISON\_LT and COMPARISON\_GT are supported currently. | `string` | `"COMPARISON_GT"` | no |
| watermark\_lag\_cross\_series\_reducer | The approach to be used to combine time series. | `string` | `"REDUCE_MEAN"` | no |
| watermark\_lag\_duration | The amount of time that a time series must violate the threshold to be considered failing. | `string` | `"300s"` | no |
| watermark\_lag\_per\_series\_aligner | The approach to be used to align individual time series. | `string` | `"ALIGN_MEAN"` | no |
| watermark\_lag\_threshold\_value | A value against which to compare the time series. | `string` | `"60.0"` | no |

## Outputs

No output.
