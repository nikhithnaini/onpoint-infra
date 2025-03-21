resource "azurerm_container_registry" "acr" {
  name                = var.acrName
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
  tags = {
    for key, value in var.tags : key => value
  }
  
}