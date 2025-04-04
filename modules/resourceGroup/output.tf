output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.name.name
}

output "location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.name.location
}