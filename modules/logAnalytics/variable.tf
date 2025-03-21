variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string 
  
}
variable "logWorkspaceName" {
  description = "The name of the Log Analytics Workspace"
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
