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

output "network_watcher_id" {
  value       = data.azurerm_network_watcher.this.id
  description = "The ID of the Network Watcher."
}

output "network_watcher_name" {
  value       = data.azurerm_network_watcher.this.name
  description = "The name of the Network Watcher."
}

output "resource_group_name" {
  value       = module.resource_group.name
  description = "The name of the Resource Group."
}

output "id" {
  value       = module.network_watcher_flow_log.id
  description = "The ID of the Network watcher flow log instance."
}

output "name" {
  value       = module.network_watcher_flow_log.name
  description = "The name of the Network Watcher Flow Log."
}

output "network_security_group_id" {
  value       = module.network_security_group.network_security_group_id
  description = "The ID of the Network Security Group."
}
