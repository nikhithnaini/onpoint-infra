output "app_insights_connection_string" {
  description = "The name of the Application Insights instance"
  value       = azurerm_application_insights.example.connection_string
}