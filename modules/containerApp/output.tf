output "fqdn" {
  description = "The FQDN of the container app."
  value       = azurerm_container_app.example.latest_revision_fqdn
  
}