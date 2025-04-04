output "apim_public_url" {
  value = "${azurerm_api_management.apim.gateway_url}/container"
}
