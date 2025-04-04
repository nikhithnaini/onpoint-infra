resource "azurerm_container_app_environment" "example" {
  name                       = var.envName
  location                   = var.location
  resource_group_name        = var.resource_group_name
  logs_destination           = "log-analytics"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  infrastructure_subnet_id = var.infrastructure_subnet_id
}