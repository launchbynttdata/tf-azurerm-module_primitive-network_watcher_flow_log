# tf-azurerm-module_primitive-network_watcher_flow_log

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | <= 1.5.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.77 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network_watcher_flow_log"></a> [network\_watcher\_flow\_log](#module\_network\_watcher\_flow\_log) | ../.. | n/a |
| <a name="module_network_security_group"></a> [network\_security\_group](#module\_network\_security\_group) | git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-network_security_group.git | 1.0.0 |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-storage_account.git | 1.0.0 |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-network_watcher.git | 1.0.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-resource_group.git | 1.0.0 |
| <a name="module_log_analytics_workspace"></a> [log\_analytics\_workspace](#module\_log\_analytics\_workspace) | git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-log_analytics_workspace.git | 1.0.0 |
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | git::https://github.com/launchbynttdata/tf-launch-module_library-resource_name.git | 1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-launch-module\_library-resource\_name to generate resource names | <pre>map(object({<br>    name       = string<br>    max_length = optional(number, 60)<br>  }))</pre> | `{}` | no |
| <a name="input_instance_env"></a> [instance\_env](#input\_instance\_env) | Number that represents the instance of the environment. | `number` | `0` | no |
| <a name="input_instance_resource"></a> [instance\_resource](#input\_instance\_resource) | Number that represents the instance of the resource. | `number` | `0` | no |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | (Required) Name of the product family for which the resource is created.<br>    Example: org\_name, department\_name. | `string` | `"launch"` | no |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | (Required) Name of the product service for which the resource is created.<br>    For example, backend, frontend, middleware etc. | `string` | `"network"` | no |
| <a name="input_class_env"></a> [class\_env](#input\_class\_env) | (Required) Environment where resource is going to be deployed. For example. dev, qa, uat | `string` | `"dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region to use | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Is the Network Watcher Flow Log enabled? | `bool` | `true` | no |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | The retention policy for the Network Watcher Flow Log | <pre>object({<br>    enabled = bool<br>    days    = number<br>  })</pre> | `null` | no |
| <a name="input_interval_in_minutes"></a> [interval\_in\_minutes](#input\_interval\_in\_minutes) | The interval in minutes which the Network Watcher Flow Log will be sent. | `number` | `60` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Defines the Tier to use for this storage account. Valid options are Standard and Premium. | `string` | `"Standard"` | no |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | Defines the Kind to use for this storage account. Valid options are Storage, StorageV2, BlobStorage, FileStorage, BlockBlobStorage. | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS. | `string` | `"LRS"` | no |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | Allows https traffic only to storage service if set to true. | `bool` | `true` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018. | `string` | `"Free"` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | (Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730. | `number` | `"30"` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) A identity block as defined below. | <pre>object({<br>    type = string<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | The ID of the Network Watcher. |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | The name of the Network Watcher. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the Resource Group. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Network watcher flow log instance. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Network Watcher Flow Log. |
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | The ID of the Network Security Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
