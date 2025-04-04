# output "app_insights_connection_string" {
#   description = "The Application Insights connection string"
#   value       = azurerm_application_insights.example.connection_string
# }
output "subnet_id" {
  description = "The ID of the subnet."
  value       = module.subnet.subnet_id
  
}
output "fqdn" {
  description = "The FQDN of the container app."
  value       = module.containerApp.fqdn
  
}
output "public_url" {
  description = "The public URL of the API Management service."
  value       = module.apiManagement.apim_public_url
}
  
  
