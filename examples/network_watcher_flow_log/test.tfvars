resource_names_map = {
  resource_group = {
    name       = "rg"
    max_length = 80
  }
  network_watcher = {
    name       = "nw"
    max_length = 80
  }
  network_security_group = {
    name       = "nsg"
    max_length = 80
  }
  storage_account = {
    name       = "sa"
    max_length = 24
  }
  network_watcher_flow_log = {
    name       = "fl"
    max_length = 80
  }
  log_analytics_workspace = {
    name       = "law"
    max_length = 80
  }
}
location = "centralus"
enabled  = true
retention_policy = {
  days    = 7
  enabled = true
}
sku                     = "PerGB2018"
logical_product_service = "testNwfl"
