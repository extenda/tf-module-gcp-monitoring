# Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.18 |
| google | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| google | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| monitoring\_project\_id | Project ID to create monitoring resources in | `string` | `hiiretail-monitoring-prod-6500` | no |
| **display\_name** | Name of the service | `string` | n/a | **yes** |

## Outputs

| Name | Description |
|------|-------------|
| custom\_service | The custom service |
| slos | The SLOs |
