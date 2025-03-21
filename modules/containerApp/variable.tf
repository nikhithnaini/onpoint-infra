variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string 
  
}
variable "containerName" {
  description = "The name of the container"
  type        = string
  
}
variable "acrName" {
  description = "The name of the environment"
  type        = string
  
}
variable "container_app_environment_id" {
  description = "The ID of the Log Analytics Workspace"
  type        = string
  
}

variable "tags" {
  description = "A map of tags to add to the resource group"
  type        = map(string)
}
variable "app_insights_connection_string" {
  description = "The connection string of the Application Insights instance"
  type        = string
  
}
