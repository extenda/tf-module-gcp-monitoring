# tf-module-gcp-monitoring

## Requirements

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
| clan\_name | The name of the clan | `string` | `""` | no |
| monitoring\_project\_id | Project ID to create monitoring resources in | `string` | `"hiiretail-monitoring-prod-6500"` | no |
| notification\_channels | List of notification channel IDs | `list` | `[]` | no |
| **project\_id** | Project ID to associate with monitoring resource | `string` | n/a | **yes** |
| uptime\_check\_alerts | Configuration for uptime check alerts | `any` | `[]` | no |
| **uptime\_checks** | The list of uptime checks configurations | `any` | n/a | **yes** |

## Outputs

| Name | Description |
|------|-------------|
| uptime\_check\_ids | The id of the uptime check |
| uptime\_check\_names | A unique resource name for UptimeCheckConfig |
