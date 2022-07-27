## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.18 |
| google | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **display\_name** | Display name of the custom service | `string` | n/a | **yes** |
| monitoring\_project\_id | Project ID to create monitoring resources in | `string` | `"hiiretail-monitoring-prod-6500"` | no |
| project\_id | Project ID to create SLOs in | `string` | `"hiiretail-monitoring-prod-6500"` | no |
| **slo\_config** | Configuration for SLO | `any` | n/a | **yes** |

## Outputs

| Name | Description |
|------|-------------|
| custom\_service | The custom service |
| slos | The SLOs |
