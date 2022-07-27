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
| monitoring\_project\_id | Project ID to create monitoring resources in | `string` | "hiiretail-monitoring-prod-6500" | no |
| notification\_channels | List of notificaton channel IDs | `list` | `[]` | no |
| **project\_id** | Project ID to associate with uptime check | `string` | n/a | **yes** |
| uptime\_check\_alerts | Configuration for uptime check alerts | `any` | `[]` | no |
| **uptime\_checks** | The list of uptime checks configurations | `any` | n/a | **yes** |

**uptime_checks** supported attributes:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **service\_name** | The name of the service for which uptimecheck will be created | string | n/a | **yes** |
| timeout | The maximum amount of time to wait for the request to complete (must be between 1 and 60 seconds) | string | "10s" | no |
| period | How often, in seconds, the uptime check is performed. Currently, the only supported values are 60s (1 minute), 300s (5 minutes), 600s (10 minutes), and 900s (15 minutes) | string | "60s" | no |
| **check\_type** | Contains information needed to make an HTTP or HTTPS check. Supported values are HTTP and HTTPS | string | n/a | **yes** |
| type | The monitored resource type | string | "uptime_url" | no |
| **hostname** | Host name to create an uptime check for | string | n/a | **yes** |
| headers | The list of headers to send as part of the uptime check request. The maximum number of headers allowed is 100 | map(string) | null | no |
| body | The request body associated with the HTTP POST request | string | null | no |
| content\_type | The content type to use for the check. Possible values are TYPE_UNSPECIFIED and URL_ENCODED | string | null | no |
| **path** | The path to the page to run the check against. Will be combined with the host and port to construct the full URL | string | n/a | **yes** |
| password | The password to authenticate, if authentication is needed | string | null | no |
| username | The username to authenticate,if authentication is needed | string | null | no |
| request\_method | The HTTP request method to use for the check. Possible values are METHOD_UNSPECIFIED, GET, and POST. | string | "GET" | no |
| port | The port to the page to run the check against. Will be combined with host and path to construct the full URL | string | 80 without SSL, 443 with SSL | no |
| use\_ssl | If true, use HTTPS instead of HTTP to run the check | for `check_type` HTTPS = true, HTTP = false | bool | no |
| validate\_ssl | Boolean specifying whether to include SSL certificate validation as a part of the Uptime check | for `check_type` HTTPS = true, HTTP = false | bool | no |
| regions | The list of regions from which the check will be run | list(string) | [] ("Global") | no |
| content | String or regex content to match (max 1024 bytes) | string | null | no |
| matcher | The type of content matcher that will be applied to the server output, compared to the content string when the check is run. Possible values are CONTAINS_STRING, NOT_CONTAINS_STRING, MATCHES_REGEX, NOT_MATCHES_REGEX, MATCHES_JSON_PATH, and NOT_MATCHES_JSON_PATH | string | null | no |
| json\_path | JSONPath within the response output pointing to the expected ContentMatcher::content to match against | string | null | no |
| json\_matcher | Options to perform JSONPath content matching. Possible values are EXACT_MATCH and REGEX_MATCH | string | null | no |

**uptime\_check\_alerts** supported attributes:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| **service\_name** | The name of the service for which allert will be created | string | n/a | **yes** |
| uptime\_duration | The amount of time that a time series must fail to report new data to be considered failing. Currently, only values that are a multiple of a minute--e.g. 60s, 120s, or 300s -- are supported | string | "300s" | no |
| threshold | A value against which to compare the time series | number | 1 | no |
| labels |  This field is intended to be used for organizing and identifying the AlertPolicy objects.The field can contain up to 64 entries. Labels and values can contain only lowercase letters, numerals, underscores, and dashes. Keys must begin with a letter | map(string) | [] | no |

## Outputs

| Name | Description |
|------|-------------|
| uptime\_check\_ids | The id of the uptime check |
| uptime\_check\_names | A unique resource name for UptimeCheckConfig |
