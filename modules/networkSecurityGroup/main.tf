resource "azurerm_network_security_group" "apim_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_all" {
resource_group_name = var.resource_group_name
  name                        = "AllowAll"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.apim_nsg.name
}

# Associate NSG with APIM Subnet
resource "azurerm_subnet_network_security_group_association" "apim_nsg_assoc" {
  subnet_id                 = var.apisubnet_id  # Your APIM subnet
  network_security_group_id = azurerm_network_security_group.apim_nsg.id
}
resource "azurerm_network_security_group" "container_nsg" {
  name                = var.container_nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "allow_http" {
    resource_group_name = var.resource_group_name
  name                        = "AllowHTTP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.container_nsg.name
}
resource "azurerm_network_security_rule" "allow_https" {
    resource_group_name = var.resource_group_name
  name                        = "AllowHTTPS"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.container_nsg.name
}



# Associate NSG with Container App Subnet
resource "azurerm_subnet_network_security_group_association" "container_nsg_assoc" {
  subnet_id                 = var.container_subnet_id  # Your Container App subnet ID
  network_security_group_id = azurerm_network_security_group.container_nsg.id
}
