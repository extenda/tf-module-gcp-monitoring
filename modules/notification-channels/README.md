# tf-module-gcp-monitoring

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| clan\_name | The name of the clan | `string` | n/a | yes |
| clan\_group\_email | GSuite email of the clan group | `string` | `""` | no |
| clan\_slack\_channel | The slack channel for alerts | `string` | `""` | no |
| project\_id\_slack\_token | Project ID where an authorization token for a notification channel is stored | `string` | `""` | no |
| tribe\_project\_id | Project ID where the Monitoring resources will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| notification\_channels | The list of notification channels |
