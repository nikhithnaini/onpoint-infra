variable "app_insights_name" {
  description = "The name of the Application Insights instance"
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  
}
variable "location" {
  description = "The location of the resource group"
  type        = string
  
}
variable "tags" {
  description = "A map of tags to add to the resource group"
  type        = map(string)
  
}
variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace"
  type        = string
  
}
