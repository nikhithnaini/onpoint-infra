resource "azurerm_api_management" "apim" {
  name                = var.apiname
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = "Test Company"
  publisher_email     = "admin@test.com"
  sku_name            = "Developer_1"

  virtual_network_configuration {
    subnet_id = var.apisubnet_id
  }
  virtual_network_type = "External"
}

resource "azurerm_api_management_api" "api" {
  name                     = "container-api-04"
  resource_group_name      = var.resource_group_name
  api_management_name      = azurerm_api_management.apim.name
  revision                 = "1"
  display_name             = "Container API"
  path                     = "container"
  protocols                = ["https"]
  subscription_required    = false  # 🔓 Disable subscription key for testing
}

resource "azurerm_api_management_api_operation" "get_root" {
  operation_id             = "get-root"
  api_name                 = azurerm_api_management_api.api.name
  api_management_name      = azurerm_api_management.apim.name
  resource_group_name      = var.resource_group_name
  display_name             = "Get Root"
  method                   = "GET"
  url_template             = "/"  # This matches container's root path

  response {
    status_code = 200
    description = "Successful response"
  }

  request {}
}

resource "azurerm_api_management_api_operation_policy" "root_policy" {
  operation_id             = azurerm_api_management_api_operation.get_root.operation_id
  api_name                 = azurerm_api_management_api.api.name
  api_management_name      = azurerm_api_management.apim.name
  resource_group_name      = var.resource_group_name

  xml_content = <<XML
<policies>
  <inbound>
    <base />
    <set-backend-service base-url="http://${var.fqdn}" />
  </inbound>
  <backend>
    <base />
  </backend>
  <outbound>
    <base />
  </outbound>
</policies>
XML
}
