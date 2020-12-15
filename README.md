# tf-module-gcp-monitoring

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| clan\_name | The name of the clan | `string` | n/a | yes |
| clan\_project\_id | Clan Project ID | `string` | n/a | yes |
| cloudfunction\_monitoring | If the Cloud Function dashboards and alerts should be created | `bool` | `false` | no |
| cloudrun\_monitoring | If the Cloud Run dashboards and alerts should be created | `bool` | `false` | no |
| cloudsql\_monitoring | If the Cloud SQL dashboards and alerts should be created | `bool` | `false` | no |
| dataflow\_monitoring | If the Dataflow dashboards and alerts should be created | `bool` | `false` | no |
| firestore\_monitoring | If the Firestore dashboards and alerts should be created | `bool` | `false` | no |
| memorystore\_monitoring | If the Memorystore dashboards and alerts should be created | `bool` | `false` | no |
| notification\_channels | List of notificaton channel IDs | `list` | `[]` | no |
| pubsub\_monitoring | If the Pub/Sub dashboards and alerts should be created | `bool` | `false` | no |
| tribe\_project\_id | Project ID where the Monitoring resources will be created | `string` | n/a | yes |

## Outputs

No output.
