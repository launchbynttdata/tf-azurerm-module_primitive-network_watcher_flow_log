// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "network_watcher_flow_log" {
  source = "../.."

  network_watcher_flow_log_name = local.network_watcher_flow_log_name
  network_watcher_name          = module.network_watcher.name
  resource_group_name           = module.resource_group.name
  network_security_group_id     = module.network_security_group.network_security_group_id
  storage_account_id            = module.storage_account.id
  enabled                       = var.enabled
  retention_policy              = var.retention_policy
  traffic_analytics             = local.traffic_analytics

  depends_on = [module.storage_account, module.network_security_group, module.network_watcher, module.resource_group, module.log_analytics_workspace]

}
module "network_security_group" {
  source = "git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-network_security_group.git?ref=1.0.0"

  name                = local.network_security_group_name
  location            = var.location
  resource_group_name = module.resource_group.name

  depends_on = [module.resource_group]
}


module "storage_account" {
  source = "git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-storage_account.git?ref=1.0.0"

  storage_account_name = local.storage_account_name
  resource_group_name  = module.resource_group.name
  location             = var.location

  account_tier              = var.account_tier
  account_kind              = var.account_kind
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = var.enable_https_traffic_only

  depends_on = [module.resource_group]

}


module "network_watcher" {
  source = "git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-network_watcher.git?ref=1.0.0"

  network_watcher_name = local.network_watcher_name
  location             = var.location
  resource_group_name  = module.resource_group.name

  depends_on = [module.resource_group]
}

module "resource_group" {
  source = "git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-resource_group.git?ref=1.0.0"

  name     = local.resource_group_name
  location = var.location
  tags = {
    resource_name = local.resource_group_name
  }
}

module "log_analytics_workspace" {
  source = "git::https://github.com/launchbynttdata/tf-azurerm-module_primitive-log_analytics_workspace.git?ref=1.0.0"

  name                = local.log_analytics_workspace_name
  location            = var.location
  resource_group_name = module.resource_group.name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
  identity            = var.identity

  depends_on = [module.resource_group]
}

module "resource_names" {
  source = "git::https://github.com/launchbynttdata/tf-launch-module_library-resource_name.git?ref=1.0.0"

  for_each = var.resource_names_map

  region                  = join("", split("-", var.location))
  class_env               = var.class_env
  cloud_resource_type     = each.value.name
  instance_env            = var.instance_env
  instance_resource       = var.instance_resource
  maximum_length          = each.value.max_length
  logical_product_family  = var.logical_product_family
  logical_product_service = var.logical_product_service
}
