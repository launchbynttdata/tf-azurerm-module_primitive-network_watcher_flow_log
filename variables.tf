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

variable "network_watcher_flow_log_name" {
  type        = string
  description = "The name of the Network Watcher Flow Log"
}

variable "network_watcher_name" {
  type        = string
  description = "The name of the Network Watcher"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the Network Watcher Flow Log will be created"
}

variable "network_security_group_id" {
  type        = string
  description = "The ID of the Network Security Group to which the Network Watcher Flow Log will be applied"
}

variable "storage_account_id" {
  type        = string
  description = "The ID of the Storage Account in which the Network Watcher Flow Log will be stored"
}

variable "enabled" {
  type        = bool
  description = "Is the Network Watcher Flow Log enabled?"
  default     = true
}

variable "retention_policy" {
  description = "The retention policy for the Network Watcher Flow Log"
  type = object({
    enabled = bool
    days    = number
  })
  default = null
}

variable "traffic_analytics" {
  description = "The traffic analytics settings for the Network Watcher Flow Log"
  type = object({
    enabled               = bool
    workspace_id          = string
    workspace_region      = string
    workspace_resource_id = string
    interval_in_minutes   = number
  })
  default = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}
