resource "azurerm_application_insights" "example" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = var.log_analytics_workspace_id
  tags = {
    for key, value in var.tags : key => value
  }
  application_type    = "web"
}