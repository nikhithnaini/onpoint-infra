output "subnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.name.id
  
}
output "subnet_name" {
  description = "The name of the subnet."
  value       = azurerm_subnet.name.name
  
}
output "apisubnet_id" {
  description = "The ID of the subnet."
  value       = azurerm_subnet.subnet_apim.id
  
}