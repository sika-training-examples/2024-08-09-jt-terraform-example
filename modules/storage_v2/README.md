## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_blob_storage"></a> [blob\_storage](#input\_blob\_storage) | Details of the storage accounts and their containers | <pre>map(object({<br>    resource_group_name       = string<br>    location                  = string<br>    account_tier              = string<br>    account_replication_type  = string<br>    shared_access_key_enabled = bool<br>    blob_properties = optional(object({<br>      delete_retention_policy_days           = number<br>      versioning_enabled                     = bool<br>      change_feed_enabled                    = bool<br>      restore_policy_days                    = number<br>      container_delete_retention_policy_days = number<br>    }))<br>    management_policy_rules = optional(list(object({<br>      name         = string<br>      prefix_match = list(string)<br>      base_blob = optional(object({<br>        tier_to_cool_days                    = number<br>        tier_to_archive_days                 = number<br>        delete_after_days_since_modification = number<br>      }))<br>      snapshot_age = optional(number)<br>      version_age  = optional(number)<br>    })))<br>    tags = map(string)<br>    containers = list(object({<br>      name                  = string<br>      container_access_type = string<br>    }))<br>    logs_to_monitor            = list(string)<br>    metrics_to_monitor         = list(string)<br>    log_analytics_workspace_id = string<br>  }))</pre> | `{}` | no |

## Outputs

No outputs.
