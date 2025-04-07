# --------------------------------------
# RESOURCE GROUP
# --------------------------------------
resource "azurerm_resource_group" "main" {
  name     = "rg-apim-containerapp-demo"
  location = "eastus"
}

# --------------------------------------
# VNET AND SUBNETS
# --------------------------------------
resource "azurerm_virtual_network" "main" {
  name                = "vnet-apim-containerapp-demo"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "apim" {
  name                 = "subnet-apim-demo"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "containerapp" {
  name                 = "subnet-containerapp-demo"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/23"]
}

# --------------------------------------
# NSG for APIM Subnet
# --------------------------------------
resource "azurerm_network_security_group" "apim_nsg" {
  name                = "nsg-apim-demo"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_network_security_rule" "apim_allow_all_required" {
  name                        = "Allow-Azure-APIM-All"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["80", "443", "3443"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.apim_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "apim_nsg_assoc" {
  subnet_id                 = azurerm_subnet.apim.id
  network_security_group_id = azurerm_network_security_group.apim_nsg.id
}

# --------------------------------------
# LOG ANALYTICS
# --------------------------------------
resource "azurerm_log_analytics_workspace" "main" {
  name                = "log-rg-apim-containerapp-demo"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# --------------------------------------
# CONTAINER APP ENVIRONMENT
# --------------------------------------
resource "azurerm_container_app_environment" "main" {
  name                             = "env-epic-containerapp-demo"
  location                         = azurerm_resource_group.main.location
  resource_group_name              = azurerm_resource_group.main.name
  log_analytics_workspace_id       = azurerm_log_analytics_workspace.main.id
  infrastructure_subnet_id         = azurerm_subnet.containerapp.id
  internal_load_balancer_enabled   = true
}

# --------------------------------------
# CONTAINER APP - NGINX
# --------------------------------------
resource "azurerm_container_app" "nginx" {
  name                         = "nginx-private-app-demo"
  container_app_environment_id = azurerm_container_app_environment.main.id
  resource_group_name          = azurerm_resource_group.main.name
  revision_mode                = "Single"

  template {
    container {
      name   = "nginx"
      image  = "nginx"
      cpu    = 0.5
      memory = "1.0Gi"
    }
  }

  ingress {
    external_enabled = false
    target_port      = 80
    transport        = "auto"

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  identity {
    type = "SystemAssigned"
  }
}

# --------------------------------------
# API MANAGEMENT
# --------------------------------------
resource "azurerm_api_management" "main" {
  name                         = "apim-epic-public-demo"
  location                     = azurerm_resource_group.main.location
  resource_group_name          = azurerm_resource_group.main.name
  publisher_name               = "NikhithDemo"
  publisher_email              = "nikhithnaini@gmail.com"
  sku_name                     = "Developer_1"

  virtual_network_type = "External"

  virtual_network_configuration {
    subnet_id = azurerm_subnet.apim.id
  }

  public_network_access_enabled = true

  identity {
    type = "SystemAssigned"
  }

  tags = {
    env = "dev"
  }
}

# --------------------------------------
# API MANAGEMENT API ROUTE TO NGINX CONTAINER APP
# --------------------------------------
resource "azurerm_api_management_api" "nginx_api" {
  name                    = "nginx-epic-api-demo"
  resource_group_name     = azurerm_resource_group.main.name
  api_management_name     = azurerm_api_management.main.name
  revision                = "1"
  display_name            = "Nginx API Demo"
  path                    = "nginx"
  protocols               = ["https"]
  subscription_required   = false

  # Update with actual internal FQDN from Azure CLI output
  service_url = "http://nginx-private-app-demo.internal.calmcliff-xxxxxx.eastus.azurecontainerapps.io"
}

resource "azurerm_api_management_api_operation" "nginx_root" {
  operation_id        = "get-root"
  api_name            = azurerm_api_management_api.nginx_api.name
  api_management_name = azurerm_api_management.main.name
  resource_group_name = azurerm_resource_group.main.name
  display_name        = "Get Root"
  method              = "GET"
  url_template        = "/"

  response {
    status_code = 200
    description = "Success"

    representation {
      content_type = "application/json"
    }
  }
}

# --------------------------------------
# PRIVATE DNS ZONE FOR CONTAINER APP
# --------------------------------------
resource "azurerm_private_dns_zone" "aca_dns" {
  name                = "private.containerapp.azure.com"
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "aca_dns_link" {
  name                  = "vnet-link-aca-dns"
  resource_group_name   = azurerm_resource_group.main.name
  private_dns_zone_name = azurerm_private_dns_zone.aca_dns.name
  virtual_network_id    = azurerm_virtual_network.main.id
  registration_enabled  = false
}

# --------------------------------------
# OUTPUT - APIM NGINX ENDPOINT
# --------------------------------------
output "apim_nginx_endpoint" {
  description = "Public APIM endpoint for nginx container app"
  value       = "${azurerm_api_management.main.gateway_url}/nginx/"
}
