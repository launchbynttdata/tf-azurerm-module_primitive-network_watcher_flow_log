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

resource "azurerm_network_watcher_flow_log" "network_watcher_flow_log" {

  name                 = var.network_watcher_flow_log_name
  network_watcher_name = var.network_watcher_name
  resource_group_name  = var.resource_group_name

  network_security_group_id = var.network_security_group_id
  storage_account_id        = var.storage_account_id
  enabled                   = var.enabled

  dynamic "retention_policy" {
    for_each = var.retention_policy != null ? [var.retention_policy] : []

    content {
      enabled = retention_policy.value.enabled
      days    = retention_policy.value.days
    }
  }

  dynamic "traffic_analytics" {
    for_each = var.traffic_analytics != null ? [var.traffic_analytics] : []

    content {
      enabled               = traffic_analytics.value.enabled
      workspace_id          = traffic_analytics.value.workspace_id
      workspace_region      = traffic_analytics.value.workspace_region
      workspace_resource_id = traffic_analytics.value.workspace_resource_id
      interval_in_minutes   = traffic_analytics.value.interval_in_minutes
    }
  }

  tags = local.tags
}
