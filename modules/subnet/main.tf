resource "azurerm_subnet" "name" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_prefixes

#   delegation {
#   name = "containerappdelegation"

#   service_delegation {
#     name = "Microsoft.App/environments"
#     actions = [
#         "Microsoft.Network/virtualNetworks/subnets/join/action"
#       ]
#   }
# }
}
resource "azurerm_subnet" "subnet_apim" {
  
  name                 = var.api_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.api_subnet_address_prefixes
}