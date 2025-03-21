resource "azurerm_log_analytics_workspace" "example" {
  name                = var.logWorkspaceName
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    for key, value in var.tags : key => value
  }
}